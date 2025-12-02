<div id="date-range-picker" datepicker-format="yyyy-mm-dd"date-rangepicker class="flex items-start space-x-6 rounded-lg">

    <!-- START DATE -->
    <div class="flex flex-col">
        <label for="datepicker-range-start" class=" text-sm mb-1">Start Date</label>

        <div class="relative">
            <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                <svg class="w-4 h-4 text-body" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M4 10h16m-8-3V4M7 7V4m10 3V4M5 20h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Zm3-7h.01v.01H8V13Zm4 0h.01v.01H12V13Zm4 0h.01v.01H16V13Zm-8 4h.01v.01H8V17Zm4 0h.01v.01H12V17Zm4 0h.01v.01H16V17Z" />
                </svg>
            </div>

            <input id="datepicker-range-start" name="start" type="text"
                class="block w-full ps-9 pe-3 py-2.5 bg-neutral-secondary-medium border border-default-medium 
                       text-heading text-sm rounded-lg focus:outline-indigo-600 shadow-xs
                       placeholder:text-body"
                placeholder="Select date start">
        </div>
    </div>

    <!-- END DATE -->
    <div class="flex flex-col">
        <label for="datepicker-range-end" class=" text-sm mb-1">End Date</label>

        <div class="relative">
            <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                <svg class="w-4 h-4 text-body" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M4 10h16m-8-3V4M7 7V4m10 3V4M5 20h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Zm3-7h.01v.01H8V13Zm4 0h.01v.01H12V13Zm4 0h.01v.01H16V13Zm-8 4h.01v.01H8V17Zm4 0h.01v.01H12V17Zm4 0h.01v.01H16V17Z" />
                </svg>
            </div>

            <input id="datepicker-range-end" name="end" type="text"
                class="block w-full ps-9 pe-3 py-2.5 bg-neutral-secondary-medium border border-default-medium 
                       text-heading text-sm rounded-lg focus:outline-indigo-600 shadow-xs
                       placeholder:text-body"
                placeholder="Select date end">
        </div>
    </div>

</div>
