<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OperationsForAdminAndUser
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
        $admin_logged_in=Auth::guard('admin')->check();

        $user_logged_in=Auth::guard('user')->check();
        
        if($admin_logged_in || $user_logged_in){

          return $next($request);
        
        }
        else{
            return response([
          'message' => 'Unauthenticated.'
        ],401);
        }
    }
}