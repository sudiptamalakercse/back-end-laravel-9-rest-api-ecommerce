<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\StokeOutProductRequestByUserToAdmin>
 */
class StokeOutProductRequestByUserToAdminFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $quantity = fake()->numberBetween(1, 200);

        return [
            'quantity' => $quantity,
            'product_id' => Product::inRandomOrder()->first()->id,
        ];
    }
}
