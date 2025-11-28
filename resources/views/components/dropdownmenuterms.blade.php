@props([
    'id' => 'terms-' . uniqid(),
])

<div class="mt-4" id="custom-collapse-wrapper-{{ $id }}">

    <button type="button"
        class="inline-flex items-center justify-between bg-white border border-gray-300 
               text-gray-700 w-full rounded-lg px-4 py-2.5 text-sm shadow-sm collapse-toggle"
        data-target="collapse-box-{{ $id }}">
        <span class="collapse-label">Terms & Conditions</span>

        <svg class="w-4 h-4 transition-transform" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
            stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 9-7 7-7-7" />
        </svg>
    </button>

    <div id="collapse-box-{{ $id }}"
        class="overflow-hidden max-h-0 transition-all duration-[800ms] ease-in-out mt-2
           bg-gray-50 text-sm rounded-lg text-gray-700 p-0">
        <div class="inner p-3">
            Carriage quitting securing be appetite it declared. High eyes kept so busy feel call in. Would day nor ask
            walls
            known. But preserved advantage are but and certainty earnestly enjoyment. Passage weather as up am exposed.
            And
            natural related man subject. Eagerness get situation his was delighted.
        </div>
    </div>

    {{-- SCRIPT --}}
    <script>
        document.addEventListener("DOMContentLoaded", () => {

            const wrapper = document.getElementById("custom-collapse-wrapper-{{ $id }}");
            const button = wrapper.querySelector(".collapse-toggle");
            const label = wrapper.querySelector(".collapse-label");
            const icon = wrapper.querySelector("svg");
            const content = document.getElementById("collapse-box-{{ $id }}");

            button.addEventListener("click", () => {

                const isOpen = content.style.maxHeight && content.style.maxHeight !== "0px";

                if (isOpen) {
                    content.style.maxHeight = "0px";
                    icon.classList.remove("rotate-180");
                    label.textContent = "Terms & Conditions";
                } else {
                    content.style.maxHeight = content.scrollHeight + "px";
                    icon.classList.add("rotate-180");
                    label.textContent = "Hide Terms";
                }
            });

        });
    </script>
