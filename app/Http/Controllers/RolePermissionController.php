<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class RolePermissionController extends Controller
{
    public function index()
    {
        $totalUsers = User::count();
        $admin = User::where('role', 'admin')->count();
        $integrator = User::where('role', 'integrator')->count();
        $productionplanner = User::where('role', 'production planner')->count();
        $sales = User::where('role', 'sales')->count();


        //lista utenti
        $users = User::orderBy('name')->get();

        //lista permessi
        $permissions = DB::table('permissions')->orderBy('id')->get();
        //leggo la tabella role_permission
        $rolePermissions = DB::table('role_permission')
            //prendo solo le colonne role e permission_id
            ->select('role', 'permission_id')
            //li prendo tutti
            ->get()
            //li raggruppo per ruolo
            ->groupBy('role')
            //con map scorro ogni gruppo
            //prima tutte le righe di admin
            //poi tutte le righe di integrator
            //poi tutte le righe di production planner
            //poi tutte le righe di sales
            //prendo con pluck solo quella colonna permission_id da ogni riga
            //con all poi li trasformo in array
            ->map(fn($rows) => $rows->pluck('permission_id')->all())
            ->toArray();


        return view('auth.rolepermissions', compact(
            'totalUsers',
            'admin',
            'integrator',
            'productionplanner',
            'sales',
            'users',
            'permissions',
            'rolePermissions'
        ));
    }

    public function save(Request $request)
    {
        $data = $request->input('permissions', []);

        DB::transaction(function () use ($data) {


            DB::table('role_permission')->delete();

            $rows = [];

            foreach ($data as $role => $permissionIds) {
                foreach ((array) $permissionIds as $pid) {
                    $rows[] = [
                        'role' => $role,
                        'permission_id' => (int) $pid,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
                }
            }

            if (!empty($rows)) {
                DB::table('role_permission')->insert($rows);
            }
        });

        return back()->with('success', 'Permissions saved!');
    }
}
