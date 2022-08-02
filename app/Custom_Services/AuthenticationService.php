<?php

namespace App\Custom_Services;

class AuthenticationService
{
    public static function get_upper_user_type_($user_type_)
    {
        $upper_user_type_ = ucfirst($user_type_);
        return $upper_user_type_;
    }

    public static function register($password_class, $user_type_model_class, $hash_class, $user_type_verify_model_class, $mail_class, $user_type_email_verification_class, $request, $user_type_, $email_verification_code_expiration_time)
    {

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'confirmed', $password_class::defaults()],
        ]);

        $upper_user_type_ = self::get_upper_user_type_($user_type_);

        $user = $user_type_model_class::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => $hash_class::make($request->password),
        ]);

        $last_id = $user->id;
        $token = $last_id . random_int(100000, 999999);

        $user_type_verify_model_class::create([
            $user_type_ . '_id' => $last_id,
            'token' => $hash_class::make($token),
        ]);

        //datas which will go with email
        $email_activation_code = $token;
        $email_receiver_name = $user->name;
        $user_type = $upper_user_type_;

        $email_datas = [
            'email_activation_code' => $email_activation_code,
            'email_receiver_name' => $email_receiver_name,
            'user_type' => $user_type,
            'email_verification_code_expiration_time' => $email_verification_code_expiration_time,
        ];
        //end datas which will go with email

        //send email

        $mail_class::to($user->email)->send(new $user_type_email_verification_class($email_datas));
        //end send email

        $token = $user->createToken($request->email)->plainTextToken;

        return response([
            'all_ok' => 'yes',
            'user' => $user,
            'token' => $token,
            'verify_email_in_minutes' => $email_verification_code_expiration_time,
        ], 201);

    }

    public static function logout($user_type_)
    {

        $upper_user_type_ = self::get_upper_user_type_($user_type_);

        if (auth($user_type_)->user()) {

            auth($user_type_)->user()->tokens()->delete();

            return response([
                'all_ok' => 'yes',
                'message' => 'Successfully Logged Out as ' . $upper_user_type_ . '!!',
            ], 200);
        } else {
            return response([
                'all_ok' => 'no',
                'message' => 'Not Possible to Log Out as ' . $upper_user_type_ . '!!',
            ], 401);
        }
    }

    public static function login($user_type_model_class, $hash_class, $request, $user_type_)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $upper_user_type_ = self::get_upper_user_type_($user_type_);

        $user = $user_type_model_class::where('email', $request->email)->first();

        if (!$user || !$hash_class::check($request->password, $user->password)) {
            return response([
                'all_ok' => 'no',
                'message' => 'The provided credentials are incorrect as ' . $upper_user_type_ . '.',
            ], 401);
        }

        $token = $user->createToken($request->email)->plainTextToken;

        return response([
            'all_ok' => 'yes',
            'user' => $user,
            'token' => $token,
        ], 200);
    }

    public static function verify_account($user_type_verify_model_class, $hash_class, $carbon_class, $request, $email_verification_code_expiration_time, $user_type_)
    {

        $request->validate([
            'verificaion_code' => 'required',
        ]);

        $verificaion_code = $request->verificaion_code;

        $matched = false;

        $verify_users = $user_type_verify_model_class::get();

        foreach ($verify_users as $verify_user) {

            if ($hash_class::check($verificaion_code, $verify_user->token)) {

                $time_difference_in_minutes = $verify_user->created_at->diffInMinutes($carbon_class::now());

                if ($time_difference_in_minutes < $email_verification_code_expiration_time) {

                    $matched = true;

                } else {

                    $verify_user->delete();

                    return response([
                        'all_ok' => 'no',
                        'message' => 'Your Email Verification Code is Expired!',
                    ], 401);

                }

                break;
            }
        }

        $message = 'Sorry Your Email Verification Code is Incorrect or Old!';

        if ($matched == true) {

            $user = $verify_user->$user_type_;

            if (!$user->is_email_verified) {

                //Authorization Check
                if ($user->id !== auth($user_type_)->user()->id) {

                    return response([
                        'all_ok' => 'no',
                        'message' => 'Unauthorized.',
                    ], 401);

                }
                //End Authorization Check

                $user->is_email_verified = 1;
                $user->save();
                $message = "Your E-mail is verified.";

                $verify_user->delete();

                return response([
                    'all_ok' => 'yes',
                    'message' => $message,
                ], 204);

            } else {
                $message = "Your E-mail is Already Verified.";
            }

        }

        return response([
            'all_ok' => 'no',
            'message' => $message,
        ], 403);

    }
}
