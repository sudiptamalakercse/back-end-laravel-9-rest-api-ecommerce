<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function logout()
    {

        if (auth('admin')->user()) {

            auth('admin')->user()->tokens()->delete();
            return response([
                'all_ok' => 'yes',
                'message' => 'Successfully Logged Out as Admin!!',
            ], 200);

        } else {
            return response([
                'all_ok' => 'no',
                'message' => 'Not Possible to Log Out as Admin!!',
            ], 401);
        }
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $admin = Admin::where('email', $request->email)->first();

        if (!$admin || !Hash::check($request->password, $admin->password)) {
            return response([
                'all_ok' => 'no',
                'message' => 'The provided credentials are incorrect as Admin.',
            ], 401);
        }

        $token = $admin->createToken($request->email)->plainTextToken;

        return response([
            'all_ok' => 'yes',
            'admin' => $admin,
            'token' => $token,
        ], 200);

    } //end

}
