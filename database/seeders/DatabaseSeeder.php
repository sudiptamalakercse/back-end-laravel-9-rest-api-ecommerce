<?php

namespace Database\Seeders;

use App\Models\Admin;
use App\Models\BillingDetail;
use App\Models\Category;
use App\Models\ContactUs;
use App\Models\Discount;
use App\Models\Message;
use App\Models\NewsLetter;
use App\Models\Product;
use App\Models\ProductColor;
use App\Models\ProductImg;
use App\Models\ProductInformation;
use App\Models\ProductOrder;
use App\Models\ProductOrderByAdminToCompany;
use App\Models\ProductSize;
use App\Models\Review;
use App\Models\Shipping;
use App\Models\StokeOutProductRequestByUserToAdmin;
use App\Models\Unit;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        User::factory(10)->create();
        Admin::factory(1)->create();
        Category::factory(10)->create();
        Shipping::factory(10)->create();
        Unit::factory(10)->create();
        ProductSize::factory(10)->create();
        ProductColor::factory(10)->create();
        BillingDetail::factory(10)->create();
        ProductOrder::factory(10)->create();
        Discount::factory(10)->create();
        Message::factory(10)->create();
        ContactUs::factory(1)->create();
        NewsLetter::factory(10)->create();
        ProductInformation::factory(10)->create();
        Product::factory(10)->create();
        StokeOutProductRequestByUserToAdmin::factory(1)->create();
        ProductOrderByAdminToCompany::factory(1)->create();
        ProductImg::factory(10)->create();
        Review::factory(10)->create();

    }
}
