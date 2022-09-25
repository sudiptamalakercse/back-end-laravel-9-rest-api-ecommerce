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
use Carbon\Carbon;
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

}
