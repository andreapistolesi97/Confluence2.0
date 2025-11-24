<x-layout>
    <div class="p-8 space-y-12 mt-15">

        <!-- HEADER -->
        <div class="bg-white rounded-xl p-6 border border-gray-200 space-y-2">
            <h1 class="font-bold text-2xl">Production Action</h1>
            <span class="block text-gray-600">Choose a business driver and a country to see the results</span>
        </div>

        <div class="bg-white rounded-lg p-6 border border-color-gray-600 space-y-10">
            <div class="flex flex-col">
                <label class="text-sm text-gray-700 mb-2">
                    Choose a business driver :
                </label>
                <x-dropdownmenubusinessdriver id="business-driver" :drivers="$drivers" />
            </div>

            <div class="flex flex-col">
                <label class="text-sm text-gray-700 mb-2">
                    Choose a country:
                </label>
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
