<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class MonitoringController extends Controller
{
    public function run(Request $request)
    {
        $validated = $request->validate([
            'start_date' => 'required|date',
            'end_date'   => 'required|date|after_or_equal:start_date',
        ]);

        $payload = [
            'type'    => 'monitoring',
            'filters' => [
                'start_date' => $validated['start_date'],
                'end_date'   => $validated['end_date'],
            ],
        ];

        $t0 = microtime(true);

        try {
            $response = Http::asJson()
                ->connectTimeout(20)
                ->timeout(200)
                ->post(
                    'https://us-central1-tidy-tine-302317.cloudfunctions.net/diagnostic_monitoring_production',
                    $payload
                );

            Log::info('Monitoring elapsed', [
                's' => round(microtime(true) - $t0, 2),
                'status' => $response->status(),
            ]);

            $data = $response->json();
            if ($data === null) {
                return response($response->body(), $response->status())
                    ->header('Content-Type', $response->header('Content-Type') ?? 'text/plain');
            }

            return response()->json($data, $response->status());
        } catch (\Throwable $e) {
            Log::error('Monitoring error', ['message' => $e->getMessage()]);

            return response()->json([
                'error'   => 'connection_error',
                'message' => $e->getMessage(),
            ], 502);
        }
    }
}
