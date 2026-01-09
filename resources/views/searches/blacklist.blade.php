<x-layout>
    <div class="p-8 mt-15 space-y-10">
        <div class="bg-white rounded-lg border border-color-gray-200 p-6">
            <h1 class="font-bold text-2xl">Blacklist</h1>
            <span class="block">Here you can upload blacklisted contact from a File csv choosing a business
                driver</span>
        </div>

        <div class="mt-5">
            <div class="bg-white rounded-lg border border-color-gray-200 p-6">
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-2 font-medium">
                        Choose a Business Driver
                    </label>
                    <x-dropdownmenubusinessdriver id="business-driver" :drivers="$drivers" />
                </div>

                <div class="mt-4">
                    <button
                        class="text-white text-sm font-medium rounded-xl bg-green-600 px-5 py-2.5
                               transition hover:bg-green-700 border border-color-gray-700">Import
                        Blacklist</button>

                </div>
            </div>
        </div>
    </div>
</x-layout>
