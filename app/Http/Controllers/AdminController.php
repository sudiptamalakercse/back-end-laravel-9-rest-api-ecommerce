<?php

namespace App\Http\Controllers;

use App\Custom_Services\AdminControllerService;
use App\Custom_Services\AuthenticationService;
use App\Custom_Services\Service1;
use App\Mail\EmailSend;
use App\Models\Admin;
use App\Models\NewsLetter;
use App\Models\PasswordReset;
use App\Models\ProductOrder;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class AdminController extends Controller
{
    private $password_reset_code_expiration_time = 5;

    public function logout()
    {
        return AuthenticationService::logout(user_type_:'admin');
    }

    public function login(Request $request)
    {
        return AuthenticationService::login(user_type_model_class:Admin::class, hash_class:Hash::class, request:$request, user_type_:'admin');
    }

    public function forgot_password_handle(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::forgot_password_handle(user_type_model_class:Admin::class, password_reset_model_class:PasswordReset::class, hash_class:Hash::class, mail_class:Mail::class, email_send_class:EmailSend::class, request:$request, user_type_:'admin', password_reset_code_expiration_time:$password_reset_code_expiration_time);
    }

    public function password_reset_code_check_for_reset_password(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::password_reset_code_check_for_reset_password(password_reset_model_class:PasswordReset::class, hash_class:Hash::class, carbon_class:Carbon::class, request:$request, password_reset_code_expiration_time:$password_reset_code_expiration_time);
    }

    public function reset_password_handle(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::reset_password_handle(password_reset_model_class:PasswordReset::class, hash_class:Hash::class, carbon_class:Carbon::class, user_type_model_class:Admin::class, request:$request, password_reset_code_expiration_time:$password_reset_code_expiration_time, user_type_:'admin');
    }

    public function send_newsletter_to_users(Request $request)
    {

        $request->validate([
            'subject_of_email' => ['required', 'string', 'max:255'],
            'attention_grabbing_text' => ['required', 'string', 'max:255'],
            'main_text' => ['required', 'string'],
        ]);

        //datas which will go with email
        $email_datas = [
            'subject_of_email' => $request->subject_of_email,
            'line1_text_of_email' => $request->attention_grabbing_text,
            'line2_text_of_email' => $request->main_text,
        ];
        //end datas which will go with email

        $recipients_of_the_email = NewsLetter::get();

        //send email
        Mail::to($recipients_of_the_email)->send(new EmailSend($email_datas));
        //end send email

        return response([
            'all_ok' => 'yes',
            'message' => 'NewsLetter is Successfully Sent!',
        ], 200);

    }

    public function get_product_order_list($order_id, $apartment, $street, $zip, $city, $state, $country, $name, $email, $phone_user, $phone_billing, $payment_status, $payment_type, $transaction_id, $payment_intent_id_for_refund, $product_coming, $product_receiving, $product_received, $sort_type)
    {

        return Service1::get_product_order_list_for_user_or_admin($order_id, $apartment, $street, $zip, $city, $state, $country, $name, $email, $phone_user, $phone_billing, $payment_status, $payment_type, $transaction_id, $payment_intent_id_for_refund, $product_coming, $product_receiving, $product_received, $sort_type);

    }

    public function get_single_product_order_record_by_id($product_order_id)
    {
        return Service1::get_single_product_order_record_by_id_for_user_or_admin($product_order_id);
    }

    public function set_coming_status_as_true_for_product_orders_selected(Request $request)
    {
        $product_order_ids = $request->product_order_ids;

        if (count($product_order_ids) > 1) {

            foreach ($product_order_ids as $product_order_id) {

                $product_order = ProductOrder::find($product_order_id);

                if (isset($product_order)) {

                    $product_coming = $product_order->product_coming;

                    if ($product_coming == 1) {

                        return response([
                            'all_ok' => 'no',
                            'message' => 'Already Coming Status is Yes for Product Order Id ' . $product_order_id . '!',
                        ], 422);

                    }

                } else {

                    return response([
                        'all_ok' => 'no',
                        'message' => 'No Product Order Record With Product Order Id ' . $product_order_id . '!',
                    ], 404);
                }
            }

            $all_ok = true;

            foreach ($product_order_ids as $product_order_id) {

                $product_order = ProductOrder::find($product_order_id);
                $product_coming = $product_order->product_coming;

                if ($product_coming == 0) {

                    $product_order->product_coming = 1;
                    $product_order->save();

                } else {
                    $all_ok = false;
                }
            }

            if ($all_ok == true) {

                return response([
                    'all_ok' => 'yes',
                    'message' => 'The Coming Status of Selected Product Orders are Modified as Yes Successfully!',
                ], 204);

            } else {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Something Went Wrong!',
                ], 500);
            }
        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'Please Select More Than 1 Product Order Record!',
            ], 422);

        }
    }

    public function set_receiving_status_as_true_for_product_orders_selected(Request $request)
    {

        $product_order_ids = $request->product_order_ids;

        if (count($product_order_ids) > 1) {

            foreach ($product_order_ids as $product_order_id) {

                $product_order = ProductOrder::find($product_order_id);

                if (isset($product_order)) {

                    $payment_status = $product_order->payment_status;
                    $product_coming = $product_order->product_coming;
                    $product_receiving = $product_order->product_receiving;

                    if ($payment_status == 0) {

                        return response([
                            'all_ok' => 'no',
                            'message' => 'Please First set Payment Status as Yes for Product Order Id ' . $product_order_id . ' Then Try to Set Product Reiving Status as Yes!',
                        ], 422);

                    }

                    if ($product_coming == 0) {

                        return response([
                            'all_ok' => 'no',
                            'message' => 'Please First set Coming Status as Yes for Product Order Id ' . $product_order_id . ' Then Try to Set Product Reiving Status as Yes!',
                        ], 422);

                    }

                    if ($product_receiving == 1) {

                        return response([
                            'all_ok' => 'no',
                            'message' => 'Already Receiving Status is Yes for Product Order Id ' . $product_order_id . '!',
                        ], 422);

                    }

                } else {

                    return response([
                        'all_ok' => 'no',
                        'message' => 'No Product Order Record With Product Order Id ' . $product_order_id . '!',
                    ], 404);
                }
            }

            $all_ok = true;

            foreach ($product_order_ids as $product_order_id) {

                $product_order = ProductOrder::find($product_order_id);

                $payment_status = $product_order->payment_status;
                $product_coming = $product_order->product_coming;
                $product_receiving = $product_order->product_receiving;

                if ($payment_status == 1 && $product_coming == 1 && $product_receiving == 0) {

                    $product_order->product_receiving = 1;
                    $product_order->save();

                } else {
                    $all_ok = false;
                }
            }

            if ($all_ok == true) {

                return response([
                    'all_ok' => 'yes',
                    'message' => 'The Receiving Status of Selected Product Orders are Modified as Yes Successfully!',
                ], 204);

            } else {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Something Went Wrong!',
                ], 500);
            }
        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'Please Select More Than 1 Product Order Record!',
            ], 422);

        }
    }

    public function set_actual_delivery_cost_for_product_orders_selected(Request $request)
    {
        $product_order_ids = $request->product_order_ids;
        $actual_delivery_cost = $request->actual_delivery_cost;

        if (count($product_order_ids) > 1) {

            foreach ($product_order_ids as $product_order_id) {

                $product_order = ProductOrder::find($product_order_id);

                if (isset($product_order)) {

                    $product_coming = $product_order->product_coming;

                    if ($product_coming == 0) {

                        return response([
                            'all_ok' => 'no',
                            'message' => 'Please First set Coming Status as Yes for Product Order Id ' . $product_order_id . ' Then Try to Set Actual Product Delivery Costs!',
                        ], 422);

                    }

                } else {

                    return response([
                        'all_ok' => 'no',
                        'message' => 'No Product Order Record With Product Order Id ' . $product_order_id . '!',
                    ], 404);
                }
            }

            $all_ok = true;

            foreach ($product_order_ids as $product_order_id) {

                $product_order = ProductOrder::find($product_order_id);
                $product_coming = $product_order->product_coming;

                if ($product_coming == 1) {

                    $order_detail_in_json_string_for_updating_in_order_table = AdminControllerService::get_order_detail_in_json_string_for_updating_in_order_table($product_order, $actual_delivery_cost);

                    $product_order->order_detail = $order_detail_in_json_string_for_updating_in_order_table;

                    $product_order->save();

                } else {
                    $all_ok = false;
                }
            }

            if ($all_ok == true) {

                return response([
                    'all_ok' => 'yes',
                    'message' => 'Actual Product Delivery Costs of Selected Product Orders are Modified Successfully!',
                ], 204);

            } else {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Something Went Wrong!',
                ], 500);
            }
        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'Please Select More Than 1 Product Order Record!',
            ], 422);

        }

    }

    public function set_coming_status_as_true_for_product_order_by_id($product_order_id)
    {

        $product_order = ProductOrder::find($product_order_id);

        if (isset($product_order)) {

            $product_coming = $product_order->product_coming;

            if ($product_coming == 1) {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Already Coming Status is Yes for Product Order Id ' . $product_order_id . '!',
                ], 422);

            }

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'No Product Order Record With Product Order Id ' . $product_order_id . '!',
            ], 404);
        }

        if ($product_coming == 0) {

            $product_order->product_coming = 1;
            $product_order->save();

            return response([
                'all_ok' => 'yes',
                'message' => 'The Coming Status of Product Order Id ' . $product_order_id . ' is Modified as Yes Successfully!',
            ], 204);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'Something Went Wrong!',
            ], 500);
        }

    }

    public function set_receiving_status_as_true_for_product_order_by_id($product_order_id)
    {

        $product_order = ProductOrder::find($product_order_id);

        if (isset($product_order)) {

            $payment_status = $product_order->payment_status;
            $product_coming = $product_order->product_coming;
            $product_receiving = $product_order->product_receiving;

            if ($payment_status == 0) {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Please First set Payment Status as Yes for Product Order Id ' . $product_order_id . ' Then Try to Set Product Reiving Status as Yes!',
                ], 422);

            }

            if ($product_coming == 0) {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Please First set Coming Status as Yes for Product Order Id ' . $product_order_id . ' Then Try to Set Product Reiving Status as Yes!',
                ], 422);

            }

            if ($product_receiving == 1) {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Already Receiving Status is Yes for Product Order Id ' . $product_order_id . '!',
                ], 422);

            }

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'No Product Order Record With Product Order Id ' . $product_order_id . '!',
            ], 404);
        }

        if ($payment_status == 1 && $product_coming == 1 && $product_receiving == 0) {

            $product_order->product_receiving = 1;
            $product_order->save();

            return response([
                'all_ok' => 'yes',
                'message' => 'The Receiving Status of Product Order Id ' . $product_order_id . ' is Modified as Yes Successfully!',
            ], 204);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'Something Went Wrong!',
            ], 500);

        }
    }

    public function set_actual_delivery_cost_for_product_order_by_id(Request $request, $product_order_id)
    {

        $actual_delivery_cost = $request->actual_delivery_cost;

        $product_order = ProductOrder::find($product_order_id);

        if (isset($product_order)) {

            $product_coming = $product_order->product_coming;

            if ($product_coming == 0) {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Please First set Coming Status as Yes for Product Order Id ' . $product_order_id . ' Then Try to Set Actual Product Delivery Cost!',
                ], 422);

            }

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'No Product Order Record With Product Order Id ' . $product_order_id . '!',
            ], 404);
        }

        if ($product_coming == 1) {

            $order_detail_in_json_string_for_updating_in_order_table = AdminControllerService::get_order_detail_in_json_string_for_updating_in_order_table($product_order, $actual_delivery_cost);

            $product_order->order_detail = $order_detail_in_json_string_for_updating_in_order_table;

            $product_order->save();

            return response([
                'all_ok' => 'yes',
                'message' => 'Actual Product Delivery Cost of Product Order With Product Order Id ' . $product_order_id . ' is Modified Successfully!',
            ], 204);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'Something Went Wrong!',
            ], 500);

        }
    }

    public function set_payment_status_as_true_for_product_order_by_id($product_order_id)
    {

        $product_order = ProductOrder::find($product_order_id);

        if (isset($product_order)) {

            $payment_status = $product_order->payment_status;

            if ($payment_status == 1) {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Already Payment Status is Yes for Product Order Id ' . $product_order_id . '!',
                ], 422);

            }

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'No Product Order Record With Product Order Id ' . $product_order_id . '!',
            ], 404);
        }

        if ($payment_status == 0) {

            $product_order->payment_status = 1;
            $product_order->save();

            return response([
                'all_ok' => 'yes',
                'message' => 'The Payment Status of Product Order Id ' . $product_order_id . ' is Modified as Yes Successfully!',
            ], 204);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'Something Went Wrong!',
            ], 500);
        }

    }

    public function get_total_number_of_product_order_which_are_not_coming($starting_date, $ending_date)
    {
        return AdminControllerService::get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received(starting_date:$starting_date, ending_date:$ending_date, coming_or_not_coming_or_receiving_or_received:'not_coming');
    }

    public function get_total_number_of_product_order_which_are_coming($starting_date, $ending_date)
    {
        return AdminControllerService::get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received(starting_date:$starting_date, ending_date:$ending_date, coming_or_not_coming_or_receiving_or_received:'coming');
    }

    public function get_total_number_of_product_order_which_are_receiving($starting_date, $ending_date)
    {
        return AdminControllerService::get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received(starting_date:$starting_date, ending_date:$ending_date, coming_or_not_coming_or_receiving_or_received:'receiving');
    }

    public function get_total_number_of_product_order_which_are_received($starting_date, $ending_date)
    {
        return AdminControllerService::get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received(starting_date:$starting_date, ending_date:$ending_date, coming_or_not_coming_or_receiving_or_received:'received');
    }

    public function get_product_orders_overview_report($starting_date, $ending_date)
    {
        try {

            $datas = [];
            $labels = [];

            $total_number_of_product_order_which_are_not_coming = AdminControllerService::get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received(starting_date:$starting_date, ending_date:$ending_date, coming_or_not_coming_or_receiving_or_received:'not_coming', value:true);
            $total_number_of_product_order_which_are_coming = AdminControllerService::get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received(starting_date:$starting_date, ending_date:$ending_date, coming_or_not_coming_or_receiving_or_received:'coming', value:true);
            $total_number_of_product_order_which_are_receiving = AdminControllerService::get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received(starting_date:$starting_date, ending_date:$ending_date, coming_or_not_coming_or_receiving_or_received:'receiving', value:true);
            $total_number_of_product_order_which_are_received = AdminControllerService::get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received(starting_date:$starting_date, ending_date:$ending_date, coming_or_not_coming_or_receiving_or_received:'received', value:true);

            array_push($labels, 'Product Order Not Coming', 'Product Order Coming', 'Product Order Receiving', 'Product Order Received');

            array_push($datas, $total_number_of_product_order_which_are_not_coming, $total_number_of_product_order_which_are_coming, $total_number_of_product_order_which_are_receiving, $total_number_of_product_order_which_are_received);

            return response([
                'all_ok' => 'yes',
                'labels' => $labels,
                'datas' => $datas,
            ], 200);

        } catch (Exception $e) {

            return response([
                'all_ok' => 'no',
                'message' => $e->getMessage(),
            ], 500);

        }
    }

    public function get_total_profit($starting_date, $ending_date)
    {
        return AdminControllerService::get_total_profit_or_selling_price_with_delivery_cost(starting_date:$starting_date, ending_date:$ending_date, profit_or_selling_price_with_delivery_cost:'profit');
    }

    public function get_total_selling_price_with_delivery_cost($starting_date, $ending_date)
    {
        return AdminControllerService::get_total_profit_or_selling_price_with_delivery_cost(starting_date:$starting_date, ending_date:$ending_date, profit_or_selling_price_with_delivery_cost:'selling_price_with_delivery_cost');
    }

    public function get_total_users()
    {
        try {

            $total_users = User::where('is_email_verified', 1)
                ->count();

            return response([
                'all_ok' => 'yes',
                'total_users' => $total_users,
            ], 200);

        } catch (Exception $e) {

            return response([
                'all_ok' => 'no',
                'message' => $e->getMessage(),
            ], 500);

        }

    }

    public function get_received_product_orders_report($starting_date, $ending_date, $filter_type)
    {
        try {

            if ($filter_type !== 'daily' && $filter_type !== 'monthly' && $filter_type !== 'yearly') {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Filter Type is Not Correct!',
                ], 422);

            }

            $dates = AdminControllerService::some_code_1(starting_date:$starting_date, ending_date:$ending_date, filter_type:$filter_type);

            $labels = $dates;
            $datas = [];

            foreach ($dates as $date) {

                $count = ProductOrder::where('created_at', 'like', $date . '%')
                    ->where('product_coming', 1)
                    ->where('product_receiving', 1)
                    ->where('product_received', 1)
                    ->where('payment_status', 1)
                    ->count();

                array_push($datas, $count);
            }

            return response([
                'all_ok' => 'yes',
                'labels' => $labels,
                'datas' => $datas,
            ], 200);

        } catch (Exception $e) {

            return response([
                'all_ok' => 'no',
                'message' => $e->getMessage(),
            ], 500);

        }

    }

    public function get_profit_report($starting_date, $ending_date, $filter_type)
    {
        try {

            if ($filter_type !== 'daily' && $filter_type !== 'monthly' && $filter_type !== 'yearly') {

                return response([
                    'all_ok' => 'no',
                    'message' => 'Filter Type is Not Correct!',
                ], 422);

            }

            $dates = AdminControllerService::some_code_1(starting_date:$starting_date, ending_date:$ending_date, filter_type:$filter_type);

            $labels = $dates;
            $datas = [];

            foreach ($dates as $date) {

                $product_orders_2 = ProductOrder::where('created_at', 'like', $date . '%')
                    ->where('product_coming', 1)
                    ->where('product_receiving', 1)
                    ->where('product_received', 1)
                    ->where('payment_status', 1)
                    ->get();

                $total = 0;

                foreach ($product_orders_2 as $product_order_2) {

                    $order_detail_2_in_json_string = $product_order_2->order_detail;
                    $order_detail_2_in_associative_array = json_decode($order_detail_2_in_json_string, true);

                    $total = $total + $order_detail_2_in_associative_array['finally_total_profit_with_profit_from_delivery_charge'];

                }

                array_push($datas, $total);
            }

            return response([
                'all_ok' => 'yes',
                'labels' => $labels,
                'datas' => $datas,
            ], 200);

        } catch (Exception $e) {

            return response([
                'all_ok' => 'no',
                'message' => $e->getMessage(),
            ], 500);

        }

    }

    public function get_profit_report_in_percentage($starting_date, $ending_date)
    {
        try {

            $result_in_array = AdminControllerService::get_starting_and_ending_date_for_admin_dashboard_if_user_not_given($starting_date, $ending_date);

            $starting_date = $result_in_array['starting_date'];
            $ending_date = $result_in_array['ending_date'];

            $product_orders = ProductOrder::whereBetween('created_at', [$starting_date, $ending_date])
                ->where('product_coming', 1)
                ->where('product_receiving', 1)
                ->where('product_received', 1)
                ->where('payment_status', 1)
                ->get();

            $labels = [];
            $datas = [];

            foreach ($product_orders as $product_order) {

                $order_detail_in_json_string = $product_order->order_detail;
                $order_detail_in_associative_array = json_decode($order_detail_in_json_string, true);

                array_push($datas, $order_detail_in_associative_array['finally_total_profit_with_profit_from_delivery_charge_in_percentage']);
                array_push($labels, $product_order->created_at->format('Y-m-d'));

            }

            return response([
                'all_ok' => 'yes',
                'labels' => $labels,
                'datas' => $datas,
            ], 200);

        } catch (Exception $e) {

            return response([
                'all_ok' => 'no',
                'message' => $e->getMessage(),
            ], 500);

        }

    }

}
