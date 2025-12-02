<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\Hash;
use App\Models\User;


class ProfileController extends Controller
{

    public function show()
    {
        $user = Auth::user();
        return view('profile.myprofile', compact('user'));
    }

    public function update(Request $request)
    {
        /** @var \App\Models\User $user */
        $user = Auth::user();

        $request->validate(
            [
                'current_password' => ['required'],
                'password' => [
                    'required',
                    'min:6',
                    // almeno 1 minuscola, 1 maiuscola, 1 numero, 1 carattere speciale
                    'regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$/',
                ],
            ],
            [
                'current_password.required' => 'Please enter your current password.',
                'password.required' => 'Please enter a new password.',
            ]
        );

        // Controlla che la current password sia corretta
        if (! Hash::check($request->current_password, $user->password)) {
            return back()
                ->withErrors(['current_password' => 'Current password is incorrect.'])
                ->with('error', 'Current password is incorrect.')
                ->withInput();
        }

        // Aggiorna SOLO la password
        $user->password = Hash::make($request->password);
        $user->save();

        return back()->with('success', 'Password updated successfully!');
    }
}
