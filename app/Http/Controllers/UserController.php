<?php

namespace App\Http\Controllers;

use App\Mail\UserEmailVerification;
use App\Models\User;
use App\Models\UserVerify;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\Rules\Password;

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
        $token = $last_id . random_int(100000, 999999);

        UserVerify::create([
            'user_id' => $last_id,
            'token' => Hash::make($token),
        ]);

        //datas which will go with email
        $email_activation_code = $token;
        $email_receiver_name = $user->name;
        $user_type = 'User';

        $email_datas = [
            'email_activation_code' => $email_activation_code,
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

    public function verify_account(Request $request)
    {

        $request->validate([
            'verificaion_code' => 'required',
        ]);

        $verificaion_code = $request->verificaion_code;

        $matched = false;

        $verify_users = UserVerify::get();

        foreach ($verify_users as $verify_user) {
            if (Hash::check($verificaion_code, $verify_user->token)) {

                $time_difference_in_minutes = $verify_user->created_at->diffInMinutes(Carbon::now());

                if ($time_difference_in_minutes < 5) {

                    $matched = true;

                } else {

                    $verify_user->delete();

                    return response([
                        'message' => 'Your Email Verification Code is Expired!',
                    ], 401);

                }

                break;
            }
        }

        $message = 'Sorry Your Email Verification Code is Incorrect or Old!';

        if ($matched == true) {

            $user = $verify_user->user;

            if (!$user->is_email_verified) {

                //Authorization Check
                if ($user->id !== auth('user')->user()->id) {

                    return response([
                        'message' => 'Unauthorized.',
                    ], 401);

                }
                //End Authorization Check

                $user->is_email_verified = 1;
                $user->save();
                $message = "Your e-mail is verified.";

                $verify_user->delete();

                return response([
                    'message' => $message,
                ], 204);

            }

        }

        return response([
            'message' => $message,
        ], 403);

    }
}
