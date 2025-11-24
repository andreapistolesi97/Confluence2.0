<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\BusinessDriver;
use App\Models\Country;

class BusinessDriverController extends Controller
{
    public function index()
    {
        $drivers = BusinessDriver::orderBy('driver_name')->get();

        return view('autocoupling.autocoupling', compact('drivers'));
    }

    public function productionAction()
    {
        $drivers = BusinessDriver::orderBy('driver_name')->get();
        $countries = Country::orderBy('Description')->get();

        return view('productionaction.productionaction', compact('drivers', 'countries'));
    }
}
