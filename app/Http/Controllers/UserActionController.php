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
}
