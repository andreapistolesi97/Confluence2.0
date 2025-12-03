<x-layout>
    <div class="p-8 space-y-12 mt-15">
        <div class="bg-white border border-color-gray-200 rounded-lg p-6 space-y-6">
            <h1 class ="font-bold text-2xl">Phone Number Formatting</h1>
            <span class="block"> Select from the dropdownmenu the country you want to analyze</span>
        </div>

        <x-dropdownmenucountry id="dropdown-country" :countries="$countries" />


        <div class="flex items-center gap-20">
            <div>
                <button
                    class="text-white text-sm font-medium  rounded-xl bg-green-600 p-2.5
transition-colors duration-300 ease-in-out hover:bg-green-700 border border-color-gray-600">
                    Search</button>
            </div>

        </div>
</x-layout>
