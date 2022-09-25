<?php

namespace App\Custom_Services;

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

}
