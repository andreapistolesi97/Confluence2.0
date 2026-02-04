@props([
    'title',
    'url' => null,
    'items' => [],
    'icon' => null,
    'id' => Str::random(8)
])

@if (empty($items))

<a href="{{ $url }}"
   class="flex items-center gap-3 p-2 text-gray-700 hover:bg-gray-100 rounded-lg">

    @include('components.sidebaricons', ['icon' => $icon])
    <span>{{ $title }}</span>

</a>

@else

<div class="w-full">

    <button 
        type="button"
        data-toggle="{{ $id }}"
        class="flex items-center justify-between w-full p-2 text-gray-700 rounded-lg transition
               hover:bg-gray-100" >

        <div class="flex items-center gap-3">
            @include('components.sidebaricons', ['icon' => $icon])
            <span>{{ $title }}</span>
        </div>

        <svg class="w-4 h-4 transition-transform rotate-0" id="arrow-{{ $id }}"
            fill="none" stroke="currentColor" stroke-width="2"
            viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="m5 15 7-7 7 7"/>
        </svg>

    </button>

    <div id="body-{{ $id }}" class="hidden pl-10 pt-3 flex flex-col space-y-3">

        @foreach ($items as $item)
            <a href="{{ $item['url'] }}" 
               class="text-gray-600 hover:text-green-600">
                {{ $item['label'] }}
            </a>
        @endforeach

    </div>

</div>

@endif

<script>
document.addEventListener("DOMContentLoaded", () => {

    const btn = document.querySelector(`[data-toggle="{{ $id }}"]`);
    const body = document.getElementById("body-{{ $id }}");
    const arrow = document.getElementById("arrow-{{ $id }}");

    btn.addEventListener("click", () => {

        const isOpen = !body.classList.contains("hidden");

        if (isOpen) {
            body.classList.add("hidden");
            arrow.classList.remove("rotate-180");
        } else {
            body.classList.remove("hidden");
            arrow.classList.add("rotate-180");
        }
    });

});
</script>
