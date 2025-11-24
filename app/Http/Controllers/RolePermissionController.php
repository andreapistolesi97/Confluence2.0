<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class RolePermissionController extends Controller
{
    public function index()  {
        $totalUsers = User::count();
        $admin = User::where('role','admin')->count();
        $integrator = User::where('role','integrator')->count();
        $productionplanner = User::where('role','production planner')->count();
        $sales = User::where('role','sales')->count();
        $users = User::all();

        return view('auth.rolepermissions', compact('totalUsers', 'admin','integrator','productionplanner','sales','users'));

    }
}
