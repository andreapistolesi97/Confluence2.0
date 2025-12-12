<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class DiagnosticsController extends Controller
{
    public function run(Request $request)
    {
        $validated = $request->validate([
            'start_date'   => 'required|date',
            'end_date'     => 'required|date|after_or_equal:start_date',
            'offer_number' => 'nullable|string',
        ]);

        $payload = [
            'type'    => 'diagnostics',
            'filters' => [
                'start_date'   => $validated['start_date'],
                'end_date'     => $validated['end_date'],
                'offer_number' => $validated['offer_number'] ?? null,
            ],
        ];

        $t0 = microtime(true);
        Log::info('Diagnostics - START', ['t0' => $t0, 'payload' => $payload]);

        try {
            $response = Http::asJson()->post(
                'https://us-central1-tidy-tine-302317.cloudfunctions.net/diagnostic_monitoring_production',
                $payload
            );

            Log::info('Diagnostics - END', [
                'elapsed_s' => round(microtime(true) - $t0, 3),
                'status'    => $response->status(),
                'body'      => $response->body(),
            ]);

            return response()->json($response->json(), $response->status());
        } catch (\Throwable $e) {
            Log::error('Diagnostics - EXCEPTION', [
                'elapsed_s' => round(microtime(true) - $t0, 3),
                'message'   => $e->getMessage(),
            ]);

            return response()->json([
                'error'   => 'connection_error',
                'message' => $e->getMessage(),
            ], 502);
        }
    }
}
