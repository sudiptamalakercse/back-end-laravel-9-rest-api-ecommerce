<?php

namespace App\Custom_Services;

class Service1
{
    public static $front_end_domain = 'http://localhost:8080';

    public static function get_front_end_domain()
    {
        return self::$front_end_domain;
    }
}
