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
        $payload = $request->all();

        try {
            // timeout di 20 secondi (ad esempio)
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
            ], 504); // 504 Gateway Timeout
        }

        $status  = $response->status();
        $rawBody = $response->body();

        $decoded = json_decode($rawBody, true);
        if (json_last_error() === JSON_ERROR_NONE) {
            return response()->json($decoded, $status);
        }

        return response($rawBody, $status)
            ->header('Content-Type', $response->header('Content-Type') ?? 'text/plain');
    }
}
