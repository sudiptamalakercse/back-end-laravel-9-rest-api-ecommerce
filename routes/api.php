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
            Route::get('product/order/list/{order_id}/{apartment}/{street}/{zip}/{city}/{state}/{country}/{phone_billing}/{payment_status}/{payment_type}/{transaction_id}/{product_coming}/{product_receiving}/{product_received}/{sort_type}', 'get_product_order_list');
            Route::get('view/product/order/{product_order_id}', 'get_single_product_order_record_by_id');
            Route::put('cancel/product/order/{product_order_id}', 'cancel_product_order');
            Route::put('receive/product/order/{product_order_id}', 'receive_product_order');
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
        Route::post('send/message/to/admin', 'send_message_to_admin');

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
            Route::get('product/order/list/{order_id}/{apartment}/{street}/{zip}/{city}/{state}/{country}/{name}/{email}/{phone_user}/{phone_billing}/{payment_status}/{payment_type}/{transaction_id}/{payment_intent_id_for_refund}/{product_coming}/{product_receiving}/{product_received}/{sort_type}', 'get_product_order_list');
            Route::get('view/product/order/{product_order_id}', 'get_single_product_order_record_by_id');
            Route::post('set/coming/status/as/true/for/product/orders/selected', 'set_coming_status_as_true_for_product_orders_selected');
            Route::post('set/receiving/status/as/true/for/product/orders/selected', 'set_receiving_status_as_true_for_product_orders_selected');
            Route::post('set/actual/delivery/cost/for/product/orders/selected', 'set_actual_delivery_cost_for_product_orders_selected');
            Route::put('set/coming/status/as/true/for/product/order/{product_order_id}', 'set_coming_status_as_true_for_product_order_by_id');
            Route::put('set/receiving/status/as/true/for/product/order/{product_order_id}', 'set_receiving_status_as_true_for_product_order_by_id');
            Route::post('set/actual/delivery/cost/for/product/order/{product_order_id}', 'set_actual_delivery_cost_for_product_order_by_id');
            Route::put('set/payment/status/as/true/for/product/order/{product_order_id}', 'set_payment_status_as_true_for_product_order_by_id');
            Route::get('total/number/of/product/order/which/are/not/coming/{starting_date}/{ending_date}', 'get_total_number_of_product_order_which_are_not_coming');
            Route::get('total/number/of/product/order/which/are/coming/{starting_date}/{ending_date}', 'get_total_number_of_product_order_which_are_coming');
            Route::get('total/number/of/product/order/which/are/receiving/{starting_date}/{ending_date}', 'get_total_number_of_product_order_which_are_receiving');
            Route::get('total/number/of/product/order/which/are/received/{starting_date}/{ending_date}', 'get_total_number_of_product_order_which_are_received');
            Route::get('product/orders/overview/report/{starting_date}/{ending_date}', 'get_product_orders_overview_report');
            Route::get('total/profit/{starting_date}/{ending_date}', 'get_total_profit');
            Route::get('total/selling/price/with/delivery/cost/{starting_date}/{ending_date}', 'get_total_selling_price_with_delivery_cost');
            Route::get('total/users', 'get_total_users');
            Route::get('received/product/orders/report/{starting_date}/{ending_date}/{filter_type}', 'get_received_product_orders_report');
            Route::get('profit/report/{starting_date}/{ending_date}/{filter_type}', 'get_profit_report');
            Route::get('profit/report/in/percentage/{starting_date}/{ending_date}', 'get_profit_report_in_percentage');
        });
    });
});
