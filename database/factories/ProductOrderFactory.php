<?php

namespace Database\Factories;

use App\Models\Admin;
use App\Models\BillingDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductOrder>
 */
class ProductOrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $payment_type = fake()->randomElement(['Cash', 'Card']);

        if ($payment_type == 'Card') {
            $transaction_id = fake()->md5();
            $payment_status = 1;
        } else {
            $transaction_id = '';
            $payment_status = 0;
        }

        $product_coming = fake()->boolean();

        if ($product_coming == true) {
            $product_receiving = true;
            $product_received = true;
            $admin_id = Admin::inRandomOrder()->first()->id;
            $is_canceled = 0;
        } else {
            $product_receiving = false;
            $product_received = false;
            $admin_id = null;
            $is_canceled = fake()->boolean();
        }

        return [
            'order_detail' => fake()->text(100),
            'billing_detail_id' => BillingDetail::inRandomOrder()->first()->id,
            'payment_type' => $payment_type,
            'payment_status' => $payment_status,
            'transaction_id' => $transaction_id,
            'product_coming' => $product_coming,
            'product_receiving' => $product_receiving,
            'product_received' => $product_received,
            'admin_id' => $admin_id,
            'is_canceled' => $is_canceled,
        ];
    }
}
