<?php

namespace App\Http\Resources\Both;

use App\Custom_Services\Service1;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     *
     */

    public function toArray($request)
    {

        $call_back_function_when_not_null = function ($value) {
            return $this->whenNotNull($value);
        };

        return [
            'id' => $this->id,
            'name' => $this->name,
            'img' => Service1::remove_property_from_json_response_if_value_is_null_otherwise_return_img_url(value:$this->img, call_back_function_when_not_null:$call_back_function_when_not_null),
            'is_size_available' => Service1::yes_or_no($this->is_size_available),
            'is_color_available' => Service1::yes_or_no($this->is_color_available),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
