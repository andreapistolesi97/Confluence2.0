<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Address;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ContactInquiryMail extends Mailable
{
    use Queueable, SerializesModels;

    public function __construct(
        public string $name,
        public string $surname,
        public string $email,
        public string $details,
    ) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'New contact inquiry - Confluence',
            replyTo: [new Address($this->email, trim($this->name.' '.$this->surname))],
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'help.contact-inquiry',
        );
    }
}