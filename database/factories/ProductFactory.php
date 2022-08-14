<?php

namespace Database\Factories;

use App\Models\Admin;
use App\Models\ProductColor;
use App\Models\ProductInformation;
use App\Models\ProductSize;
use App\Models\Shipping;
use App\Models\Unit;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $minimum_quantity = fake()->numberBetween(1, 1000);
        $minimum_quantity_buying_price = fake()->numberBetween(1, 1000);
        $minimum_quantity_selling_price = $minimum_quantity_buying_price + 200;
        $discount_in_percent = fake()->numberBetween(1, 50);
        $stock = fake()->numberBetween(1, 500);

        return [
            'product_information_id' => ProductInformation::inRandomOrder()->first()->id,
            'minimum_quantity' => $minimum_quantity,
            'unit_id' => Unit::inRandomOrder()->first()->id,
            'minimum_quantity_buying_price' => $minimum_quantity_buying_price,
            'minimum_quantity_selling_price' => $minimum_quantity_selling_price,
            'discount_in_percent' => $discount_in_percent,
            'stock' => $stock,
            'is_shipping_free' => fake()->boolean(),
            'shipping_id' => Shipping::inRandomOrder()->first()->id,
            'product_size_id' => ProductSize::inRandomOrder()->first()->id,
            'product_color_id' => ProductColor::inRandomOrder()->first()->id,
            'admin_id' => Admin::inRandomOrder()->first()->id,

        ];
    }
}
