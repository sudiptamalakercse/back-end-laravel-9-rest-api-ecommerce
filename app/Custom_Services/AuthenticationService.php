<?php

namespace App\Custom_Services;

class AuthenticationService
{
    public static function get_upper_user_type_($user_type_)
    {
        $upper_user_type_ = ucfirst($user_type_);
        return $upper_user_type_;
    }

    public static function register($password_class, $user_type_model_class, $hash_class, $user_type_verify_model_class, $mail_class, $email_send_class, $request, $user_type_, $email_verification_code_expiration_time)
    {

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'confirmed', $password_class::defaults()],
        ]);

        if ($user_type_ == 'user') {

            $request->validate([
                'phone' => ['string', 'max:255'],
                'apartment' => ['string', 'max:255'],
                'street' => ['string', 'max:255'],
                'zip' => ['string', 'max:255'],
                'city' => ['string', 'max:255'],
                'state' => ['string', 'max:255'],
                'country' => ['string', 'max:255'],
            ]);

        }

        $upper_user_type_ = self::get_upper_user_type_($user_type_);

        if ($user_type_ == 'user') {

            $user = $user_type_model_class::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => $hash_class::make($request->password),
                'phone' => $request->phone,
                'apartment' => $request->apartment,
                'street' => $request->street,
                'zip' => $request->zip,
                'city' => $request->city,
                'state' => $request->state,
                'country' => $request->country,

            ]);

        } else {

            $user = $user_type_model_class::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => $hash_class::make($request->password),
            ]);

        }

        $last_id = $user->id;
        $token = $last_id . random_int(100000, 999999);

        $user_type_verify_model_class::create([
            $user_type_ . '_id' => $last_id,
            'token' => $hash_class::make($token),
        ]);

        //datas which will go with email
        $subject_of_email = 'Verify Your Email Account';
        $email_activation_code = $token;
        $email_receiver_name = $user->name;
        $user_type = $upper_user_type_;

        $email_datas = [
            'subject_of_email' => $subject_of_email,
            'line1_text_of_email' => 'Hi, ' . $email_receiver_name . ' (' . $user_type . ') Verify Your Email Within ' . $email_verification_code_expiration_time . ' Minutes!',
            'line2_text_of_email' => 'Your Email Verification Code is ' . $email_activation_code,
        ];
        //end datas which will go with email

        //send email

        $mail_class::to($user->email)->send(new $email_send_class($email_datas));
        //end send email

        $token = $user->createToken($request->email)->plainTextToken;

        return response([
            'all_ok' => 'yes',
            $user_type_ => $user,
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
            $user_type_ => $user,
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

    public static function verify_account_email_resend($user_type_verify_model_class, $hash_class, $mail_class, $email_send_class, $request, $user_type_, $email_verification_code_expiration_time)
    {

        $upper_user_type_ = self::get_upper_user_type_($user_type_);

        $user = $request->user($user_type_);

        $UserVerify = $upper_user_type_ . 'Verify';
        $user_verify = $user->$UserVerify;

        if ($user_verify != null) {
            $user_verify->delete();
        }

        if ($user->is_email_verified) {
            return response([
                'all_ok' => 'no',
                'message' => 'Your E-mail is Already Verified.',
            ], 403);
        }

        $user_id = $user->id;
        $token = $user_id . random_int(100000, 999999);

        $user_type_verify_model_class::create([
            $user_type_ . '_id' => $user_id,
            'token' => $hash_class::make($token),
        ]);

        //datas which will go with email
        $subject_of_email = 'Verify Your Email Account';
        $email_activation_code = $token;
        $email_receiver_name = $user->name;
        $user_type = $upper_user_type_;

        $email_datas = [
            'subject_of_email' => $subject_of_email,
            'line1_text_of_email' => 'Hi, ' . $email_receiver_name . ' (' . $user_type . ') Verify Your Email Within ' . $email_verification_code_expiration_time . ' Minutes!',
            'line2_text_of_email' => 'Your Email Verification Code is ' . $email_activation_code,
        ];
        //end datas which will go with email

        //send email
        $mail_class::to($user->email)->send(new $email_send_class($email_datas));
        //end send email

        //end email verify related code
        return response([
            'all_ok' => 'yes',
            'message' => 'Email is Re Sent with New Email Verification Code.',
            'verify_email_in_minutes' => $email_verification_code_expiration_time,
        ], 200);
    }

    public static function forgot_password_handle($user_type_model_class, $password_reset_model_class, $hash_class, $mail_class, $email_send_class, $request, $user_type_, $password_reset_code_expiration_time)
    {
        $request->validate(['email' => 'required|email']);

        $upper_user_type_ = self::get_upper_user_type_($user_type_);

        $email = $request->email;
        $user = $user_type_model_class::where('email', $email)->first();
        $mess = '';
        if ($user != null) {

            $password_reset = $password_reset_model_class::latest()->first();

            if ($password_reset == null) {
                $password_reset_last_id = 1;
            } else {
                $password_reset_last_id = $password_reset->id + 1;
            }

            $token = $password_reset_last_id . random_int(100000, 999999);

            $password_reset_model_class::create([
                'email' => $email,
                'token' => $hash_class::make($token),
                'user_type' => $upper_user_type_,
            ]);

            //datas which will go with email
            $subject_of_email = 'Reset Your Password';
            $user_password_reset_code = $token;
            $password_resetter_name = $user->name;
            $user_type = $upper_user_type_;

            $email_datas = [
                'subject_of_email' => $subject_of_email,
                'line1_text_of_email' => 'Hi, ' . $password_resetter_name . ' (' . $user_type . ') Reset Your Password Within ' . $password_reset_code_expiration_time . ' Minutes!',
                'line2_text_of_email' => 'Your Password Reset Code is ' . $user_password_reset_code,
            ];
            //end datas which will go with email

            //send email
            $mail_class::to($email)->send(new $email_send_class($email_datas));
            //end send email

            //end email verify related code

            return response([
                'all_ok' => 'yes',
                'user_type' => $upper_user_type_,
                'message' => 'We Sent You A Password Reset Code to Your Email!',
                'change_password_in_minutes' => $password_reset_code_expiration_time,
            ], 200);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'We Do Not Find This Email!',
            ], 403);

        }

    }

    public static function password_reset_code_check_for_reset_password($password_reset_model_class, $hash_class, $carbon_class, $request, $password_reset_code_expiration_time)
    {
        $request->validate(['password_reset_code' => 'required']);

        $password_reset_code = $request->password_reset_code;

        $password_reset_id = null;

        $token_matched = false;

        $PasswordResets = $password_reset_model_class::get();

        foreach ($PasswordResets as $PasswordReset) {

            if ($hash_class::check($password_reset_code, $PasswordReset->token)) {
                $token_matched = true;
                $password_reset_id = $PasswordReset->id;
                break;
            }
        }

        if ($token_matched) {

            if ($password_reset_id != null) {

                $password_reset = $password_reset_model_class::where('id', $password_reset_id)->latest()->first();

                if ($password_reset) {

                    $time_difference_in_minutes = $password_reset->created_at->diffInMinutes($carbon_class::now());

                    $password_reset_code_expiration_result = $password_reset_code_expiration_time - $time_difference_in_minutes;

                    if ($password_reset_code_expiration_result <= 0) {
                        return response([
                            'all_ok' => 'no',
                            'password_reset_code_expiration_result' => 'Password Reset Code is Expired.',
                        ], 401);
                    } else {

                        $email = $password_reset->email;
                        $user_type = $password_reset->user_type;

                        return response([
                            'all_ok' => 'yes',
                            'password_reset_code_expiration_result' => 'Password Reset Code is Not Expired.',
                            'user_type' => $user_type,
                            'email' => $email,
                            'password_reset_code' => $password_reset_code,
                            'change_password_in_minutes' => $password_reset_code_expiration_result,
                        ], 200);
                    }
                }
            }

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'Password Reset Code is Not Matched or Old!',
            ], 403);

        }

    }

    public static function reset_password_handle($password_reset_model_class, $hash_class, $carbon_class, $user_type_model_class, $request, $password_reset_code_expiration_time, $user_type_)
    {
        $request->validate([
            'password_reset_code_' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);

        $upper_user_type_ = self::get_upper_user_type_($user_type_);

        $email = $request->email;
        $password = $request->password;
        $password_reset_code_ = $request->password_reset_code_;

        $mess = '';
        $token_matched = false;
        $password_reset_id = null;
        $all_ok = false;

        $PasswordResets = $password_reset_model_class::get();

        foreach ($PasswordResets as $PasswordReset) {
            if ($hash_class::check($password_reset_code_, $PasswordReset->token)) {

                $time_difference_in_minutes = $PasswordReset->created_at->diffInMinutes($carbon_class::now());

                if ($time_difference_in_minutes < $password_reset_code_expiration_time) {

                    $token_matched = true;

                    $password_reset_id = $PasswordReset->id;

                } else {

                    $PasswordReset->delete();

                    return response([
                        'all_ok' => 'no',
                        'message' => 'Your Password Reset Code Is Expired!',
                    ], 401);

                }

                break;

            }
        }

        if ($token_matched == true) {
            $PasswordReset = $password_reset_model_class::find($password_reset_id);
            if ($PasswordReset->email == $email) {
                if ($PasswordReset->user_type == $upper_user_type_) {

                    $all_ok = true;

                } else {
                    $mess = "User Type Is Not Matched!";
                }

            } else {
                $mess = "Email Is Not Matched!";
            }
        } else {
            $mess = "Password Reset Code Is Not Matched or Old!";
        }

        if ($all_ok == true) {

            //Update Password
            $user = $user_type_model_class::where('email', $email)->first();
            $user->password = $hash_class::make($password);
            $user->save();

            //delete reset_password_table record
            $password_reset_model_class::where('email', $email)
                ->where('user_type', $upper_user_type_)
                ->delete();

            //login
            $token = $user->createToken($email)->plainTextToken;

            return response([
                'all_ok' => 'yes',
                $user_type_ => $user,
                'token' => $token,
            ], 200);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => $mess,
            ], 401);

        }
    }
}
