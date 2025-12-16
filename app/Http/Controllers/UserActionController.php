<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

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
}
