<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\BillingDetail>
 */
class BillingDetailFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'country' => fake()->country(),
            'address' => fake()->address(),
            'city' => fake()->city(),
            'postcode_or_zip' => fake()->postcode(),
            'phone' => fake()->e164PhoneNumber(),
            'order_note' => fake()->text(100),
            'user_id' => User::inRandomOrder()->first()->id,
        ];
    }
}
