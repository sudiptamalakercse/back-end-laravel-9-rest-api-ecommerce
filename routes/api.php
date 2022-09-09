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
Route::middleware(['auth:user', 'is_verify_user_email'])->group(function () {
    Route::controller(UserController::class)->group(function () {
        Route::prefix('user')->group(function () {
            Route::post('place/order', 'place_order');
        });
    });
});

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

//Public and Protected Routes with and without Email Verification for Both
Route::controller(BothController::class)->group(function () {
    Route::prefix('both')->group(function () {
        Route::get('contact/us', 'get_contact_us_single_record');
        Route::get('categories', 'get_categories_records');
        Route::get('products/{product_id}', 'get_single_record_of_products_table_by_id')->name('both.product.detail');
    });
});

//Public and Protected Routes with and without Email Verification for User
Route::controller(UserController::class)->group(function () {
    Route::prefix('user')->group(function () {
        Route::get('category/with/maximum/discount', 'get_category_in_which_has_maximum_discount_for_product');
        Route::get('catagories/of/popular/products ', 'get_catagories_of_popular_products');
        Route::get('popular/products/of/all/categories', 'get_popular_products_of_all_categories');
        Route::get('popular/products/of/specific/category/{category_name}', 'get_popular_products_of_specific_category');
        Route::get('random/category', 'get_random_category');
        Route::get('category/with/second/maximum/discount', 'get_category_in_which_has_second_maximum_discount_for_product');
        Route::get('latest/products', 'get_latest_products');
        Route::get('top/rated/products', 'get_top_rated_products');
        Route::get('review/products', 'get_review_products');
        Route::post('collect/email/for/newsletter', 'collect_email_for_newsletter');
        Route::get('sale/off/products/{product_name}/{product_category}/{product_price_minimum}/{product_price_maximum}/{product_color}/{product_size}', 'get_sale_off_products')->name('user.sale.off.products');
        Route::get('products/{product_name}/{product_category}/{product_price_minimum}/{product_price_maximum}/{product_color}/{product_size}/{sort_type}', 'get_products')->name('user.products');
        Route::get('latest/products2/{product_name}/{product_category}/{product_price_minimum}/{product_price_maximum}/{product_color}/{product_size}', 'get_latest_products2')->name('user.latest.products2');
        Route::get('minimum/and/maximum/prices/from/session/unique/categories/ids/array', 'get_minimum_and_maximum_prices_from_session_unique_categories_ids_array');
        Route::get('unique/product/colors/from/session/unique/categories/ids/array', 'get_unique_product_colors_from_session_unique_categories_ids_array');
        Route::get('unique/product/sizes/from/session/unique/categories/ids/array', 'get_unique_product_sizes_from_session_unique_categories_ids_array');
        Route::get('add/product/to/cart/{product_id}/{product_quantity_want_to_order}/{is_product_available_in_chart}', 'add_product_to_cart');
        Route::get('add/product/to/favorite/{product_id}/{is_product_available_in_favorite}', 'add_product_to_favorite');
        Route::get('related/products/{product_id}', 'get_related_products');
        Route::get('apply/coupon/code/{coupon_code}', 'get_discount_on_products_for_coupon_code');
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
            Route::post('send/newsletter/to/users', 'send_newsletter_to_users');
        });
    });
});
