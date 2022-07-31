<?php

namespace App\Http\Middleware;

use App\Http\Controllers\UserController;
use App\Models\UserVerify;
use Carbon\Carbon;
use Closure;
use Illuminate\Http\Request;

class IsVerifyUserEmail
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $user = auth('user')->user();

        if (!$user->is_email_verified) {

            $message = 'Please Verify Your Email As User!!';

            $user_verify = UserVerify::where('user_id', $user->id)->first();

            if ($user_verify) {
                $time_difference_in_minutes = $user_verify->created_at->diffInMinutes(Carbon::now());
                $user_controller = new UserController();
                $email_verification_code_expiration_time = $user_controller->get_email_verification_code_expiration_time();
                $email_verification_code_expiration_result = $email_verification_code_expiration_time - $time_difference_in_minutes;
                if ($email_verification_code_expiration_result <= 0) {
                    return response([
                        'all_ok' => 'no',
                        'message' => $message,
                        'email_verification_code_expiration_result' => 'Email Verification Code is Expired.',
                    ], 401);
                } else {
                    return response([
                        'all_ok' => 'no',
                        'message' => $message,
                        'email_verification_code_expiration_result' => 'Email Verification Code is Not Expired.',
                        'verify_email_in_minutes' => $email_verification_code_expiration_result,
                    ], 401);
                }
            }

            return response([
                'all_ok' => 'no',
                'message' => $message,
            ], 401);

        }

        return $next($request);
    }
}
