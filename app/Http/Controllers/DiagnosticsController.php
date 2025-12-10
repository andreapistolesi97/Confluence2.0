<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Client\ConnectionException;

class DiagnosticsController extends Controller
{
    public function run(Request $request)
    {
        // prendo i dati dal frontend
        $start_date   = $request->input('start_date');
        $end_date     = $request->input('end_date');
        $offer_number = $request->input('offer_number');

        // costruisco il payload ESATTAMENTE come l'esempio Python
        $payload = [
            'type'    => 'diagnostics',
            'filters' => [
                'start_date'   => $start_date,
                'end_date'     => $end_date,
                'offer_number' => $offer_number !== null && $offer_number !== ''
                    ? (int) $offer_number
                    : null,
            ],
        ];

        Log::info('Invio payload a CF', ['payload' => $payload]);

        try {
            $response = Http::timeout(20)->post(
                'https://us-central1-tidy-tine-302317.cloudfunctions.net/diagnostic_monitoring_production',
                $payload
            );
        } catch (ConnectionException $e) {
            Log::error('Timeout nella chiamata alla Cloud Function', [
                'message' => $e->getMessage(),
            ]);

            return response()->json([
                'error' => 'Timeout nella chiamata al servizio di diagnostics',
            ], 504);
        }

        $status  = $response->status();
        $rawBody = $response->body();

        Log::info('Risposta CF', [
            'status' => $status,
            'body'   => $rawBody,
        ]);

        $decoded = json_decode($rawBody, true);
        if (json_last_error() === JSON_ERROR_NONE) {
            return response()->json($decoded, $status);
        }

        return response($rawBody, $status)
            ->header('Content-Type', $response->header('Content-Type') ?? 'text/plain');
    }
}
