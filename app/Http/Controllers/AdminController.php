<?php

namespace App\Http\Controllers;

use App\Custom_Services\AuthenticationService;
use App\Mail\EmailSend;
use App\Models\Admin;
use App\Models\NewsLetter;
use App\Models\PasswordReset;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class AdminController extends Controller
{
    private $password_reset_code_expiration_time = 5;

    public function logout()
    {
        return AuthenticationService::logout(user_type_:'admin');
    }

    public function login(Request $request)
    {
        return AuthenticationService::login(user_type_model_class:Admin::class, hash_class:Hash::class, request:$request, user_type_:'admin');
    }

    public function forgot_password_handle(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::forgot_password_handle(user_type_model_class:Admin::class, password_reset_model_class:PasswordReset::class, hash_class:Hash::class, mail_class:Mail::class, email_send_class:EmailSend::class, request:$request, user_type_:'admin', password_reset_code_expiration_time:$password_reset_code_expiration_time);
    }

    public function password_reset_code_check_for_reset_password(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::password_reset_code_check_for_reset_password(password_reset_model_class:PasswordReset::class, hash_class:Hash::class, carbon_class:Carbon::class, request:$request, password_reset_code_expiration_time:$password_reset_code_expiration_time);
    }

    public function reset_password_handle(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::reset_password_handle(password_reset_model_class:PasswordReset::class, hash_class:Hash::class, carbon_class:Carbon::class, user_type_model_class:Admin::class, request:$request, password_reset_code_expiration_time:$password_reset_code_expiration_time, user_type_:'admin');
    }

    public function send_newsletter_to_users(Request $request)
    {

        $request->validate([
            'subject_of_email' => ['required', 'string', 'max:255'],
            'attention_grabbing_text' => ['required', 'string', 'max:255'],
            'main_text' => ['required', 'string'],
        ]);

        //datas which will go with email
        $email_datas = [
            'subject_of_email' => $request->subject_of_email,
            'line1_text_of_email' => $request->attention_grabbing_text,
            'line2_text_of_email' => $request->main_text,
        ];
        //end datas which will go with email

        $recipients_of_the_email = NewsLetter::get();

        //send email
        Mail::to($recipients_of_the_email)->send(new EmailSend($email_datas));
        //end send email

        return response([
            'all_ok' => 'yes',
            'messes' => 'NewsLetter is Successfully Sent!',
        ], 200);

    }

}
