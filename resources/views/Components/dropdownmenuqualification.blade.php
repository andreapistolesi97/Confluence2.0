@props(['id' => 'dropdown-qualification'])

<input type="hidden" name="qualification" id="input-{{ $id }}">

<div class="relative inline-block">

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
     class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-[400px] border">

    <ul class="py-2 text-sm">

        <li><a href="#" data-value="all" data-label="All"
               class="block px-4 py-2 hover:bg-gray-100">All</a></li>

        <li><a href="#" data-value="mix" data-label="QS2/QS3/QS4 (MIX)"
               class="block px-4 py-2 hover:bg-gray-100">QS2/QS3/QS4 (MIX)</a></li>

        <li><a href="#" data-value="qs1" data-label="QS (ALL QS1 Settings)"
               class="block px-4 py-2 hover:bg-gray-100">QS (ALL QS1 Settings)</a></li>

        <li><a href="#" data-value="none" data-label="No Qualification Settings"
               class="block px-4 py-2 hover:bg-gray-100">No Qualification Settings</a></li>

    </ul>
</div>

</div>

<script>
document.addEventListener("DOMContentLoaded", () => {

    const wrapper = document.getElementById("btn-{{ $id }}").closest("div.relative");
    const label = wrapper.querySelector(".dropdown-label");
    const menu = document.getElementById("{{ $id }}");
    const hidden = document.getElementById("input-{{ $id }}");

    wrapper.querySelectorAll("[data-value]").forEach(option => {
        option.addEventListener("click", e => {
            e.preventDefault();

            label.textContent = option.dataset.label;
            hidden.value = option.dataset.value;

            menu.classList.add("hidden");
        });
    });

});
</script>
