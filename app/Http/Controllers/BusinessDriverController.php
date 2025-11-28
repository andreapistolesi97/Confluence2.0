<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\BusinessDriver;
use App\Models\Country;
use Illuminate\Http\Request;

class BusinessDriverController extends Controller
{
    public function index()
    {
        $drivers = BusinessDriver::orderBy('driver_name')->get();
        $results = [];

        return view('autocoupling.autocoupling', compact('drivers', 'results'));
    }

    public function filter(Request $request)
    {
        $drivers = BusinessDriver::orderBy('driver_name')->get();

        $query = DB::table('automatic_coupling_queue');

        /** BUSINESS DRIVER */
        if ($request->business_driver_id) {
            $query->where(DB::raw('`Business Driver`'), 'LIKE', $request->business_driver_id . '%');
        }

        /* RESULT TYPE */
        if ($request->result_type === 'not_done') {
            $query->where(DB::raw('`Total Coupled`'), '=', 0);
        }

        /* QUALIFICATION SETTINGS */
        if ($request->qualification === 'mix') {
            $query->where(function ($q) {
                $q->where(DB::raw('`Qualification Settings`'), 'LIKE', 'QS2%')
                    ->orWhere(DB::raw('`Qualification Settings`'), 'LIKE', 'QS3%')
                    ->orWhere(DB::raw('`Qualification Settings`'), 'LIKE', 'QS4%');
            });
        }

        if ($request->qualification === 'qs1') {
            $query->where(DB::raw('`Qualification Settings`'), 'LIKE', 'QS1%');
        }

        if ($request->qualification === 'none') {
            $query->where(function ($q) {
                $q->whereNull(DB::raw('`Qualification Settings`'))
                    ->orWhere(DB::raw('`Qualification Settings`'), '=', '');
            });
        }

        /* END DATE */
        if ($request->end_date) {
            $query->whereDate(DB::raw('`Day End`'), '<=', $request->end_date);
        }

        $results = $query->get();

        return view('autocoupling.autocoupling', compact('drivers', 'results'));
    }

    public function productionAction()
    {
        $drivers = BusinessDriver::orderBy('driver_name')->get();
        $countries = Country::orderBy('Description')->get();

        return view('productionaction.productionaction', compact('drivers', 'countries'));
    }
}
