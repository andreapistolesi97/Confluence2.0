<x-layout>
    <div class="p-8 space-y-12 mt-15">

        <h1 class="bg-white rounded-xl p-6 border border-gray-200 font-bold text-2xl">
            {{ $title ?? 'Production Logs' }}
        </h1>

        {{-- FORM PER IL FILTRO --}}
        <form method="POST" action="{{ route('productionlogs.run') }}"
            class="bg-white rounded-lg p-7 border border-color-gray-200 
                     flex flex-col sm:flex-row sm:items-center sm:justify-between gap-6">

            @csrf

            <div class="flex flex-col sm:flex-row sm:items-center sm:gap-4">
                <span class="w-60 text-sm text-gray-700 mb-2 font-medium">
                    Choose a Production
                </span>

                <x-dropdownmenulogs id="dropdown-production" :sources="$sources" :current="$current" />
            </div>

            <button type="submit"
                class="text-white text-sm font-medium rounded-xl bg-green-600 px-4 py-2
                       transition-colors duration-300 ease-in-out hover:bg-green-700">
                Run Filters
            </button>
        </form>

        {{-- TABELLA LOGS --}}
        @if ($rows->isNotEmpty())
            <div
                class="relative overflow-x-auto overflow-y-auto max-h-[70vh] border border-gray-200 rounded-lg shadow-sm mt-8">
                <table class="min-w-full text-sm text-left text-gray-700">
                    <thead class="bg-white text-sm font-semibold whitespace-nowrap border-b border-gray-200">
                        <tr>
                            <th class="px-4 py-3 cursor-pointer">ID_Production-Log</th>
                            <th class="px-4 py-3 cursor-pointer">Timestamp-UTC</th>
                            <th class="px-4 py-3 cursor-pointer">Production Snapshot</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach ($rows as $row)
                            <tr class="bg-white border-b hover:bg-gray-50">
                                <td class="px-4 py-2">{{ $row->{'ID_Production-Log'} ?? ($row->id ?? '-') }}</td>
                                <td class="px-4 py-2">{{ $row->{'Timestamp-UTC'} ?? ($row->timestamp ?? '-') }}</td>
                                <td class="px-4 py-2 text-gray-800">{{ $row->ProductionSnapshot ?? ($row->productionsnapshot ?? '-') }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        @else
            <p class="text-gray-500 text-sm mt-8">No logs found for the selected source.</p>
        @endif

    </div>
    
</x-layout>
