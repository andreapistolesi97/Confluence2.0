<x-layout>
    <div class="p-8 space-y-12 mt-15">

        <div class="bg-white rounded-xl p-6 border border-gray-200">
            <h1 class="font-bold text-2xl">Real Time Monitoring</h1>
            <p>Choose all these filters to see the results.</p>
        </div>

        <div class="bg-white rounded-lg p-8 border border-color-gray-200
                    flex flex-col gap-6 md:flex-row md:items-center md:justify-between">

            <div class="flex flex-col sm:flex-row sm:items-center sm:gap-4">
                <p class="flex items-center gap-2 text-sm font-medium text-gray-800 mb-2 sm:mb-0">
                    <span>Date Range</span>
                    <svg class="w-5 h-5 text-gray-800" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M4 10h16m-8-3V4M7 7V4m10 3V4M5 20h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Zm3-7h.01v.01H8V13Zm4 0h.01v.01H12V13Zm4 0h.01v.01H16V13Zm-8 4h.01v.01H8V17Zm4 0h.01v.01H12V17Zm4 0h.01v.01H16V17Z" />
                    </svg>
                    <span>:</span>
                </p>

                <x-startenddate></x-startenddate>
            </div>

            <div class="flex items-center gap-4">
                <button
                    class="text-white text-sm rounded-xl bg-green-600 px-4 py-2
                           transition-colors duration-300 ease-in-out hover:bg-green-700 border border-color-gray-600">
                    Run
                </button>

                <button
                    class="text-white text-sm rounded-xl bg-blue-600 px-4 py-2
                           transition-colors duration-300 ease-in-out hover:bg-blue-700 border border-color-gray-600">
                    Refresh
                </button>
            </div>

        </div>

    </div>
</x-layout>
