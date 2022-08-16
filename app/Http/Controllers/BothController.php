<?php

namespace App\Http\Controllers;

use App\Http\Resources\Both\ContactUsResource;
use App\Models\ContactUs;

class BothController extends Controller
{
    public static function contact_us()
    {

        $contact_us = ContactUs::first();

        if ($contact_us) {

            $contact_us = new ContactUsResource($contact_us);

            return response([
                'all_ok' => 'yes',
                'contact_us' => $contact_us,
            ], 200);
        } else {
            return response([
                'all_ok' => 'no',
            ], 401);
        }
    }
}
