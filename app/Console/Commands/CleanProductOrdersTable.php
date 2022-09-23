<?php

namespace App\Console\Commands;

use App\Models\ProductOrder;
use Illuminate\Console\Command;

class CleanProductOrdersTable extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'clean:product_orders_table';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This will delete the records of product_orders table which are canceled by user';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        ProductOrder::where('is_canceled', 1)
            ->delete();
    }
}
