<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class BloggerPasswordReset extends Mailable
{
    use Queueable, SerializesModels;

     protected $email_datas;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(array $email_datas)
    {
        $this->email_datas=$email_datas;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('blogger.email.blogger_password_reset')
                    ->with([
                        'blogger_password_reset_link' => $this->email_datas['blogger_password_reset_link'],
                        'password_resetter_name' => $this->email_datas['password_resetter_name'],
                        'user_type' => $this->email_datas['user_type']
                    ]);
    }
}
