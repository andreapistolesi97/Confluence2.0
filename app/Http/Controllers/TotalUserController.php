<?php

namespace App\Http\Controllers;

use App\Models\User;

class TotalUserController extends Controller
{
    public function index()
    {
        $users = User::orderBy('name')->get();

        return view('auth.totalusers', compact('users'));
    }
}
