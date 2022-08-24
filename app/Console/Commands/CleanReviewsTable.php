<?php

namespace App\Console\Commands;

use App\Custom_Services\Service1;
use App\Models\Review;
use Illuminate\Console\Command;

class CleanReviewsTable extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'clean:reviews_table';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This will delete the records of reviews table which star is null and not last 10 records';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $last_n_records_ids = [];

        $reviews = Review::orderBy('id', 'DESC')
            ->limit(Service1::$last_n_records_of_reviews_table)
            ->get();

        foreach ($reviews as $review) {
            array_push($last_n_records_ids, $review->id);
        }

        Review::whereNotIn('id', $last_n_records_ids)
            ->where('star', null)
            ->delete();

    }
}
