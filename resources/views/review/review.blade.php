<x-layout>

    <div class="bg-white p-6 rounded-lg border border-color-gray-200">
        <h1 class="text-2xl font-bold">Review</h1>
        <span class="block">Review your data and actions.</span>
    </div>

    <div class="bg-white rounded-lg border border-color-gray-200 p-6 mt-6">
        <div class="grid grid-cols-[240px_1fr] items-center gap-y-6 gap-x-10">
            <span class="text-sm text-gray-700 font-medium">Choose a Business Driver</span>
            <x-dropdownmenubusinessdriver id="business-driver" :drivers="$drivers" />

            <span class="text-sm text-gray-700 font-medium">Choose a Qualification Settings</span>
            <x-dropdownmenuqualification id="dropdown-qualification" />

            <span class="text-sm text-gray-700 font-medium">Choose a Priority</span>
            <div><!-- priority dropdown placeholder --></div>

            <span class="text-sm text-gray-700 font-medium">Choose a Country</span>
            <x-dropdownmenucountry id="dropdown-country" :countries="$countries" />

        </div>

        <button
            class="text-white text-sm font-medium rounded-xl bg-green-600 px-5 py-2.5
                               transition hover:bg-green-700 border border-color-gray-700 mt-6">
            Run filters
        </button>
    </div>



    </div>
</x-layout>
