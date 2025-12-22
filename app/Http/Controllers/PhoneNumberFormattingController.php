<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Country;
use Illuminate\Support\Facades\DB;
use App\Support\Fernet;

class PhoneNumberFormattingController extends Controller
{
    public function index()
    {
        $countries = Country::orderBy('Description')->get();
        return view('searches.phonenumberformatting', [
            'countries' => $countries,
            'selectedCountry' => null,
            'prefixes' => [],
        ]);
    }
    public function run(Request $request)
    {


        $request->validate([
            'Country' => ['required', 'string']
        ]);


        $country = $request->input('Country');
        $countries = Country::orderBy('Description')->get();

        $fernet = new Fernet(env('APP_ENC_KEY'));
        $counts = [];

        $prefixesSet = [];

        DB::connection('contacts_mysql')
            ->table('Contacts')
            ->select(['ID_Contact', 'Info_Country', 'phone', 'phone_standardized'])
            ->where('Info_Country', '=', $country)
            ->orderBy('ID_Contact')
            ->chunkById(500, function ($rows) use (&$prefixesSet, $fernet) {

                foreach ($rows as $r) {
                    $token = $r->phone_standardized ?: $r->phone;
                    if (!$token) continue;

                    try {
                        $plain = $fernet->decrypt($token);
                    } catch (\Throwable $e) {
                        continue;
                    }

                    $p = preg_replace('/[^\d+]/', '', trim($plain));
                    if ($p === '') continue;

                    if (str_starts_with($p, '00')) $p = substr($p, 2);
                    if (str_starts_with($p, '+'))  $p = substr($p, 1);
                    if (str_starts_with($p, '39')) $p = substr($p, 2);
                    $p = ltrim($p, '0');

                    if (strlen($p) < 3) continue;

                    $prefix = substr($p, 0, 3);
                    if (!ctype_digit($prefix)) continue;

                    $prefixesSet[$prefix] = true;
                }

                return true;
            }, 'ID_Contact');

        $prefixes = collect(array_keys($prefixesSet))
            ->sort()
            ->values()
            ->all();


        return view('searches.phonenumberformatting', [
            'countries' => $countries,
            'selectedCountry' => $country,
            'prefixes' => $prefixes,
        ]);
    }
}
