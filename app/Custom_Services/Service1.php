<?php

namespace App\Custom_Services;

use App\Http\Resources\Both\ProductOrderResource;
use App\Models\ProductOrder;

class Service1
{
    public static $front_end_domain = 'http://localhost:8080';

    public static $last_n_records_of_reviews_table = 10;

    public static function get_front_end_domain()
    {
        return self::$front_end_domain;
    }

    public static function yes_or_no($boolean_value)
    {
        if ($boolean_value == 1) {
            return 'Yes';
        } elseif ($boolean_value == 0) {
            return 'No';
        }
    }

    public static function remove_property_from_json_response_if_value_is_null_otherwise_return_img_url($value, $call_back_function_when_not_null)
    {
        if ($value == null) {
            //remove property from json response if value is null
            return $call_back_function_when_not_null($value);
        } else {
            return url('') . $value;
        }
    }

    public static function show_collection_or_not($collection)
    {
        $count_records_in_collection = $collection->count();

        if ($count_records_in_collection > 0) {
            return true;
        } else {
            return false;
        }
    }

    public static function get_minimum_quantity_selling_price_after_discount($minimum_quantity_selling_price, $discount_in_percent)
    {

        $amount_reduced = ($discount_in_percent / 100) * $minimum_quantity_selling_price;

        $minimum_quantity_selling_price_after_discount = ceil($minimum_quantity_selling_price - $amount_reduced);

        return $minimum_quantity_selling_price_after_discount;
    }

    public static function get_product_order_list_for_user_or_admin($order_id, $apartment, $street, $zip, $city, $state, $country, $name, $email, $phone_user, $phone_billing, $payment_status, $payment_type, $transaction_id, $payment_intent_id_for_refund, $product_coming, $product_receiving, $product_received, $sort_type = "''", $user = null)
    {

        if ($payment_status != 0 && $payment_status != 1 && $payment_status != "''") {
            $payment_status = null;
        }

        if ($product_coming != 0 && $product_coming != 1 && $product_coming != "''") {
            $product_coming = null;
        }

        if ($product_receiving != 0 && $product_receiving != 1 && $product_receiving != "''") {
            $product_receiving = null;
        }

        if ($product_received != 0 && $product_received != 1 && $product_received != "''") {
            $product_received = null;
        }

        if (ProductOrder::count() > 0) {

            $product_orders = ProductOrder::where('id', '!=', null);

            if ($order_id != "''") {
                $product_orders = $product_orders->where('id', $order_id);
            }

            if ($apartment != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', 'apartment', 'like', '%' . $apartment . '%');
            }

            if ($street != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', 'street', 'like', '%' . $street . '%');
            }

            if ($zip != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', 'zip', 'like', '%' . $zip . '%');
            }

            if ($city != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', 'city', 'like', '%' . $city . '%');
            }

            if ($state != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', 'state', 'like', '%' . $state . '%');
            }

            if ($country != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', 'country', 'like', '%' . $country . '%');
            }

            if ($name != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', function ($query) use ($name) {
                    $query->whereRelation('user', 'name', 'like', '%' . $name . '%');
                });
            }

            if ($email != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', function ($query) use ($email) {
                    $query->whereRelation('user', 'email', 'like', '%' . $email . '%');
                });
            }

            if ($phone_user != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', function ($query) use ($phone_user) {
                    $query->whereRelation('user', 'phone', 'like', '%' . $phone_user . '%');
                });
            }

            if ($user != null) {
                $product_orders = $product_orders->whereRelation('billingDetail', function ($query) use ($user) {
                    $query->whereRelation('user', 'id', $user->id);
                });
            }

            if ($phone_billing != "''") {
                $product_orders = $product_orders->whereRelation('billingDetail', 'phone', 'like', '%' . $phone_billing . '%');
            }

            if ($payment_status != "''") {
                $product_orders = $product_orders->where('payment_status', $payment_status);
            }

            if ($payment_type != "''") {
                $product_orders = $product_orders->where('payment_type', $payment_type);
            }

            if ($transaction_id != "''") {
                $product_orders = $product_orders->where('transaction_id', $transaction_id);
            }

            if ($payment_intent_id_for_refund != "''") {
                $product_orders = $product_orders->where('payment_intent_id_for_refund', $payment_intent_id_for_refund);
            }

            $product_orders = $product_orders->where('is_canceled', 0);

            if ($product_coming != "''") {

                $product_orders = $product_orders->where('product_coming', $product_coming);
            }

            if ($product_receiving != "''") {

                $product_orders = $product_orders->where('product_receiving', $product_receiving);
            }

            if ($product_received != "''") {

                $product_orders = $product_orders->where('product_received', $product_received);
            }

            if ($sort_type == "''") {

                if ($user = null) {
                    $product_orders = $product_orders->orderBy('id', 'ASC');
                } else {
                    $product_orders = $product_orders->orderBy('id', 'DESC');
                }

            } else {
                $product_orders = $product_orders->orderBy('id', $sort_type);
            }

            $product_orders = $product_orders->get();

            return ProductOrderResource::collection($product_orders);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'No Product Order Record!',
            ], 404);

        }

    }
}
