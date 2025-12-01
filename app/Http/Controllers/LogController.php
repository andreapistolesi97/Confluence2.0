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
                'current' => null,       // nessun log scelto
                'rows'    => collect(),  // tabella vuota
            ]);
        }

        // id scelto dall'utente (se c'è)
        $selectedId = $request->input('log');   // GET o POST, come vuoi

        // Se l'utente ha scelto qualcosa -> prendo quella riga
        // Se NON ha scelto nulla -> rimane null
        $current = $sources->firstWhere('id', $selectedId);

        if ($current) {
            // ho un log selezionato -> carico le righe
            $rows = DB::table($current->table_name)->get();
        } else {
            // nessun log selezionato -> tabella vuota
            $rows = collect();
        }

        return view('logs.schedulerlogs', [
            'title'   => 'Scheduler Logs',
            'sources' => $sources,
            'current' => $current,   // può essere null
            'rows'    => $rows,      // vuoto se current null
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
            $rows = DB::table($current->table_name)->get();
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
