<?php

namespace App\Custom_Services;

class Service1
{
    public static $front_end_domain = 'http://localhost:8080';

    public static $last_n_records_of_reviews_table = 10;

    public static function get_front_end_domain()
    {
        return self::$front_end_domain;
    }

    public static function yes_or_no($boolean_value)
    {
        if ($boolean_value == 1) {
            return 'Yes';
        } elseif ($boolean_value == 0) {
            return 'No';
        }
    }

    public static function remove_property_from_json_response_if_value_is_null_otherwise_return_img_url($value, $call_back_function_when_not_null)
    {
        if ($value == null) {
            //remove property from json response if value is null
            return $call_back_function_when_not_null($value);
        } else {
            return url('') . $value;
        }
    }

    public static function show_collection_or_not($collection)
    {
        $count_records_in_collection = $collection->count();

        if ($count_records_in_collection > 0) {
            return true;
        } else {
            return false;
        }
    }
}
