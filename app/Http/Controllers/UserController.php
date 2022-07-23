<?php

namespace App\Http\Controllers;

use App\Custom_Services\Service1;
use App\Mail\UserEmailVerification;
use App\Models\User;
use App\Models\UserVerify;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\Rules\Password;
use Str;

class UserController extends Controller
{
    public function register(Request $request)
    {

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'confirmed', Password::defaults()],
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $last_id = $user->id;
        $token = $last_id . hash('sha256', Str::random(120));

        UserVerify::create([
            'user_id' => $last_id,
            'token' => Hash::make($token),
        ]);

        //datas which will go with email
        $email_activation_link = Service1::$front_end_domain . '/account/verify/' . $token;
        $email_receiver_name = $user->name;
        $user_type = 'User';

        $email_datas = [
            'email_activation_link' => $email_activation_link,
            'email_receiver_name' => $email_receiver_name,
            'user_type' => $user_type,
        ];
        //end datas which will go with email

        //send email
        Mail::to($user->email)->send(new UserEmailVerification($email_datas));
        //end send email

        $token = $user->createToken($request->email)->plainTextToken;

        return response([
            'user' => $user,
            'token' => $token,
        ], 201);
    }

    public function logout()
    {
        if (auth('user')->user()) {

            auth('user')->user()->tokens()->delete();
            return response([
                'message' => 'Successfully Logged Out as User!!',
            ], 200);
        } else {
            return response([
                'message' => 'Not Possible to Log Out as User!!',
            ], 401);
        }
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response([
                'message' => 'The provided credentials are incorrect as User.',
            ], 401);
        }

        $token = $user->createToken($request->email)->plainTextToken;

        return response([
            'user' => $user,
            'token' => $token,
        ], 200);
    }
}
