<?php

namespace App\Http\Controllers;

use App\Models\BusinessDriver;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Database\QueryException;

class BlacklistController extends Controller
{
    public function export(Request $request)
    {
        // LOG click export
        activity('User Action')
            ->causedBy($request->user())
            ->performedOn($request->user())
            ->withProperties([
                'action'  => 'blacklist_export',
                'filters' => $request->except(['_token']),
            ])
            ->event('button_clicked')
            ->log('User clicked Export Blacklist');

        $data = $request->validate([
            'business_driver_id' => ['required', 'integer', 'exists:business_drivers,id'],
        ]);

        $driver = BusinessDriver::findOrFail($data['business_driver_id']);

        $dbName = trim((string) $driver->db_name);
        if (!$dbName) abort(500, 'db_name missing for selected driver');

        $rows = DB::table($dbName . '.Blacklists')
            ->select(['email', 'phone', 'timestamp'])
            ->orderByDesc('timestamp')
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
        // LOG click import
        activity('User Action')
            ->causedBy($request->user())
            ->performedOn($request->user())
            ->withProperties([
                'action'  => 'blacklist_import',
                'filters' => $request->except(['_token', 'file']), 
            ])
            ->event('button_clicked')
            ->log('User clicked Import Blacklist');

        $data = $request->validate([
            'business_driver_ids'   => ['required', 'array', 'min:1'],
            'business_driver_ids.*' => ['integer', 'exists:business_drivers,id'],
            'format'                => ['required', 'in:plain,md5,sha256'],
            'file'                  => ['required', 'file', 'mimes:csv,txt', 'max:5120'],
        ]);

        $selectedIds = array_map('intval', $data['business_driver_ids']);

        if (in_array(1, $selectedIds, true)) {
            $drivers = BusinessDriver::where('id', '!=', 1)->get();
        } else {
            $drivers = BusinessDriver::whereIn('id', $selectedIds)->get();
        }

        if ($drivers->count() === 0) {
            return back()->withErrors([
                'business_driver_ids' => 'Select at least one Business Driver.'
            ]);
        }

        $filePath = $request->file('file')->getRealPath();
        $handle = fopen($filePath, 'r');
        if (!$handle) abort(500, 'Cannot read uploaded file');

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

        $normEmail = fn ($v) => ($t = trim((string) $v)) === '' ? null : mb_strtolower($t);
        $normPhone = function ($v) {
            $t = trim((string) $v);
            if ($t === '') return null;
            $clean = preg_replace('/[^\d+]/', '', $t);
            return $clean === '' ? null : $clean;
        };

        $isValidHash = function (?string $v, string $format) {
            if (!$v) return true;
            if ($format === 'md5') return (bool) preg_match('/^[a-f0-9]{32}$/i', $v);
            if ($format === 'sha256') return (bool) preg_match('/^[a-f0-9]{64}$/i', $v);
            return true;
        };

        $unique = [];
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

            $key = ($email ?? '') . '|' . ($phone ?? '');
            $unique[$key] = ['email' => $email, 'phone' => $phone];
        }
        fclose($handle);

        $rows = array_values($unique);
        if (count($rows) === 0) {
            return back()->withErrors(['file' => 'No valid rows found in CSV']);
        }

        $insertedTotal = 0;
        $skippedTotal  = 0;
        $errors = [];

        foreach ($drivers as $driver) {
            $dbName = trim((string) $driver->db_name);
            if (!$dbName) {
                $errors[] = "Driver {$driver->driver_name}: db_name missing";
                continue;
            }

            $table = $dbName . '.Blacklists';

            $batch = [];
            foreach ($rows as $r) {
                $batch[] = [
                    'email'     => $r['email'],
                    'phone'     => $r['phone'],
                    'timestamp' => now(),
                ];
            }

            try {
                $before = $insertedTotal;

                $affected = DB::table($table)->insertOrIgnore($batch);
                $insertedTotal += (int) $affected;
                $skippedTotal  += (count($batch) - (int) $affected);

            } catch (QueryException $e) {
                $errors[] = "Driver {$driver->driver_name} ({$dbName}): {$e->getCode()} {$e->getMessage()}";
                continue;
            }
        }

        $msg = "Imported: <b>{$insertedTotal}</b> — Skipped duplicates: <b>{$skippedTotal}</b> — Format: <b>{$data['format']}</b>";

        if (!empty($errors)) {
            $msg .= "<br><br><b>Errors on some drivers:</b><br><ul class='list-disc pl-5'>";
            foreach ($errors as $err) {
                $msg .= "<li>" . e($err) . "</li>";
            }
            $msg .= "</ul>";
        }

        return back()->with('import_result', $msg);
    }
}
