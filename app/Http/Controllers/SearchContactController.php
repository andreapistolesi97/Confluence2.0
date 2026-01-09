<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Support\Fernet;
use Illuminate\Support\Facades\DB;

class SearchContactController extends Controller
{
    private function safeDecrypt(Fernet $fernet, ?string $token): ?string
{
    if (!$token) return null;

    try {
        return $fernet->decrypt($token);
    } catch (\Throwable $e) {
        return null;
    }
}
    public function index()
    {
        return view('searches.contacts', [
            'contact' => null,
            'message' => null,
        ]);
    }
    private function normEmail(?string $email): ?string
    {
        return $email ? mb_strtolower(trim($email)) : null;
    }
    private function normPhone(?string $phone): ?string
    {
        if (!$phone) return null;
        return preg_replace('/[^\d+]/', '', trim($phone)) ?: null;
    }
    public function search(Request $request)
    {
        $request->validate([
            'email' => ['nullable', 'string'],
            'phone' => ['nullable', 'string'],

        ]);
        $emailIn = $this->normEmail($request->input('email'));
        $phoneIn = $this->normPhone($request->input('phone'));

        if (!$emailIn && !$phoneIn) {
            return view('searches.contacts', [
                'contact' => null,
                'message' => 'Insert at least one search criteria.',
            ]);
        }

        $key = config('fernet.key');

        if (!$key) {
            abort(500, 'APP_ENC_KEY missing');
        }

        $fernet = new Fernet($key);
        $found = null;

        DB::connection('contacts_mysql')
            ->table('Contacts')
            ->select([
                'ID_Contact',
                'email',
                'email_standardized',
                'phone',
                'phone_standardized',
                'firstname',
                'lastname',
                'Info_Country',
                'Check_Blacklist'
            ])->orderBy('ID_Contact')
            ->chunkById(200, function ($rows) use (&$found, $fernet, $emailIn, $phoneIn) {

                foreach ($rows as $r) {
                    $emailToken = $r->email_standardized ?: $r->email;
                    $phoneToken = $r->phone_standardized ?: $r->phone;

                    $emailPlain = $r->email_standardized
    ? $this->safeDecrypt($fernet, $r->email_standardized)
    : ($r->email ?: null);

$phonePlain = $r->phone_standardized
    ? $this->safeDecrypt($fernet, $r->phone_standardized)
    : ($r->phone ?: null);

                    $emailPlainN = $this->normEmail($emailPlain);
                    $phonePlainN = $this->normPhone($phonePlain);

                    $matchEmail = $emailIn && ($emailPlainN === $emailIn);
                    $matchPhone = $phoneIn && ($phonePlainN === $phoneIn);

                    if ($matchEmail || $matchPhone) {
                        $found = [
                            'ID_Contact' => $r->ID_Contact,
                            'firstname' => $r->firstname,
                            'lastname' => $r->lastname,
                            'Info_Country' => $r->Info_Country,
                            'email_plain' => $emailPlain,
                            'phone_plain' => $phonePlain,
                        ];
                        return false;
                    }
                }

                return true;
            }, 'ID_Contact');

        if (!$found) {
            return view('searches.contacts', [
                'contact' => null,
                'message' => 'This contact is not in our DB.',
            ]);
        }

        return view('searches.contacts', [
            'contact' => $found,
            'message' => null,
        ]);
    }
}
