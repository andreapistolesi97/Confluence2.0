@props([
    'id' => 'dropdown-role',
])

<div id="wrapper-{{ $id }}" class="relative inline-block">

    {{-- INPUT HIDDEN CHE VIENE VALIDATO --}}
    <input type="hidden" name="role" id="input-{{ $id }}" required>

    {{-- BUTTON --}}
    <button
        id="btn-{{ $id }}"
        type="button"
        class="inline-flex items-center justify-between bg-white border border-gray-300 
               text-gray-500 w-[400px] rounded-lg px-4 py-2.5 text-sm shadow-sm"
    >
        <span class="dropdown-label">Select role...</span>

        <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" fill="none"
             viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="m19 9-7 7-7-7" />
        </svg>
    </button>

    {{-- MENU --}}
    <div
        id="{{ $id }}"
        class="dropdown-menu z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-[400px] border mt-1"
    >
        <ul class="py-2 text-sm text-gray-700">

            <li>
                <a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Admin">
                    Admin
                </a>
            </li>

            <li>
                <a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Integrator">
                    Integrator
                </a>
            </li>

            <li>
                <a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Production Planner">
                    Production Planner
                </a>
            </li>

            <li>
                <a href="#" class="block px-4 py-2 hover:bg-gray-100" data-value="Sales">
                    Sales
                </a>
            </li>

        </ul>
    </div>

</div>

<script>
document.addEventListener("DOMContentLoaded", () => {
    const wrapper      = document.getElementById("wrapper-{{ $id }}");
    const button       = wrapper.querySelector("#btn-{{ $id }}");
    const menu         = wrapper.querySelector(".dropdown-menu");
    const label        = wrapper.querySelector(".dropdown-label");
    const inputHidden  = document.getElementById("input-{{ $id }}");
    const form         = wrapper.closest("form"); 

    if (!button || !menu || !inputHidden || !form) return;

    button.addEventListener("click", () => {
        menu.classList.toggle("hidden");
    });

    // Selezione voce
    wrapper.querySelectorAll("[data-value]").forEach(option => {
        option.addEventListener("click", (e) => {
            e.preventDefault();

            const value = option.dataset.value;

            label.textContent = value;
            label.classList.remove("text-gray-500");

            inputHidden.value = value;

            button.classList.remove("border-red-500");

            menu.classList.add("hidden");
        });
    });

    // Validazione nativa: "Compila questo campo"
    form.addEventListener("submit", (e) => {
        if (!inputHidden.value) {
            // bordo rosso sul bottone
            button.classList.add("border-red-500");

            inputHidden.reportValidity();

            e.preventDefault();
            e.stopPropagation();
        }
    });
});
</script>
