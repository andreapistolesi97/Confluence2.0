<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class PerformanceController extends Controller
{
    /**
     * Lista utenti (con filtro per ruolo).
     */
    public function index(Request $request)
    {
        // Ruolo selezionato dal dropdown (name="role")
        $role = $request->input('role');

        // Query utenti, con filtro opzionale sul ruolo
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

    /**
     * Dettaglio performance di un singolo utente.
     * Usa route model binding: /performance/activity/{user}
     */
    public function activity(User $user)
    {
        // TODO: sostituisci con la query reale delle azioni dell'utente
        // Esempio futuro:
        // $actions = Activity::where('user_id', $user->id)
        //     ->latest()
        //     ->limit(10)
        //     ->get();

        $actions = [];

        return view('performance.activity', [
            'selectedUser' => $user,
            'actions'      => $actions,
        ]);
    }
}
