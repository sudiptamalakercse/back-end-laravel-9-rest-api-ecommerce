<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserEmailVerification extends Mailable
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
        $this->email_datas = $email_datas;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('user.email.user_email_verification')
            ->with([
                'email_activation_code' => $this->email_datas['email_activation_code'],
                'email_receiver_name' => $this->email_datas['email_receiver_name'],
                'user_type' => $this->email_datas['user_type'],
            ]);
    }
}
