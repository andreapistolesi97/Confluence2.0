<x-layout>

    <div class="p-8 space-y-12 mt-15">


        <div class="bg-white rounded-xl p-6 border border-gray-200 space-y-6">
            <h1 class ="font-bold text-2xl">Diagnostics</h1>
            <span class="block">Choose all these filters to see the results.</span>
        </div>

        <div class="bg-white rounded-xl p-6 border border-gray-200">
            <div class="flex flex-col md:flex-row md:items-center md:space-x-8 mt-3">
                <p class=" mt-6 flex items-center space-x-2">
                    <span>Date Range</span>

                    <svg class="w-5 h-5 text-gray-800 dark:text-white" aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4 10h16m-8-3V4M7 7V4m10 3V4M5 20h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Zm3-7h.01v.01H8V13Zm4 0h.01v.01H12V13Zm4 0h.01v.01H16V13Zm-8 4h.01v.01H8V17Zm4 0h.01v.01H12V17Zm4 0h.01v.01H16V17Z" />
                    </svg>
                </p>
                <x-startenddate></x-startenddate>
            </div>


            <hr class="border-1 rounded-lg mt-8">

            <div class="mt-8 flex flex-col sm:flex-row sm:items-center sm:space-x-4 gap-3">
                <label for="offer">Insert an offer number : </label>
                <input id="offer" type="text" name="offer"
                    class="h-10 border border-black-600 rounded-md bg-white px-3 text-base text-gray-900 
               outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 
               focus:outline-indigo-600 sm:text-sm/6"
                    placeholder="es. 1234" />
            </div>
        </div>



        <div class="mt-4">
            <button
                class="text-white text-sm rounded-xl bg-green-600 p-2.5
transition-colors duration-300 ease-in-out hover:bg-green-700 border border-color-gray-600">Run
                filters</button>
        </div>
</x-layout>
