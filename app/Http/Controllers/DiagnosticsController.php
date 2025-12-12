<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class DiagnosticsController extends Controller
{
    public function run(Request $request)
    {
        // 1) Validazione input (dal FRONTEND)
        $validated = $request->validate([
            'start_date'    => 'required|date',
            'end_date'      => 'required|date|after_or_equal:start_date',
            'offer_number'  => 'nullable|string',
        ]);

        // 2) Payload nel formato atteso dalla CLOUD FUNCTION
        $payload = [
            'type'    => 'diagnostics',
            'filters' => [
                'start_date'   => $validated['start_date'],
                'end_date'     => $validated['end_date'],
                'offer_number' => $validated['offer_number'] ?? null,
            ],
        ];

        Log::info('Diagnostics - Invio payload a CF', ['payload' => $payload]);

        try {
            $response = Http::asJson()->post(
                'https://us-central1-tidy-tine-302317.cloudfunctions.net/diagnostic_monitoring_production',
                $payload
            );

            Log::info('Diagnostics - Risposta CF', [
                'status' => $response->status(),
                'body'   => $response->body(),
            ]);

            if ($response->successful()) {
                return response()->json($response->json(), $response->status());
            }

            return response()->json([
                'error'   => 'Cloud Function error',
                'status'  => $response->status(),
                'details' => $response->body(),
            ], $response->status());
        } catch (\Exception $e) {
            Log::error('Diagnostics - Errore CF', ['message' => $e->getMessage()]);

            return response()->json([
                'error'   => 'Timeout o errore di connessione',
                'message' => $e->getMessage(),
            ], 504);
        }
    }
}
