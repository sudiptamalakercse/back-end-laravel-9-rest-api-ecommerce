<?php

namespace App\Http\Controllers;

use App\Custom_Services\AuthenticationService;
use App\Mail\EmailSend;
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
        $email_verification_code_expiration_time = $this->email_verification_code_expiration_time;

        return AuthenticationService::register(Password::class, User::class, Hash::class, UserVerify::class, Mail::class, EmailSend::class, $request, 'user', $email_verification_code_expiration_time);
    }

    public function logout()
    {
        return AuthenticationService::logout('user');
    }

    public function login(Request $request)
    {
        return AuthenticationService::login(User::class, Hash::class, $request, 'user');
    }

    public function verify_account(Request $request)
    {
        $email_verification_code_expiration_time = $this->email_verification_code_expiration_time;

        return AuthenticationService::verify_account(UserVerify::class, Hash::class, Carbon::class, $request, $email_verification_code_expiration_time, 'user');
    }

    public function verify_account_email_resend(Request $request)
    {
        $email_verification_code_expiration_time = $this->email_verification_code_expiration_time;

        return AuthenticationService::verify_account_email_resend(UserVerify::class, Hash::class, Mail::class, EmailSend::class, $request, 'user', $email_verification_code_expiration_time);
    }

    public function forgot_password_handle(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::forgot_password_handle(User::class, PasswordReset::class, Hash::class, Mail::class, EmailSend::class, $request, 'user', $password_reset_code_expiration_time);
    }

    public function password_reset_code_check_for_reset_password(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::password_reset_code_check_for_reset_password(PasswordReset::class, Hash::class, Carbon::class, $request, $password_reset_code_expiration_time);
    }

    public function reset_password_handle(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::reset_password_handle(PasswordReset::class, Hash::class, Carbon::class, User::class, $request, $password_reset_code_expiration_time, 'user');
    }
}
