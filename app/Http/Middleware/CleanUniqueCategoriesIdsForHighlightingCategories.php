<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;

class CleanUniqueCategoriesIdsForHighlightingCategories
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
        return $next($request);
    }

    public function terminate($request, $response)
    {

        $current_route_name = Route::currentRouteName();

        if ($current_route_name != 'user.products' && $current_route_name != 'user.sale.off.products' && $current_route_name != 'user.latest.products') {

            Session::forget('categories_ids_from_sale_off_products');
            Session::forget('categories_ids_from_products');
            Session::forget('categories_ids_from_latest_products');

            //In API only forget function can not delete session, so we have to use save method to delete session permanently
            Session::save();
        }

    }
}
