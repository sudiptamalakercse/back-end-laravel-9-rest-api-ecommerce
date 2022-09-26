<?php

namespace App\Custom_Services;

use App\Models\ProductOrder;

class AdminControllerService
{

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

    public static function get_total_number_of_product_order_which_are_coming_or_not_coming_or_receiving_or_received($starting_date, $ending_date, $coming_or_not_coming_or_receiving_or_received)
    {
        try {

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

}
