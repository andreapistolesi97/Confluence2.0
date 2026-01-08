<?php

namespace App\Http\Controllers;

use App\Models\LogSource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class LogController extends Controller
{
    public function scheduler(Request $request)
    {
        $sources = LogSource::where('type', 'scheduler')->get();

        if ($sources->isEmpty()) {
            return view('logs.schedulerlogs', [
                'title'   => 'Scheduler Logs',
                'sources' => $sources,
                'current' => null,
                'rows'    => collect(),
            ]);
        }

        $selectedId = $request->input('log');


        $current = $sources->firstWhere('id', $selectedId);

        if ($current) {
            $rows = DB::table($current->table_name)
            ->orderByDesc('Timestamp-UTC')
            ->get();
        } else {
            $rows = collect();
        }

        return view('logs.schedulerlogs', [
            'title'   => 'Scheduler Logs',
            'sources' => $sources,
            'current' => $current,
            'rows'    => $rows,
        ]);
    }


    public function production(Request $request)
    {
        $sources = LogSource::where('type', 'production')->get();

        if ($sources->isEmpty()) {
            return view('logs.productionlogs', [
                'title'   => 'Production Logs',
                'sources' => $sources,
                'current' => null,
                'rows'    => collect(),
            ]);
        }

        $selectedId = $request->input('log');

        $current = $sources->firstWhere('id', $selectedId);


        if ($current) {
            $rows = DB::table($current->table_name)
            ->orderByDesc('Timestamp-UTC')
            ->get();
        } else {
            $rows = collect();
        }

        return view('logs.productionlogs', [
            'title'   => 'Production Logs',
            'sources' => $sources,
            'current' => $current,
            'rows'    => $rows,
        ]);
    }

    public function sims(Request $request)
    {
        $sources = LogSource::where('type', 'sims')->get();

        if ($sources->isEmpty()) {
            return view('logs.simslogs', [
                'title'   => 'SIMs Logs',
                'sources' => $sources,
                'current' => null,
                'rows'    => collect(),
            ]);
        }

        $selectedId = $request->input('log');

        $current = $sources->firstWhere('id', $selectedId);

        if ($current) {
            $rows = DB::table($current->table_name)->get();
        } else {
            $rows = collect();
        }

        return view('logs.simslogs', [
            'title'   => 'SIMs Logs',
            'sources' => $sources,
            'current' => $current,
            'rows'    => $rows,
        ]);
    }
}
