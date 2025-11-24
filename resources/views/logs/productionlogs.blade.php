<x-layout>
    <div class="p-8 space-y-12 mt-15">

        <h1 class="bg-white rounded-xl p-6 border border-gray-200 font-bold text-2xl">
            Production Logs
        </h1>

        <div class="bg-white rounded-lg p-7 border border-color-gray-200 
                    flex flex-col sm:flex-row sm:items-center sm:justify-between gap-6">

            <div class="flex flex-col sm:flex-row sm:items-center sm:gap-4">
                <span class="text-gray-700 text-sm w-60">Choose a Production :</span>
                <x-dropdownmenulogs id="dropdown-production" />
            </div>

            <button
                class="text-white text-sm rounded-xl bg-green-600 px-4 py-2
                       transition-colors duration-300 ease-in-out hover:bg-green-700">
                Run Filters
            </button>
        </div>

    </div>
</x-layout>
