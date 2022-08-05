<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class EmailSend extends Mailable
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
        return $this->subject($this->email_datas['subject_of_email'])
            ->view('email.email_send')
            ->with([
                'line1_text_of_email' => $this->email_datas['line1_text_of_email'],
                'line2_text_of_email' => $this->email_datas['line2_text_of_email'],
            ]);
    }
}
