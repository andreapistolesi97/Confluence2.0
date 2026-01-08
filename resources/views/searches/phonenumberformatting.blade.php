<x-layout>
    <div class="p-8 space-y-12 mt-15">

        <form method="POST" action="{{ route('searches.phonenumberformatting.run') }}" class="space-y-6"
            id="phoneFormattingForm">
            @csrf

            <div class="bg-white border border-color-gray-200 rounded-lg p-6 space-y-2">
                
                <h1 class="font-bold text-2xl">Phone Number Formatting</h1>
                <span class="block text-gray-400">Select from the dropdown menu the country you want to analyze</span>
            </div>

            <div class="bg-white border border-color-gray-200 rounded-lg p-6">
                <x-dropdownmenucountry id="dropdown-country" name="Country" :countries="$countries" :selected="$selectedCountry ?? null" />

                <div class="mt-6">
                    <button type="submit"
                        class="text-white text-sm font-medium rounded-xl bg-green-600 p-2.5
                       transition-colors duration-300 ease-in-out hover:bg-green-700 border border-color-gray-600"
                        id="btnPhoneFormattingSearch">
                        Search
                    </button>
                </div>
            </div>
        </form>


        </form>



        @isset($prefixes)
            <div class="bg-white border border-color-gray-200 rounded-lg p-6">
                <h2 class="font-semibold text-lg mb-4">Phone Number Prefixes for Country selected</h2>

                @if (count($prefixes) === 0)
                    <div class="text-gray-400 text-sm">No numbers found for this country.</div>
                @else
                    <ul class="space-y-2 text-sm">
                        @foreach ($prefixes as $prefix)
                            <li class="max-w-sm">{{ $prefix }}</li>
                        @endforeach
                    </ul>
                @endif
            </div>
        @endisset

    </div>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const btn = document.getElementById('btnPhoneFormattingSearch');
            const form = document.getElementById('phoneFormattingForm');

            btn.addEventListener('click', () => {
                const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

                // invio log senza bloccare il submit
                fetch("{{ route('searches.phonenumberformatting.search') }}", {
                    method: "POST",
                    headers: {
                        "X-CSRF-TOKEN": token,
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        Country: document.querySelector('input[name="Country"]')?.value ??
                            null
                    })
                }).catch(() => {});
            });
        });
    </script>
</x-layout>
