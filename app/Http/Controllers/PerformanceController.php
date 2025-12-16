<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class PerformanceController extends Controller
{

    public function index(Request $request)
    {
        $role = $request->input('role');

        $users = User::query()
            ->when($role, function ($query, $role) {
                return $query->where('role', $role);
            })
            ->get();

        return view('performance.performance', [
            'users'        => $users,
            'selectedRole' => $role,
        ]);
    }


    public function activity(User $user)
    {

        $actions = [];

        return view('performance.activity', [
            'selectedUser' => $user,
            'actions'      => $actions,
        ]);
    }
}
