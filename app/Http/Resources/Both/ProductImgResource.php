<?php

namespace App\Http\Resources\Both;

use App\Custom_Services\Service1;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductImgResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $call_back_function_when_not_null = function ($value) {
            return $this->whenNotNull($value);
        };

        return [
            'id' => $this->id,
            'img' => Service1::remove_property_from_json_response_if_value_is_null_otherwise_return_img_url(value:$this->img, call_back_function_when_not_null:$call_back_function_when_not_null),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
