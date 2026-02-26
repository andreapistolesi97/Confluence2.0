<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\ContactInquiryMail;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function send(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:60'],
            'email' => ['required','email','max:60'],
            'surname' => ['required', 'string', 'max:60'],
            'details' => ['required', 'string', 'max:3000'],
        ]);

        Mail::to('mail@confluence.revdev.it')->send(new ContactInquiryMail(
            name: $data['name'],
            surname: $data['surname'] ?? '',
            email: $data['email'],
            details: $data['details']
        ));

        
     return back()->with('success', 'Support request sent successfully!');

}
}