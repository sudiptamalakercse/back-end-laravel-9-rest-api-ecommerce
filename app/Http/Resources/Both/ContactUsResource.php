<?php

namespace App\Http\Resources\Both;

use Illuminate\Http\Resources\Json\JsonResource;

class ContactUsResource extends JsonResource
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
            'address' => $this->address,
            'phone' => $this->phone,
            'email' => $this->email,
            'open_time' => $this->open_time,
            'img' => url('') . $this->img,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
