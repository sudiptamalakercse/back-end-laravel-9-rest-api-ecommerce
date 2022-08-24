<?php

namespace App\Custom_Services;

use Illuminate\Support\Facades\DB;

class UserControllerService
{
    public static function get_unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table()
    {

        $unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table = DB::table('reviews')
            ->select(DB::raw('product_id, count(product_id) as occurrences'))
            ->groupBy('product_id')
            ->orderBy('occurrences', 'DESC')
            ->get();

        return $unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table;
    }
}
