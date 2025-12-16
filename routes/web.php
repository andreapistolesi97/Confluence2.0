<?php

use App\Http\Controllers\AddUserController;
use App\Http\Controllers\LoginController;
use Illuminate\Support\Facades\Route;
use App\Models\Country;
use App\Http\Controllers\BusinessDriverController;
use App\Http\Controllers\LogController;
use App\Http\Controllers\RolePermissionController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DiagnosticsController;
use App\Http\Controllers\PerformanceController;
use App\Http\Controllers\MonitoringController;
use App\Http\Controllers\UserActionController;




// LOGIN
Route::get('/', [LoginController::class, 'create'])->name('login');
Route::post('/', [LoginController::class, 'store'])->name('login.store');

// LOGOUT
Route::get('/logout', [LoginController::class, 'destroy'])->name('logout');

//GROUP MIDDLEWARE
Route::middleware(['auth'])->group(function () {



    //HOMEPAGE
    Route::get('/homepage', function () {
        return view('homepage');
    })->name('homepage');

    //MYPROFILE
    Route::middleware(['auth'])->group(function () {
        Route::get('/myprofile', [ProfileController::class, 'show'])
            ->name('profile.myprofile');

        Route::put('/myprofile', [ProfileController::class, 'update'])
            ->name('profile.myprofile.update');
    });

    Route::get('/adduser', [AddUserController::class, 'create'])->name('adduser');
    Route::post('/adduser', [AddUserController::class, 'store'])->name('adduser.store');

    Route::get('/rolepermissions', [RolePermissionController::class, 'index'])
        ->name('rolepermissions');


    //HELP
    Route::get('/help', function () {
        return view('help.help');
    });

    //PRODUCTION ACTION
    Route::get('/productionaction', [BusinessDriverController::class, 'productionAction']);




    //MONITORING
    Route::get('/diagnostics', function () {
        return view('monitoring.diagnostics');
    });

    Route::post('/diagnostics/run', [DiagnosticsController::class, 'run'])
        ->name('diagnostics.run');

    Route::post('/diagnostics/log', [UserActionController::class, 'diagnosticslogRun'])
        ->name('diagnostics.log')
        ->middleware('auth');

    Route::get('/realtimemonitoring', function () {
        return view('monitoring.realtimemonitoring');
    });


    Route::post('/realtimemonitoring/run', [MonitoringController::class, 'run'])
        ->name('monitoring.realtimemonitoring');


    //AUTOCOUPLING

    Route::get('/autocoupling', [BusinessDriverController::class, 'index'])
        ->name('autocoupling');

    Route::get('/autocoupling/filter', [BusinessDriverController::class, 'filter'])
        ->name('autocoupling.filter');

    Route::post('/autocoupling/run', [UserActionController::class, 'autocouplingRun'])
        ->name('autocoupling.run')
        ->middleware('auth');


    //LOGS
    Route::get('/schedulerlogs', [LogController::class, 'scheduler'])
        ->name('schedulerlogs')
        ->middleware('auth');

    Route::post('/schedulerlogs/run', [UserActionController::class, 'schedulerlogsRun'])
        ->name('schedulerlogs.run')
        ->middleware('auth');


    Route::get('/productionlogs', [LogController::class, 'production'])
        ->name('productionlogs')
        ->middleware('auth');

    Route::post('/productionlogs/run', [UserActionController::class, 'productionlogsRun'])
        ->name('productionlogs.run')
        ->middleware('auth');
    // Route::get('/simslogs',       [LogController::class, 'sims'])->name('simslogs');



    //SEARCHES 
    Route::get('/contacts', function () {
        return view('searches.contacts');
    });

    Route::get('/phonenumberformatting', function () {
        $countries = Country::orderBy('Description')->get();
        return view('searches.phonenumberformatting', compact('countries'));
    });

    Route::get('/blacklist', function () {
        return view('searches.blacklist');
    });

    //PERFORMANCE
    Route::get('/performance', [PerformanceController::class, 'index'])
        ->name('performance.performance.index');
});
Route::get('/performance/activity/{user}', [PerformanceController::class, 'activity'])
    ->name('performance.performance.activity');


Route::post('/actions/button', [UserActionController::class, 'store'])
    ->name('actions.button');
