<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Discount>
 */
class DiscountFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $random = substr(md5(mt_rand()), 0, 3);
        $code = $random . fake()->unique()->numberBetween(1, 200);
        $amount_in_percent = fake()->unique()->numberBetween(1, 200);

        return [
            'code' => $code,
            'amount_in_percent' => $amount_in_percent,
        ];
    }
}
