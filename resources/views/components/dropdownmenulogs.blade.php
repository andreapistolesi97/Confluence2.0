@props([
    'id' => 'dropdown-scheduler',
])

<div class="relative inline-block">
    <button
        id="btn-{{ $id }}"
        data-dropdown-toggle="{{ $id }}"
        type="button"
        class="inline-flex items-center justify-between bg-white border border-gray-300 
               text-gray-700 w-[400px] rounded-lg px-4 py-2.5 text-sm shadow-sm"
    >
        <span class="dropdown-label">Select...</span>

        <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" fill="none"
             viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="m19 9-7 7-7-7" />
        </svg>
    </button>

    <div
        id="{{ $id }}"
        class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-[400px] border"
    >
        <ul class="py-2 text-sm text-gray-700" aria-labelledby="btn-{{ $id }}">

            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Custom-Proxy IT">Custom-Proxy IT</a></li>
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Custom-Proxy FR">Custom-Proxy FR</a></li>
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Custom-Proxy ES">Custom-Proxy ES</a></li>
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Custom-Proxy Others">Custom-Proxy Others</a></li>
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Frogproxy IT">Frogproxy IT</a></li>
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Frogproxy FR">Frogproxy FR</a></li>

        </ul>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", () => {

    const button = document.getElementById("btn-{{ $id }}");
    const wrapper = button.closest("div.relative");
    const label = wrapper.querySelector(".dropdown-label");
    const menu = document.getElementById("{{ $id }}");

    wrapper.querySelectorAll("[data-value]").forEach(option => {
        option.addEventListener("click", function(e) {
            e.preventDefault();

            // Aggiorna testo della label
            label.textContent = this.dataset.value;

            // Chiudi menu
            menu.classList.add("hidden");

            // Reset Flowbite
            button.dispatchEvent(new Event("click"));
        });
    });

});
</script>
