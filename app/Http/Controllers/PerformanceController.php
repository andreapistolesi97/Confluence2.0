<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;



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
        $rows = DB::table('activity_log')
            ->where('causer_id', $user->ID)
            ->orderByDesc('created_at')
            ->limit(10)
            ->get();



        $actions = $rows->map(function ($r) {
            $dt = Carbon::parse($r->created_at);

            return (object)[
                'date' => $dt->format('Y-m-d'),
                'time' => $dt->format('H:i:s'),
                'type' => $r->description,
            ];
        });

        return view('performance.activity', [
            'selectedUser' => $user,
            'actions'      => $actions,
        ]);
    }
}
