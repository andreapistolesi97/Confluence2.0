@props([
    'id' => 'dropdown-logs',
    'sources' => collect(),
    'current' => null,
])

<div class="relative inline-block w-full">

    <input type="hidden" name="log" id="input-{{ $id }}" value="{{ $current->id ?? '' }}">

    {{-- BUTTON --}}
    <button id="btn-{{ $id }}" data-dropdown-toggle="{{ $id }}" type="button"
        class="inline-flex items-center justify-between bg-white border border-gray-300 
               text-gray-700 w-[400px] rounded-lg px-4 py-2.5 text-sm shadow-sm">
        <span class="dropdown-label">
            {{ $current?->label ?? 'Select...' }}
        </span>

        <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
            stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 9-7 7-7-7" />
        </svg>
    </button>

    {{-- MENU --}}
    <div id="{{ $id }}"
        class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-[400px] max-h-64 overflow-y-auto">

        <ul class="py-2 text-sm text-gray-700" aria-labelledby="btn-{{ $id }}">
            @foreach ($sources as $source)
                <li>
                    <a href="#" data-id="{{ $source->id }}" data-label="{{ $source->label }}"
                        class="block px-4 py-2 hover:bg-gray-100 dropdown-option">
                        {{ $source->label }}
                    </a>
                </li>
            @endforeach
        </ul>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {

        const button = document.getElementById("btn-{{ $id }}");
        const wrapper = button.closest("div.relative");
        const label = wrapper.querySelector(".dropdown-label");
        const menu = document.getElementById("{{ $id }}");
        const hidden = document.getElementById("input-{{ $id }}");

        wrapper.querySelectorAll(".dropdown-option").forEach(option => {
            option.addEventListener("click", (e) => {
                e.preventDefault();

                // Aggiorno testo visibile
                label.textContent = option.dataset.label;

                // Imposto ID sorgente selezionata per il controller
                hidden.value = option.dataset.id;

                // Chiudo il menu
                menu.classList.add("hidden");
            });
        });
    });
</script>
