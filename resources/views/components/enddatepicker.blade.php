<div class="relative w-full max-w-sm">
    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
        <svg class="w-4 h-4 text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
            viewBox="0 0 24 24">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M4 10h16m-8-3V4M7 7V4m10 3V4M5 20h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Zm3-7h.01v.01H8V13Zm4 0h.01v.01H12V13Zm4 0h.01v.01H16V13Zm-8 4h.01v.01H8V17Zm4 0h.01v.01H12V17Zm4 0h.01v.01H16V17Z" />
        </svg>
    </div>

    <input datepicker datepicker-orientation="bottom" datepicker-autohide="true" datepicker-format="yyyy-mm-dd"
        name="end_date" id="end_date" type="text"
        class="block w-full pl-10 pr-3 py-2.5 bg-neutral-secondary-medium border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500"
        placeholder="Select date">
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        const input = document.getElementById("end_date");
        const hidden = document.getElementById("input-end-date");

        const today = new Date();
        if (today.getDay() === 5) { // venerdì
            today.setDate(today.getDate() + 2); // passa alla domenica
        }

        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, '0');
        const dd = String(today.getDate()).padStart(2, '0');
        const formatted = `${yyyy}-${mm}-${dd}`;

        input.value = formatted;
        if (hidden) {
            hidden.value = formatted;
        }

        input.addEventListener("change", () => {
            if (hidden) {
                hidden.value = input.value;
            }
        });

        input.addEventListener("click", () => {

        });
    });
</script>
