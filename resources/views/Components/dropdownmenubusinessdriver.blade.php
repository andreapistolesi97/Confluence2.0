@props(['id', 'drivers'])

<div class="relative inline-block w-full">

    <input type="hidden" name="business_driver_id" id="input-{{ $id }}">

    <button id="btn-{{ $id }}" data-dropdown-toggle="{{ $id }}" type="button"
        class="inline-flex items-center justify-between bg-white border border-gray-300 
               text-gray-700 w-[400px] rounded-lg px-4 py-2.5 text-sm shadow-sm">

        <span class="dropdown-label">Select...</span>
        <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" fill="none" 
            viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="m19 9-7 7-7-7" />
        </svg>
    </button>

    <div id="{{ $id }}"
        class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-[400px] max-h-64 overflow-y-auto">

        <ul class="py-2 text-sm">

            @foreach ($drivers as $driver)
                @php
                    $realName = explode(' - ', $driver->driver_name)[0];
                @endphp

                <li>
                    <a href="#" class="block px-4 py-2 hover:bg-gray-100 dropdown-option"
                        data-value="{{ $realName }}" 
                        data-label="{{ $driver->driver_name }}">
                        {{ $driver->driver_name }}
                    </a>
                </li>
            @endforeach

        </ul>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", () => {
    const wrapper = document.getElementById("btn-{{ $id }}").closest("div.relative");
    const menu = document.getElementById("{{ $id }}");
    const label = wrapper.querySelector(".dropdown-label");
    const hidden = document.getElementById("input-{{ $id }}");

    wrapper.querySelectorAll(".dropdown-option").forEach(option => {
        option.addEventListener("click", e => {
            e.preventDefault();
            label.textContent = option.dataset.label;
            hidden.value = option.dataset.value; // <- CORRETTO
            menu.classList.add("hidden");
        });
    });
});
</script>
