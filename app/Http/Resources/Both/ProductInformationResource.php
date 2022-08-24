<?php

namespace App\Http\Resources\Both;

use App\Http\Resources\Both\CategoryResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductInformationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'detail' => $this->detail,
            'information' => $this->information,
            'category' => new CategoryResource($this->category),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,

        ];
    }
}
