<?php

use App\Http\Controllers\AddUserController;
use App\Http\Controllers\LoginController;
use Illuminate\Support\Facades\Route;
use App\Models\Country;
use App\Http\Controllers\BusinessDriverController;
use App\Http\Controllers\RolePermissionController;

// LOGIN
Route::get('/login', [LoginController::class, 'create'])->name('login');
Route::post('/login', [LoginController::class, 'store'])->name('login.store');

// LOGOUT
Route::get('/logout', [LoginController::class, 'destroy'])->name('logout');


Route::middleware(['auth'])->group(function () {

    Route::get('/homepage', function () {
        return view('homepage');
    })->name('homepage');

    Route::get('/adduser', [AddUserController::class, 'create'])->name('adduser');
    Route::post('/adduser', [AddUserController::class, 'store'])->name('adduser.store');

    Route::get('/help', function () {
        return view('help.help');
    });


    Route::get('/productionaction', [BusinessDriverController::class, 'productionAction']);

    Route::get('/diagnostics', function () {
        return view('monitoring.diagnostics');
    });

    Route::get('/realtimemonitoring', function () {
        return view('monitoring.realtimemonitoring');
    });

    Route::get('/myprofile', function () {
        return view('profile.myprofile');
    });

    Route::get('/autocoupling', [BusinessDriverController::class, 'index'])
        ->name('autocoupling');

    Route::get('/schedulerlogs', function () {
        return view('logs.schedulerlogs');
    });

    Route::get('/productionlogs', function () {
        return view('logs.productionlogs');
    });

    Route::get('/simslogs', function () {
        return view('logs.simslogs');
    });

    Route::get('/contacts', function () {
        return view('searches.contacts');
    });

    Route::get('/rolepermissions', [RolePermissionController::class, 'index'])
        ->name('rolepermissions');

    Route::get('/phonenumberformatting', function () {
        $countries = Country::orderBy('Description')->get();
        return view('searches.phonenumberformatting', compact('countries'));
    });
});
