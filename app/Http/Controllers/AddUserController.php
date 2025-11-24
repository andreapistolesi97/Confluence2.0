<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rules\Password;
use App\Models\User;

class AddUserController extends Controller
{
    public function create()
    {
        return view('auth.adduser');
    }

    public function store()
    {
        // VALIDAZIONE
        $validated = request()->validate([
            'name' => ['required'],
            'surname' => ['required'],
            'email' => ['required', 'email', 'unique:User,email'],
            'password' => [
                'required',
                'confirmed',
                Password::min(6)->mixedCase()->numbers()->symbols()
            ],
            'role' => ['required'],
        ]);

        try {

            // GENERO USERNAME AUTOMATICO 
            $username = strstr($validated['email'], '@', true);

            // CREAZIONE UTENTE
            User::create([
                'name'      => $validated['name'],
                'surname'   => $validated['surname'],
                'email'     => $validated['email'],
                'role'      => $validated['role'],
                'username'  => $username, 
                'password'  => bcrypt($validated['password']), 
            ]);

            return redirect()->back()->with('success', 'User created successfully!');
        } catch (\Exception $e) {

            return redirect()->back()->with('error', 'Failed to create the user. Please try again.');
        }
    }
}
