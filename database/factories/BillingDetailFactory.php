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
        $user = User::inRandomOrder()->first();

        return [
            'phone' => $user->phone,
            'apartment' => $user->apartment,
            'street' => $user->street,
            'zip' => $user->zip,
            'city' => $user->city,
            'state' => $user->state,
            'country' => $user->country,
            'order_note' => fake()->text(50),
            'user_id' => $user->id,
        ];
    }
}
