@props(['id', 'drivers', 'name' => 'business_driver_id', 'valueField' => 'id'])

<div class="relative inline-block w-full">

    <input type="hidden" name="{{ $name }}" id="input-{{ $id }}">

    <button id="btn-{{ $id }}" type="button"
        class="inline-flex items-center justify-between bg-white border border-gray-300 
               text-gray-700 w-[380px] rounded-lg px-4 py-2.5 text-sm shadow-sm">
        <span class="dropdown-label">Select...</span>

        <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 9-7 7-7-7" />
        </svg>
    </button>

    <div id="{{ $id }}"
        class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-[380px] max-h-64 overflow-y-auto">
        <ul class="py-2 text-sm">
            @foreach ($drivers as $driver)
                @php
                    $realName = explode(' - ', $driver->driver_name)[0];
                    $value = $valueField === 'name' ? $realName : $driver->id;
                @endphp

                <li>
                    <a href="#" data-value="{{ $value }}" data-label="{{ $driver->driver_name }}"
                       class="block px-4 py-2 hover:bg-gray-100 dropdown-option">
                        {{ $driver->driver_name }}
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

        button.addEventListener("click", () => menu.classList.toggle("hidden"));

        wrapper.querySelectorAll("[data-value]").forEach(option => {
            option.addEventListener("click", (e) => {
                e.preventDefault();
                label.textContent = option.dataset.label;
                hidden.value = option.dataset.value;
                menu.classList.add("hidden");
            });
        });

        document.addEventListener("click", (e) => {
            if (!wrapper.contains(e.target)) menu.classList.add("hidden");
        });
    });
</script>
