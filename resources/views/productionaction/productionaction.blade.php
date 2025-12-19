<x-layout>
    <div class="p-8 space-y-12 mt-15">

        <!-- HEADER -->
        <div class="bg-white rounded-xl p-6 border border-gray-200 space-y-2">
            <h1 class="font-bold text-2xl">Production Action</h1>
            <span class="block text-gray-600">Choose a business driver and a country to see the results</span>
        </div>

        <div class="bg-white rounded-lg p-6 border border-color-gray-600 space-y-10">
            <div class="grid grid-cols-[240px_1fr] items-center gap-y-6 gap-x-10">
                <span class="text-sm text-gray-700 font-medium">Choose a Business Driver</span>
                <x-dropdownmenubusinessdriver id="business-driver" :drivers="$drivers" />

                <span class="text-sm text-gray-700 font-medium">Choose a Country</span>
                <x-dropdownmenucountry id="dropdown-country" :countries="$countries" />
            </div>
            <div class="space-x-6 flex flex-items">
                <button
                    class="text-white text-sm rounded-xl bg-green-600 px-5 py-2.5
                transition hover:bg-green-700 border border-color-gray-700">
                    Start Production
                </button>
                <button
                    class="text-white text-sm rounded-xl bg-red-600 px-5 py-2.5
                transition hover:bg-red-700 border border-color-gray-700">
                    Stop Production
                </button>
            </div>
        </div>



</x-layout>
