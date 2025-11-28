@props(['id', 'countries'])

<div class="relative inline-block">

    <button id="btn-{{ $id }}" data-dropdown-toggle="{{ $id }}" type="button"
        class="inline-flex items-center justify-between bg-white border border-gray-300 
               text-gray-700 w-[400px] rounded-lg px-4 py-2.5 text-sm shadow-sm">
        <span class="dropdown-label">Select Country...</span>

        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 9-7 7-7-7" />
        </svg>
    </button>

    <div id="{{ $id }}"
        class="z-10 hidden bg-white shadow w-[400px] border rounded-lg
            max-h-64 overflow-y-auto">
        <ul class="py-2 text-sm text-gray-700" aria-labelledby="btn-{{ $id }}">

            @foreach ($countries as $country)
                <li>
                    <a href="#" class="block px-4 py-2 hover:bg-gray-100"
                        data-value="{{ $country->Description }}">
                        {{ $country->Description }}
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

        wrapper.querySelectorAll("[data-value]").forEach(option => {
            option.addEventListener("click", function(e) {
                e.preventDefault();

                label.textContent = this.dataset.value;

                menu.classList.add("hidden");

                // Fix del doppio click (Flowbite)
                button.dispatchEvent(new Event("click"));
            });
        });

    });
</script>
