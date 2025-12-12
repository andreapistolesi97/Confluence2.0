<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class MonitoringController extends Controller
{

    public function run(Request $request)
    {
        $start = $request->input('start_date');
        $end   = $request->input('end_date');

        if (!$start || !$end) {
            return response()->json([
                'error'   => 'invalid_input',
                'message' => 'start_date e end_date sono obbligatori',
            ], 400);
        }

        $payload = [
            'type'    => 'monitoring',
            'filters' => [
                'start_date' => $start,
                'end_date'   => $end,
            ],
        ];

        Log::info('Monitoring - Invio payload a CF', ['payload' => $payload]);

        @set_time_limit(300);

        try {
            $response = Http::asJson()
                ->connectTimeout(15)
                ->post(
                    'https://us-central1-tidy-tine-302317.cloudfunctions.net/diagnostic_monitoring_production',
                    $payload
                );

            Log::info('Monitoring - Risposta CF', [
                'status' => $response->status(),
                'body'   => $response->body(),
            ]);

            if ($response->successful()) {
                return response()->json($response->json(), $response->status());
            }

            return response()->json([
                'error'   => 'cloud_function_error',
                'status'  => $response->status(),
                'details' => $response->body(),
            ], $response->status());
        } catch (\Exception $e) {
            Log::error('Monitoring - Errore CF', ['message' => $e->getMessage()]);

            return response()->json([
                'error'   => 'connection_error',
                'message' => 'Errore di connessione verso la Cloud Function',
                'detail'  => $e->getMessage(),
            ], 500);
        }
    }
}
