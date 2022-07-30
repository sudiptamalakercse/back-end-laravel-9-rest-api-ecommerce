<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserPasswordReset extends Mailable
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
        return $this->view('user.email.user_password_reset')
            ->with([
                'user_password_reset_code' => $this->email_datas['user_password_reset_code'],
                'password_resetter_name' => $this->email_datas['password_resetter_name'],
                'user_type' => $this->email_datas['user_type'],
                'password_reset_code_expiration_time' => $this->email_datas['password_reset_code_expiration_time'],
            ]);
    }
}
