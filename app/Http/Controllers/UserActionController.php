<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserActionController extends Controller
{
    public function autocouplingRun(Request $request)
    {
        $user = $request->user();

        activity('User Action')
            ->causedBy($user)
            ->performedOn($user)
            ->withProperties([
                'action'  => 'autocoupling_run_filters',
                'filters' => $request->except('_token'),
            ])
            ->event('button_clicked')
            ->log('User clicked Auto Coupling Run Filters');

        $params = $request->except('_token');

        return redirect()->route('autocoupling.filter', $params);
    }

    public function productionlogsRun(Request $request)
    {
        $user = $request->user();

        activity('User Action')
            ->causedBy($user)
            ->performedOn($user)
            ->withProperties([
                'action'  => 'productionlogs_view_filters',
                'filters' => $request->except('_token'),
            ])
            ->event('button_clicked')
            ->log('User clicked Production Logs Filters');

        $params = $request->except('_token');

        return redirect()->route('productionlogs', $params);
    }

    public function schedulerlogsRun(Request $request)
    {
        $user = $request->user();

        activity('User Action')
            ->causedBy($user)
            ->performedOn($user)
            ->withProperties([
                'action'  => 'schedulerlogs_view_filters',
                'filters' => $request->except('_token'),
            ])
            ->event('button_clicked')
            ->log('User clicked Scheduler Logs Filters');

        $params = $request->except('_token');

        return redirect()->route('schedulerlogs', $params);
    }
    public function diagnosticslogRun(Request $request)
    {
        $user = $request->user();

        activity('User Action')
            ->causedBy($user)
            ->performedOn($user)
            ->withProperties([
                'action'  => 'diagnosticslogs_view_filters',
                'filters' => $request->except('_token'),
            ])
            ->event('button_clicked')
            ->log('User clicked Diagnostics Logs Filters');

        $params = $request->except('_token');


        return redirect()->route('diagnosticslogs', $params);
    }
    public function realtimemonitoringlogRun(Request $request)
    {
        $user = $request->user();

        activity('User Action')
            ->causedBy($user)
            ->performedOn($user)
            ->withProperties([
                'action'  => 'realtimemonitoringlog_view_filters',
                'filters' => $request->except('_token'),
            ])
            ->event('button_clicked')
            ->log('User clicked Real Time Monitoring Logs Filters');

        $params = $request->except('_token');

        return redirect()->route('realtimemonitoring', $params);
    }
    public function refreshLogRun(Request $request)
    {
        $user = $request->user();

        activity('User Action')
            ->causedBy($user)
            ->performedOn($user)
            ->withProperties(['action' => 'realtimemonitoringlog_refresh'])
            ->event('button_clicked')
            ->log('User clicked Monitoring Refresh Logs');

        if ($request->expectsJson()) {
            return response()->json(['ok' => true]);
        }

        return redirect()->route('realtimemonitoring');
    }

    public function searchcontactsLog(Request $request)
    {
        $user = $request->user();

        activity('User Action')
            ->causedBy($user)
            ->performedOn($user)
            ->withProperties([
                'action'  => 'searchcontacts_perform_search',
                'filters' => $request->except('_token'),
            ])
            ->event('button_clicked')
            ->log('User clicked Search Contacts Check List');

        if ($request->expectsJson()) {
            return response()->json(['ok' => true]);
        }

        return redirect()->route('searches.contacts');
    }

    public function searchnumberformattingLog(Request $request)
    {
        $user = $request->user();

        activity('User Action')
            ->causedBy($user)
            ->performedOn($user)
            ->withProperties([
                'action'  => 'searchnumberformatting_perform_search',
                'filters' => $request->except('_token'),
            ])
            ->event('button_clicked')
            ->log('User clicked Search Number Formatting Check List');
        if ($request->expectsJson()) {
            return response()->json(['ok' => true]);
        }

        return redirect()->route('searches.phonenumberformatting');
    }
    public function topActions(Request $request)
    {
        $days = (int) $request->get('days', 7);
        if ($days <= 0) $days = 7;
        if ($days > 365) $days = 365;

        $rows = DB::table('activity_log')
            ->where('log_name', 'User Action')
            ->where('created_at', '>=', now()->subDays($days))
            ->selectRaw("JSON_UNQUOTE(JSON_EXTRACT(properties, '$.action')) as action")
            ->selectRaw("COUNT(*) as clicks")
            ->whereRaw("JSON_EXTRACT(properties, '$.action') IS NOT NULL")
            ->groupBy('action')
            ->orderByDesc('clicks')
            ->limit(3)
            ->get();

        $labelMap = [
            'autocoupling_run_filters'            => 'Auto Coupling Run Filters',
            'realtimemonitoringlog_view_filters'  => 'Real Time Monitoring View Filters',
            'realtimemonitoringlog_refresh'       => 'Real Time Monitoring Refresh Filters',
            'searchcontacts_perform_search'       => 'Search Contacts',
            'searchnumberformatting_perform_search' => 'Search Phone Formatting ',
            'blacklist_export'                    => 'Blacklist Export',
            'blacklist_import'                    => 'Blacklist Import',
            'schedulerlogs_view_filters'          => 'Scheduler Logs View Filters',
            'productionlos_view_filters'          => 'Production Logs View Filters',
            'diagnosticslogs_view_filters'       => 'Diagnostics Logs View Filters',
        ];

        $pretty = function ($action) use ($labelMap) {
            if (!$action) return 'Unknown';
            if (isset($labelMap[$action])) return $labelMap[$action];
            $action = str_replace(['_', '-'], ' ', $action);
            return ucwords(trim($action));
        };

        $clicks = $rows->pluck('clicks')->map(fn($x) => (int)$x)->values();
        $labels = $rows->pluck('action')->map(fn($a) => $pretty($a))->values();

        $max = $clicks->max() ?: 1;
        $series = $clicks->map(fn($c) => (int) round(($c / $max) * 100))->values();

        while ($series->count() < 3) {
            $series->push(0);
            $clicks->push(0);
            $labels->push('No data');
        }

        return response()->json([
            'days'   => $days,
            'labels' => $labels,
            'series' => $series,
            'clicks' => $clicks,
        ]);
    }
}
