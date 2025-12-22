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
use App\Http\Controllers\PhoneNumberFormattingController;
use App\Http\Controllers\UserActionController;
use App\Http\Controllers\SearchContactController;






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
    })->name('realtimemonitoring');

    Route::post('/realtimemonitoring/run', [MonitoringController::class, 'run'])
        ->name('monitoring.realtimemonitoring');

    Route::post('/realtimemonitoring/log', [UserActionController::class, 'realtimemonitoringlogRun'])
        ->name('realtimemonitoring.log')
        ->middleware('auth');

    Route::post('/realtimemonitoring/refresh', [MonitoringController::class, 'run'])
        ->name('realtimemonitoring.refresh')
        ->middleware('auth');

    Route::post('/realtimemonitoring/refresh/log', [UserActionController::class, 'refreshLogRun'])
        ->name('realtimemonitoring.refresh.log')
        ->middleware('auth');


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

    // REVIEW
    Route::get('/review', [BusinessDriverController::class, 'review'])
        ->name('review');


    //SEARCHES 
    Route::get('/searches/contacts', [SearchContactController::class, 'index'])
        ->name('searches.contacts');

    Route::post('/searches/contacts/run', [SearchContactController::class, 'search'])
        ->name('searches.contacts.run');

    Route::post('/searches/contacts/search', [UserActionController::class, 'searchcontactsLog'])
        ->name('searches.contacts.search')
        ->middleware('auth');

    Route::get('/searches/phonenumberformatting', function () {
        $countries = Country::orderBy('Description')->get();
        return view('searches.phonenumberformatting', compact('countries'));
    });

    Route::post('/searches/phonenumberformatting/run', [PhoneNumberFormattingController::class, 'run'])
        ->name('searches.phonenumberformatting.run');

    Route::post('/searches/phonenumberformatting/search', [UserActionController::class, 'searchnumberformattingLog'])
        ->name('searches.phonenumberformatting.search')
        ->middleware('auth');

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
