<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function send(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:60'],
            'surname' => ['required', 'string', 'max:60'],
            'details' => ['required', 'string', 'max:3000'],
        ]);

        $fullName = $data['name'].''.$data['surname']

        Mail::raw( "Nome: {$fullName}\nEmail: {$data['email']}\n\nMessaggio:\n{$data['details']}", function ($message) use ($data, $fullName) { $message->to('mail@confluence.revdev.it') ->subject("Support Ticket - {$fullName}") ->replyTo($data['email'], $fullName); } );
    }
     return back()->with('success', 'Support request sent successfully!');

}
