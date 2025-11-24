<x-layout>

    <div class="p-8 space-y-12 mt-15">

        <!-- HEADER -->
        <div class="bg-white rounded-xl p-6 border border-gray-200 space-y-2">
            <h1 class="font-bold text-2xl">Auto Coupling Overview</h1>
            <span class="block text-gray-600">Choose all these filters to see the results</span>
        </div>

        <!-- FILTER CONTAINER -->
        <div class="bg-white rounded-lg p-7 border border-gray-200 space-y-10">

            <!-- FILA 1 -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-10">

                <!-- BUSINESS -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-2">
                        Choose a business driver :
                    </label>
                    <x-dropdownmenubusinessdriver id="business-driver" :drivers="$drivers" />
                </div>

                <!-- RESULT TYPE -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-2">
                        Choose a results type :
                    </label>
                    <x-dropdownmenuselect id="dropdown-result" />
                </div>

            </div>

            <!-- FILA 2 -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-10">

                <!-- QUALIFICATION -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-2">
                        Choose a qualification settings :
                    </label>
                    <x-dropdownmenuqualification id="dropdown-qualification" />
                </div>

                <!-- END DATE -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-2">
                        Choose an End Date :
                    </label>
                    <x-enddatepicker />
                </div>

            </div>

        </div>

        <!-- RUN BUTTON -->
        <div class="mt-4">
            <button
                class="text-white text-sm rounded-xl bg-green-600 px-5 py-2.5
                transition hover:bg-green-700 border border-color-gray-700">
                Run Filters
            </button>
        </div>

        <!-- TABLE -->
        <div class="mt-6">
            <x-tablecoupling />
        </div>

    </div>

</x-layout>
