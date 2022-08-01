<?php

namespace App\Http\Controllers;

use App\Mail\UserEmailVerification;
use App\Mail\UserPasswordReset;
use App\Models\PasswordReset;
use App\Models\User;
use App\Models\UserVerify;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\Rules\Password;

class UserController extends Controller
{
    private $email_verification_code_expiration_time = 5;
    private $password_reset_code_expiration_time = 5;

    public function get_email_verification_code_expiration_time()
    {
        return $this->email_verification_code_expiration_time;
    }

    public function get_password_reset_code_expiration_time()
    {
        return $this->password_reset_code_expiration_time;
    }

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
            'email_verification_code_expiration_time' => $this->email_verification_code_expiration_time,
        ];
        //end datas which will go with email

        //send email
        Mail::to($user->email)->send(new UserEmailVerification($email_datas));
        //end send email

        $token = $user->createToken($request->email)->plainTextToken;

        return response([
            'all_ok' => 'yes',
            'user' => $user,
            'token' => $token,
            'verify_email_in_minutes' => $this->email_verification_code_expiration_time,

        ], 201);
    }

    public function logout()
    {
        if (auth('user')->user()) {

            auth('user')->user()->tokens()->delete();
            return response([
                'all_ok' => 'yes',
                'message' => 'Successfully Logged Out as User!!',
            ], 200);
        } else {
            return response([
                'all_ok' => 'no',
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
                'all_ok' => 'no',
                'message' => 'The provided credentials are incorrect as User.',
            ], 401);
        }

        $token = $user->createToken($request->email)->plainTextToken;

        return response([
            'all_ok' => 'yes',
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

                if ($time_difference_in_minutes < $this->email_verification_code_expiration_time) {

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

            $user = $verify_user->user;

            if (!$user->is_email_verified) {

                //Authorization Check
                if ($user->id !== auth('user')->user()->id) {

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

    public function verify_account_email_resend(Request $request)
    {
        $user = $request->user('user');
        $user_verify = $user->UserVerify;

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

        UserVerify::create([
            'user_id' => $user_id,
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
            'email_verification_code_expiration_time' => $this->email_verification_code_expiration_time,
        ];
        //end datas which will go with email

        //send email
        Mail::to($user->email)->send(new UserEmailVerification($email_datas));
        //end send email

        //end email verify related code
        return response([
            'all_ok' => 'yes',
            'message' => 'Email is Re Sent with New Email Verification Code.',
            'verify_email_in_minutes' => $this->email_verification_code_expiration_time,
        ], 200);
    }

    public function forgot_password_handle(Request $request)
    {
        $request->validate(['email' => 'required|email']);
        $email = $request->email;
        $user = User::where('email', $email)->first();
        $mess = '';
        if ($user != null) {

            $password_reset = PasswordReset::latest()->first();

            if ($password_reset == null) {
                $password_reset_last_id = 1;
            } else {
                $password_reset_last_id = $password_reset->id + 1;
            }

            $token = $password_reset_last_id . random_int(100000, 999999);

            PasswordReset::create([
                'email' => $email,
                'token' => Hash::make($token),
                'user_type' => 'User',
            ]);

            //datas which will go with email
            $user_password_reset_code = $token;
            $password_resetter_name = $user->name;
            $user_type = 'User';

            $email_datas = [
                'user_password_reset_code' => $user_password_reset_code,
                'password_resetter_name' => $password_resetter_name,
                'user_type' => $user_type,
                'password_reset_code_expiration_time' => $this->password_reset_code_expiration_time,
            ];
            //end datas which will go with email

            //send email
            Mail::to($email)->send(new UserPasswordReset($email_datas));
            //end send email

            //end email verify related code

            return response([
                'all_ok' => 'yes',
                'user_type' => 'User',
                'message' => 'We Sent You A Password Reset Code to Your Email!',
                'change_password_in_minutes' => $this->password_reset_code_expiration_time,
            ], 200);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'We Do Not Find This Email!',
            ], 403);

        }

    }

    public function password_reset_code_check_for_reset_password(Request $request)
    {
        $request->validate(['password_reset_code' => 'required']);

        $password_reset_code = $request->password_reset_code;

        $password_reset_id = null;

        $token_matched = false;

        $PasswordResets = PasswordReset::get();

        foreach ($PasswordResets as $PasswordReset) {

            if (Hash::check($password_reset_code, $PasswordReset->token)) {
                $token_matched = true;
                $password_reset_id = $PasswordReset->id;
                break;
            }
        }

        if ($token_matched) {

            if ($password_reset_id != null) {

                $password_reset = PasswordReset::where('id', $password_reset_id)->latest()->first();

                if ($password_reset) {

                    $time_difference_in_minutes = $password_reset->created_at->diffInMinutes(Carbon::now());
                    $password_reset_code_expiration_time = $this->get_password_reset_code_expiration_time();
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

    public function reset_password_handle(Request $request)
    {
        $request->validate([
            'password_reset_code_' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);

        $email = $request->email;
        $password = $request->password;
        $password_reset_code_ = $request->password_reset_code_;

        $mess = '';
        $token_matched = false;
        $password_reset_id = null;
        $all_ok = false;

        $PasswordResets = PasswordReset::get();

        foreach ($PasswordResets as $PasswordReset) {
            if (Hash::check($password_reset_code_, $PasswordReset->token)) {

                $time_difference_in_minutes = $PasswordReset->created_at->diffInMinutes(Carbon::now());

                if ($time_difference_in_minutes < $this->password_reset_code_expiration_time) {

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
            $PasswordReset = PasswordReset::find($password_reset_id);
            if ($PasswordReset->email == $email) {
                if ($PasswordReset->user_type == 'User') {

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
            $user = User::where('email', $email)->first();
            $user->password = Hash::make($password);
            $user->save();

            //delete reset_password_table record
            PasswordReset::where('email', $email)
                ->where('user_type', 'User')
                ->delete();

            //login
            $token = $user->createToken($email)->plainTextToken;

            return response([
                'all_ok' => 'yes',
                'user' => $user,
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
