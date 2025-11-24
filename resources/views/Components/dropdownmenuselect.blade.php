@props([
    'id' => 'dropdown-result', // ID unico per ogni menu
])

<div class="relative inline-block">

    {{-- BOTTONE --}}
    <button id="btn-{{ $id }}" data-dropdown-toggle="{{ $id }}" {{-- stesso id del menu --}} type="button"
        class="inline-flex items-center justify-between bg-white border border-gray-300 
               text-gray-700 w-[400px] rounded-lg px-4 py-2.5 text-sm shadow-sm">

        {{-- LABEL DINAMICA --}}
        <span class="dropdown-label">Select...</span>

        <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 9-7 7-7-7" />
        </svg>
    </button>

    {{-- MENU --}}
    <div id="{{ $id }}" 
        class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-[400px] border">

        <ul class="py-2 text-sm text-gray-700" aria-labelledby="btn-{{ $id }}">
            <li>
                <a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="All">
                    All
                </a>
            </li>
            <li>
                <a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Not Done">
                    Not Done
                </a>
            </li>
        </ul>

    </div>

</div>

{{-- SCRIPT PER LA SCELTA DELL'ITEM DEL MENU --}}
<script>
    document.addEventListener("DOMContentLoaded", () => {

        const button = document.getElementById("btn-{{ $id }}");
        const wrapper = button.closest("div.relative");
        const label = wrapper.querySelector(".dropdown-label");
        const menu = document.getElementById("{{ $id }}");

        wrapper.querySelectorAll("[data-value]").forEach(option => {
            option.addEventListener("click", function(e) {
                e.preventDefault();

                // Aggiorna label
                label.textContent = this.dataset.value;

                // Chiudi il menu manualmente
                menu.classList.add("hidden");

                button.dispatchEvent(new Event("click"));
            });
        });

    });
</script>
