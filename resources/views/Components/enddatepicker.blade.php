<div class="relative max-w-sm">

    {{-- hidden per Laravel --}}
    <input type="hidden" name="end_date" id="input-end-date">

    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
        <svg class="w-4 h-4 text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
            stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M8 7V3m8 4V3m-9 8h10m-12 9h14a1 1 0 001-1V7a1 1 0 00-1 1H5a1 1 0 00-1 1v12a1 1 0 001 1z" />
        </svg>
    </div>

    <input id="end-datepicker" datepicker datepicker-format="yyyy-mm-dd" type="text" placeholder="Select date"
        autocomplete="off" value=""
        class="block w-[400px] pl-9 pr-3 py-2.5 
               bg-white border border-gray-300 rounded-lg shadow-sm
               focus:ring-blue-500 focus:border-blue-500 text-sm text-gray-700">
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {

        const input = document.getElementById("end-datepicker");
        const hidden = document.getElementById("input-end-date");

        // Reset valore visibile dopo ogni reload
        input.value = "";

        input.addEventListener("change", () => {

            hidden.value = input.value;

            try {
                const dpInstance = input._datepicker;
                if (dpInstance) {
                    dpInstance.hide();
                }
            } catch (e) {
                console.warn("Flowbite datepicker instance non trovata:", e);
            }

        });
    });
</script>
