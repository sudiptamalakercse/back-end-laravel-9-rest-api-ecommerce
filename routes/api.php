<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

//Public Routes for User
Route::controller(UserController::class)->group(function () {
    Route::prefix('user')->group(function () {
        Route::post('register', 'register');
        Route::post('login', 'login');
    });
});

// Protected Routes for user with email verification
// Route::middleware(['auth:user', 'is_verify_user_email'])->group(function () {
//     Route::controller(UserController::class)->group(function () {
//         Route::prefix('user')->group(function () {

//         });
//     });
// });

// Protected Routes for user without email verification
Route::middleware(['auth:user'])->group(function () {
    Route::controller(UserController::class)->group(function () {
        Route::prefix('user')->group(function () {
            Route::put('account/verify', 'verify_account');
            Route::post('logout', 'logout');
        });
    });
});

//Public Routes for Admin
Route::controller(AdminController::class)->group(function () {
    Route::prefix('admin')->group(function () {
        Route::post('login', 'login');
    });
});

// Protected Routes for Admin
Route::middleware(['auth:admin'])->group(function () {
    Route::controller(AdminController::class)->group(function () {
        Route::prefix('admin')->group(function () {
            Route::post('logout', 'logout');
        });
    });
});
