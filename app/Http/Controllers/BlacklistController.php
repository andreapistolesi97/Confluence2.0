<?php

namespace App\Http\Controllers;

use App\Models\BusinessDriver;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class BlacklistController extends Controller
{
    public function export(Request $request)
    {
        $data = $request->validate([
            'business_driver_id' => ['required', 'integer', 'exists:business_drivers,id'],
        ]);

        $driver = BusinessDriver::findOrFail($data['business_driver_id']);

        $dbName = $driver->db_name;
        if (!$dbName) {
            abort(500, 'db_name missing for selected driver');
        }

        $rows = DB::table($dbName . '.Blacklists')
            ->select(['email', 'phone', 'timestamp'])
            ->orderByDesc('email')
            ->get();

        $safeName = preg_replace('/\s+/', '_', strtolower($driver->driver_name));
        $filename = "Blacklist_{$safeName}.csv";

        return response()->streamDownload(function () use ($rows) {
            $out = fopen('php://output', 'w');

            fputcsv($out, ['email', 'phone', 'timestamp']);

            foreach ($rows as $r) {
                fputcsv($out, [
                    $r->email ?? '',
                    $r->phone ?? '',
                    $r->timestamp ?? '',
                ]);
            }

            fclose($out);
        }, $filename, [
            'Content-Type' => 'text/csv; charset=UTF-8',
        ]);
    }

    public function import(Request $request)
    {
        $data = $request->validate([
            'business_driver_ids' => ['required', 'array', 'min:1'],
            'business_driver_ids.*' => ['integer', 'exists:business_drivers,id'],
            'format' => ['required', 'in:plain,md5,sha256'],
            'file' => ['required', 'file', 'mimes:csv,txt', 'max:5120'],
        ]);

        $driverIds = array_values(array_filter(
            $data['business_driver_ids'],
            fn ($id) => (int) $id !== 1
        ));

        if (count($driverIds) === 0) {
            return back()->withErrors([
                'business_driver_ids' => 'Select at least one real Business Driver (not All).'
            ]);
        }

        $drivers = BusinessDriver::whereIn('id', $driverIds)->get();

        $filePath = $request->file('file')->getRealPath();
        $handle = fopen($filePath, 'r');
        if (!$handle) {
            abort(500, 'Cannot read uploaded file');
        }

        $header = fgetcsv($handle);
        if (!$header) {
            fclose($handle);
            return back()->withErrors(['file' => 'CSV empty or invalid']);
        }

        $header = array_map(fn ($h) => Str::of($h)->lower()->trim()->toString(), $header);
        $emailIdx = array_search('email', $header, true);
        $phoneIdx = array_search('phone', $header, true);

        if ($emailIdx === false && $phoneIdx === false) {
            fclose($handle);
            return back()->withErrors(['file' => 'CSV must contain at least "email" or "phone" column']);
        }

        $normEmail = function ($v) {
            $v = trim((string) $v);
            return $v === '' ? null : mb_strtolower($v);
        };

        $normPhone = function ($v) {
            $v = trim((string) $v);
            if ($v === '') return null;
            $clean = preg_replace('/[^\d+]/', '', $v);
            return $clean === '' ? null : $clean;
        };

        $isValidHash = function (?string $v, string $format) {
            if (!$v) return true;
            if ($format === 'md5') return (bool) preg_match('/^[a-f0-9]{32}$/i', $v);
            if ($format === 'sha256') return (bool) preg_match('/^[a-f0-9]{64}$/i', $v);
            return true;
        };

        $rows = [];
        while (($row = fgetcsv($handle)) !== false) {
            $email = $emailIdx !== false ? ($row[$emailIdx] ?? '') : '';
            $phone = $phoneIdx !== false ? ($row[$phoneIdx] ?? '') : '';

            if ($data['format'] === 'plain') {
                $email = $normEmail($email);
                $phone = $normPhone($phone);
            } else {
                $email = trim((string) $email);
                $phone = trim((string) $phone);
                $email = $email === '' ? null : $email;
                $phone = $phone === '' ? null : $phone;
            }

            if (!$email && !$phone) continue;

            if (!$isValidHash($email, $data['format']) || !$isValidHash($phone, $data['format'])) {
                fclose($handle);
                return back()->withErrors([
                    'file' => "CSV values do not match selected format ({$data['format']})."
                ]);
            }

            $rows[] = ['email' => $email, 'phone' => $phone];
        }

        fclose($handle);

        if (count($rows) === 0) {
            return back()->withErrors(['file' => 'No valid rows found in CSV']);
        }

        $insertedTotal = 0;
        $skippedTotal = 0;

        foreach ($drivers as $driver) {
            $dbName = $driver->db_name;
            if (!$dbName) continue;

            $table = $dbName . '.Blacklists';

            foreach ($rows as $r) {
                $email = $r['email'];
                $phone = $r['phone'];

                $exists = DB::table($table)
                    ->where(function ($q) use ($email, $phone) {
                        if ($email) $q->orWhere('email', $email);
                        if ($phone) $q->orWhere('phone', $phone);
                    })
                    ->exists();

                if ($exists) {
                    $skippedTotal++;
                    continue;
                }

                DB::table($table)->insert([
                    'email' => $email,
                    'phone' => $phone,
                    'timestamp' => now(),
                ]);

                $insertedTotal++;
            }
        }

        return back()->with('import_result',
            "Imported: <b>{$insertedTotal}</b> — Skipped duplicates: <b>{$skippedTotal}</b> — Format: <b>{$data['format']}</b>"
        );
    }
}
