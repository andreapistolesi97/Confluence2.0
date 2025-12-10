<x-layout>

    <div class="p-8 space-y-12 mt-15">

        <div class="bg-white rounded-xl p-6 border border-gray-200 space-y-6">
            <h1 class ="font-bold text-2xl">Diagnostics</h1>
            <span class="block">Choose all these filters to see the results.</span>
        </div>

        <div class="bg-white rounded-xl p-6 border border-gray-200">
            <div class="flex flex-col md:flex-row md:items-center md:space-x-8 mt-3">
                <p class=" mt-6 flex items-center space-x-2">
                    <span>Date Range :</span>
                </p>

                <x-startenddate></x-startenddate>
            </div>

            <hr class="border-1 rounded-lg mt-8">

            <div class="mt-8 flex flex-col sm:flex-row sm:items-center sm:space-x-4 gap-3">
                <label for="offer">Insert an offer number : </label>
                <input id="offer" type="text" name="offer"
                    class="h-10 border border-black-600 rounded-md bg-white px-3 text-base text-gray-900 
               outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 
               focus:outline-indigo-600 sm:text-sm/6"
                    placeholder="es. 1234" />
            </div>

            <div class="mt-10 flex justify-between items-center">
                <button id="btn-run-filters" type="button"
                    class="text-white text-sm rounded-xl bg-green-600 p-2.5
transition-colors duration-300 ease-in-out hover:bg-green-700 border border-color-gray-600">
                    Run filters
                </button>

                <div class="flex justify-end gap-4">
                    <button
                        class="text-gray-600 text-sm rounded-xl bg-gray-100 p-2.5
transition-colors duration-300 ease-in-out hover:bg-gray-200 border border-color-gray-600">
                        Download Contacts CSV
                    </button>
                    <button
                        class="text-gray-600 text-sm rounded-xl bg-gray-100 p-2.5
transition-colors duration-300 ease-in-out hover:bg-gray-200 border border-color-gray-600">
                        Download Logs CSV
                    </button>
                </div>
            </div>

        </div>

        <div class="mt-6 space-y-5">
            <x-tablediagnostics></x-tablediagnostics>
            <x-tablelogs></x-tablelogs>
        </div>

    </div>
    <script>
        console.log('SCRIPT diagnostics eseguito');

        const btn = document.getElementById('btn-run-filters');
        console.log('Bottone trovato:', btn);

        if (!btn) {
            console.error('Non trovo #btn-run-filters nel DOM');
        } else {
            btn.addEventListener('click', async () => {
                console.log('Click su Run filters');

                const startInput = document.getElementById('datepicker-range-start');
                const endInput = document.getElementById('datepicker-range-end');

                const start_date = startInput ? startInput.value : null;
                const end_date = endInput ? endInput.value : null;

                const offer_num = document.getElementById('offer').value;

                // payload SEMPLICE verso Laravel (non verso CF)
                const payload = {
                    start_date: start_date,
                    end_date: end_date,
                    offer_number: offer_num || null,
                };

                console.log('Payload che mando a Laravel:', payload);

                const csrfToken = document
                    .querySelector('meta[name="csrf-token"]')
                    .getAttribute('content');

                try {
                    const response = await fetch('{{ route('diagnostics.run') }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': csrfToken,
                            'Accept': 'application/json',
                        },
                        body: JSON.stringify(payload),
                    });

                    console.log('Response object da Laravel:', response);

                    let data;
                    try {
                        data = await response.json();
                    } catch (e) {
                        data = await response.text();
                    }

                    console.log('Risposta diagnostics.run (Laravel → CF):', data);

                    // TODO: qui poi aggiorni le tabelle x-tablediagnostics / x-tablelogs

                } catch (error) {
                    console.error('Errore nella chiamata a diagnostics.run:', error);
                }
            });
        }
    </script>

</x-layout>
