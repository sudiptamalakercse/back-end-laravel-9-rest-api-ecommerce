<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\BothController;
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

//Public Routes for Both
Route::controller(BothController::class)->group(function () {
    Route::prefix('both')->group(function () {
        Route::get('contact/us', 'get_contact_us_single_record');
        Route::get('categories', 'get_categories_records');
    });
});

//Public Routes for User
Route::controller(UserController::class)->group(function () {
    Route::prefix('user')->group(function () {
        Route::post('register', 'register');
        Route::post('login', 'login');
        Route::post('forgot/password', 'forgot_password_handle');
        Route::post('password/reset/code/check/for/reset/password', 'password_reset_code_check_for_reset_password');
        Route::put('reset/password', 'reset_password_handle');
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

            //Custom Email Verification for User
            Route::put('account/verify', 'verify_account');
            Route::get('account/email/resend', 'verify_account_email_resend');
            //End of Custom Email Verification for User

            Route::post('logout', 'logout');
        });
    });
});

//Public Routes for Admin
Route::controller(AdminController::class)->group(function () {
    Route::prefix('admin')->group(function () {
        Route::post('login', 'login');
        Route::post('forgot/password', 'forgot_password_handle');
        Route::post('password/reset/code/check/for/reset/password', 'password_reset_code_check_for_reset_password');
        Route::put('reset/password', 'reset_password_handle');
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
