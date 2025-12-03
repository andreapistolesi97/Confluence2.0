<x-layout>
    <div class="p-8 space-y-12 mt-15">

        <div class="bg-white rounded-xl p-6 border border-gray-200">
            <h1 class="font-bold text-2xl">Real Time Monitoring</h1>
            <p>Choose all these filters to see the results.</p>
        </div>

        <div class="bg-white rounded-xl p-6 border border-gray-200">
            <div class="flex flex-col md:flex-row md:items-center md:space-x-8 mt-3">
                <p class=" mt-6 flex items-center space-x-2">
                    <span>Date Range :</span>
                </p>
                <x-startenddate></x-startenddate>
            </div>


            <hr class="border-1 rounded-lg mt-8">

            <div class="mt-10">
                <button
                    class="text-white text-sm rounded-xl bg-green-600 p-2.5
transition-colors duration-300 ease-in-out hover:bg-green-700 border border-color-gray-600">Run
                    filters</button>
                <button
                    class="text-white text-sm rounded-xl bg-blue-600 p-2.5
transition-colors duration-300 ease-in-out hover:bg-blue-700 border border-color-gray-600">Refresh
                </button>
                <div class="flex justify-end gap-4">
                    <button
                        class="text-gray-600 text-sm rounded-xl bg-gray-100 p-2.5
transition-colors duration-300 ease-in-out hover:bg-gray-200 border border-color-gray-600">Export
                        Airtable
                        CSV
                    </button>
                    <button
                        class="text-gray-600 text-sm rounded-xl bg-gray-100 p-2.5
transition-colors duration-300 ease-in-out hover:bg-gray-200 border border-color-gray-600">Export
                        Confluence
                        CSV
                    </button>
                </div>
            </div>

        </div>

        <div class="mt-6 space-y-5">
            <x-tableairtable></x-tableairtable>
            <x-tableconfluence></x-tableconfluence>

        </div>
    </div>
</x-layout>
