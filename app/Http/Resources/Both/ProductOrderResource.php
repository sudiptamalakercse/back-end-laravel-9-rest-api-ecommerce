<?php

namespace App\Http\Resources\Both;

use App\Custom_Services\Service1;
use App\Http\Resources\Both\BillingDetailResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Auth;

class ProductOrderResource extends JsonResource
{

    private function order_detail()
    {
        $order_detail_in_json_string = $this->order_detail;
        $order_detail_in_associative_array = json_decode($order_detail_in_json_string, true);

        $log_in_as_user = Auth::guard('user')->check();

        $log_in_as_admin = Auth::guard('admin')->check();

        if ($log_in_as_user == true) {

            $new_order_detail_in_associative_array = [];

            $product_list = $order_detail_in_associative_array['product_list'];

            foreach ($product_list as $key => $product) {

                $new_order_detail_in_associative_array['product_list'][$key]['product_id'] = $product['product_id'];
                $new_order_detail_in_associative_array['product_list'][$key]['product_img'] = $product['product_img'];
                $new_order_detail_in_associative_array['product_list'][$key]['product_name'] = $product['product_name'];

                if (array_key_exists('product_size', $product)) {
                    $new_order_detail_in_associative_array['product_list'][$key]['product_size'] = $product['product_size'];
                }

                if (array_key_exists('product_color', $product)) {
                    $new_order_detail_in_associative_array['product_list'][$key]['product_color'] = $product['product_color'];
                }

                if (array_key_exists('product_color_img', $product)) {
                    $new_order_detail_in_associative_array['product_list'][$key]['product_color_img'] = $product['product_color_img'];
                }

                $new_order_detail_in_associative_array['product_list'][$key]['is_product_shipping_free'] = $product['is_product_shipping_free'];
                $new_order_detail_in_associative_array['product_list'][$key]['product_minimum_quantity'] = $product['product_minimum_quantity'];
                $new_order_detail_in_associative_array['product_list'][$key]['product_unit'] = $product['product_unit'];
                $new_order_detail_in_associative_array['product_list'][$key]['product_minimum_quantity_selling_price'] = $product['product_minimum_quantity_selling_price'];
                $new_order_detail_in_associative_array['product_list'][$key]['product_discount_in_percent'] = $product['product_discount_in_percent'];
                $new_order_detail_in_associative_array['product_list'][$key]['product_minimum_quantity_selling_price_after_discount'] = $product['product_minimum_quantity_selling_price_after_discount'];
                $new_order_detail_in_associative_array['product_list'][$key]['product_quantity_want_to_order'] = $product['product_quantity_want_to_order'];
                $new_order_detail_in_associative_array['product_list'][$key]['total_product_price_want_to_order'] = $product['total_product_price_want_to_order'];

            }

            $new_order_detail_in_associative_array['subtotal_product_price'] = $order_detail_in_associative_array['subtotal_product_price'];
            $new_order_detail_in_associative_array['coupon_code'] = $order_detail_in_associative_array['coupon_code'];
            $new_order_detail_in_associative_array['discount_in_percent_on_subtotal_product_price_for_coupon_code'] = $order_detail_in_associative_array['discount_in_percent_on_subtotal_product_price_for_coupon_code'];
            $new_order_detail_in_associative_array['price_reduced_from_subtotal_product_price_for_coupon_code'] = $order_detail_in_associative_array['price_reduced_from_subtotal_product_price_for_coupon_code'];
            $new_order_detail_in_associative_array['subtotal_product_price_after_coupon_code_discount'] = $order_detail_in_associative_array['subtotal_product_price_after_coupon_code_discount'];
            $new_order_detail_in_associative_array['product_delivery_charge'] = $order_detail_in_associative_array['product_delivery_charge'];
            $new_order_detail_in_associative_array['total_price_will_be_charged_from_card'] = $order_detail_in_associative_array['total_price_will_be_charged_from_card'];
            $new_order_detail_in_associative_array['total_product_selling_price'] = $order_detail_in_associative_array['total_product_selling_price'];

            return $new_order_detail_in_associative_array;

        } elseif ($log_in_as_admin == true) {
            return $order_detail_in_associative_array;
        }
    }

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'order_detail' => $this->order_detail(),
            'billing_detail' => new BillingDetailResource($this->billingDetail),
            'payment_type' => $this->payment_type,
            'payment_status' => Service1::yes_or_no($this->payment_status),
            'transaction_id' => $this->transaction_id,
            'payment_intent_id_for_refund' => $this->when(Auth::guard('admin')->check(), $this->payment_intent_id_for_refund),
            'product_coming' => Service1::yes_or_no($this->product_coming),
            'product_receiving' => Service1::yes_or_no($this->product_receiving),
            'product_received' => Service1::yes_or_no($this->product_received),
            'is_canceled' => Service1::yes_or_no($this->is_canceled),
            'admin' => $this->admin,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
