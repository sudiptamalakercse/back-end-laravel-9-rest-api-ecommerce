<?php

namespace App\Custom_Services;

use App\Models\ProductOrder;
use Exception;

class AdminControllerService
{
    public static function some_code_1($starting_date, $ending_date, $filter_type)
    {
        $result_in_array = self::get_starting_and_ending_date_for_admin_dashboard_if_user_not_given($starting_date, $ending_date);

        $starting_date = $result_in_array['starting_date'];
        $ending_date = $result_in_array['ending_date'];

        $product_orders = ProductOrder::whereBetween('created_at', [$starting_date, $ending_date])->get();

        $dates = [];

        foreach ($product_orders as $product_order) {
            $created_at = $product_order->created_at;

            if ($filter_type == 'daily') {
                $created_at = $created_at->format('Y-m-d');
            } elseif ($filter_type == 'monthly') {
                $created_at = $created_at->format('Y-m');
            } elseif ($filter_type == 'yearly') {
                $created_at = $created_at->format('Y');
            }

            if (!in_array($created_at, $dates)) {
                array_push($dates, $created_at);
            }
        }

        return $dates;
    }

    public static function get_starting_and_ending_date_for_admin_dashboard_if_user_not_given($starting_date, $ending_date)
    {
        if ($starting_date == "''") {
            $product_order = ProductOrder::first();
            $starting_date = $product_order->created_at;
            $starting_date = $starting_date->subDays(1);
            $starting_date->format('Y-m-d');
        }

        if ($ending_date == "''") {
            $product_order = ProductOrder::orderBy('id', 'DESC')->first();
            $ending_date = $product_order->created_at;
            $ending_date = $ending_date->addDays(1);
            $ending_date->format('Y-m-d');
        }

        return [
            'starting_date' => $starting_date,
            'ending_date' => $ending_date,
        ];

    }

    public static function get_order_detail_in_json_string_for_updating_in_order_table($product_order, $actual_delivery_cost)
    {

        $order_detail_in_json_string = $product_order->order_detail;

        $order_detail_in_associative_array = json_decode($order_detail_in_json_string, true);

        $new_order_detail_in_associative_array = $order_detail_in_associative_array;

        $new_order_detail_in_associative_array['actual_product_delivery_charge'] = $actual_delivery_cost;

        $new_order_detail_in_associative_array['profit_from_delivery_charge'] = $new_order_detail_in_associative_array['product_delivery_charge'] - $new_order_detail_in_associative_array['actual_product_delivery_charge'];

        $new_order_detail_in_associative_array['finally_total_profit_with_profit_from_delivery_charge'] = $new_order_detail_in_associative_array['total_profit_without_profit_from_delivery_charge'] + $new_order_detail_in_associative_array['profit_from_delivery_charge'];

        $new_order_detail_in_associative_array['total_expense'] = $new_order_detail_in_associative_array['total_product_buying_price'] + $new_order_detail_in_associative_array['actual_product_delivery_charge'];

        $new_order_detail_in_associative_array['finally_total_profit_with_profit_from_delivery_charge_in_percentage'] = floor(($new_order_detail_in_associative_array['finally_total_profit_with_profit_from_delivery_charge'] / $new_order_detail_in_associative_array['total_expense']) * 100);

        return $order_detail_in_json_string_for_updating_in_order_table = json_encode($new_order_detail_in_associative_array);
    }

    public static function get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received($starting_date, $ending_date, $coming_or_not_coming_or_receiving_or_received, $value = false)
    {
        try {

            $result_in_array = self::get_starting_and_ending_date_for_admin_dashboard_if_user_not_given($starting_date, $ending_date);

            $starting_date = $result_in_array['starting_date'];
            $ending_date = $result_in_array['ending_date'];

            $result = ProductOrder::whereBetween('created_at', [$starting_date, $ending_date]);

            if ($coming_or_not_coming_or_receiving_or_received == 'not_coming') {
                $result = $result->where('product_coming', 0);
                $result = $result->where('product_receiving', 0);
                $result = $result->where('product_received', 0);
            } elseif ($coming_or_not_coming_or_receiving_or_received == 'coming') {
                $result = $result->where('product_coming', 1);
                $result = $result->where('product_receiving', 0);
                $result = $result->where('product_received', 0);
            } elseif ($coming_or_not_coming_or_receiving_or_received == 'receiving') {
                $result = $result->where('product_coming', 1);
                $result = $result->where('product_receiving', 1);
                $result = $result->where('product_received', 0);
            } elseif ($coming_or_not_coming_or_receiving_or_received == 'received') {
                $result = $result->where('product_coming', 1);
                $result = $result->where('product_receiving', 1);
                $result = $result->where('product_received', 1);
            }

            $result = $result->count();

            if ($value == true) {
                return $result;
            }

            return response([
                'all_ok' => 'yes',
                'total_number_of_product_order_which_are_' . $coming_or_not_coming_or_receiving_or_received => $result,
            ], 200);

        } catch (Exception $e) {

            return response([
                'all_ok' => 'no',
                'message' => $e->getMessage(),
            ], 500);

        }
    }

    public static function get_total_profit_or_selling_price_with_delivery_cost($starting_date, $ending_date, $profit_or_selling_price_with_delivery_cost)
    {
        try {

            $result_in_array = self::get_starting_and_ending_date_for_admin_dashboard_if_user_not_given($starting_date, $ending_date);

            $starting_date = $result_in_array['starting_date'];
            $ending_date = $result_in_array['ending_date'];

            $total = 0;

            $product_orders = ProductOrder::whereBetween('created_at', [$starting_date, $ending_date])
                ->where('payment_status', 1)
                ->where('product_received', 1)
                ->get();

            foreach ($product_orders as $product_order) {

                $order_detail_in_json_string = $product_order->order_detail;
                $order_detail_in_associative_array = json_decode($order_detail_in_json_string, true);

                if ($profit_or_selling_price_with_delivery_cost == 'profit') {

                    $total = $total + $order_detail_in_associative_array['finally_total_profit_with_profit_from_delivery_charge'];

                } elseif ($profit_or_selling_price_with_delivery_cost == 'selling_price_with_delivery_cost') {

                    $total = $total + $order_detail_in_associative_array['total_price_will_be_charged_from_card'];

                }
            }

            return response([
                'all_ok' => 'yes',
                'total_' . $profit_or_selling_price_with_delivery_cost => $total,
            ], 200);

        } catch (Exception $e) {

            return response([
                'all_ok' => 'no',
                'message' => $e->getMessage(),
            ], 500);

        }
    }

}
