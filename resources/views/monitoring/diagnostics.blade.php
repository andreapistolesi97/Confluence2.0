<x-layout>

    <div class="p-8 space-y-12 mt-15">

        <div class="bg-white rounded-xl p-6 border border-gray-200 space-y-6">
            <h1 class="font-bold text-2xl">Diagnostics</h1>
            <span class="block">Choose all these filters to see the results.</span>
        </div>

        <div class="bg-white rounded-xl p-6 border border-gray-200">
            <div class="flex flex-col md:flex-row md:items-center md:space-x-8 mt-3">
                <p class="mt-6 flex items-center space-x-2">
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

            <div id="diagnostics-progress" class="w-full bg-gray-200 rounded-full h-2 mt-4 hidden">
                <div id="diagnostics-progress-inner"
                    class="bg-green-600 h-2 rounded-full w-0 transition-all duration-300"></div>
            </div>

        </div>

        <div class="mt-6 space-y-5">
            <x-tablediagnostics></x-tablediagnostics>
            <x-tablelogs></x-tablelogs>
        </div>

    </div>

    <script>
        console.log('SCRIPT diagnostics eseguito');

        // Progress bar ----------------------------------------------------------

        const progressBar = document.getElementById('diagnostics-progress');
        const progressBarInner = document.getElementById('diagnostics-progress-inner');
        let progressInterval = null;

        function startProgress() {
            if (!progressBar || !progressBarInner) return;

            progressBar.classList.remove('hidden');
            progressBarInner.style.width = '0%';

            let value = 0;
            progressInterval = setInterval(() => {
                // barra finta indeterminata: si ferma al 90%, poi il 100% lo mette stopProgress()
                value = Math.min(value + 5, 90);
                progressBarInner.style.width = value + '%';
            }, 300);
        }

        function stopProgress() {
            if (!progressBar || !progressBarInner) return;

            if (progressInterval) {
                clearInterval(progressInterval);
                progressInterval = null;
            }

            progressBarInner.style.width = '100%';

            // dopo mezzo secondo nascondo la barra
            setTimeout(() => {
                progressBar.classList.add('hidden');
                progressBarInner.style.width = '0%';
            }, 500);
        }

        // Tabella CONTACTS ------------------------------------------------------

        function fillContactsTable(contacts) {
            const body = document.getElementById('contacts-body');

            if (!body) {
                console.error('Non trovo #contacts-body nel DOM');
                return;
            }

            body.innerHTML = '';

            if (!contacts || contacts.length === 0) {
                body.innerHTML = `
                <tr>
                    <td colspan="5" class="px-4 py-3 text-center text-gray-400">
                        No contacts found
                    </td>
                </tr>
            `;
                return;
            }

            contacts.forEach((row, index) => {
                const tr = document.createElement('tr');
                tr.className = 'border-t border-gray-100 hover:bg-gray-50';

                tr.innerHTML = `
                <td class="px-4 py-3">${index + 1}</td>
                <td class="px-4 py-3">${row['ID_Contact'] ?? ''}</td>
                <td class="px-4 py-3">${row['email'] ?? ''}</td>
                <td class="px-4 py-3">${row['Timestamp_Uploading'] ?? ''}</td>
                <td class="px-4 py-3">${row['Timestamp_Upload'] ?? ''}</td>
            `;

                body.appendChild(tr);
            });
        }

        // (Facoltativo) Tabella LOGS: per ora solo "No data" se vuota ----------------
        function fillLogsTable(logs) {
            const body = document.getElementById('logs-body');
            if (!body) return;

            body.innerHTML = '';

            if (!logs || logs.length === 0) {
                body.innerHTML = `
                <tr>
                    <td class="px-4 py-3 text-center text-gray-400">
                        No logs found
                    </td>
                </tr>
            `;
                return;
            }

            // Se poi ti serve, qui puoi mappare i campi dei log come per i contacts
        }

        // Bottone RUN FILTERS ---------------------------------------------------

        const btn = document.getElementById('btn-run-filters');
        console.log('Bottone trovato:', btn);

        if (!btn) {
            console.error('Non trovo #btn-run-filters nel DOM');
        } else {
            btn.addEventListener('click', async () => {
                console.log('Click su Run filters - TEST DIRETTO');

                const startInput = document.getElementById('datepicker-range-start');
                const endInput = document.getElementById('datepicker-range-end');
                const offerInput = document.getElementById('offer');

                const start_date = startInput ? startInput.value : null;
                const end_date = endInput ? endInput.value : null;
                const offer_num = offerInput ? offerInput.value : null;

                const payload = {
                    type: "diagnostics",
                    filters: {
                        start_date: start_date,
                        end_date: end_date,
                        offer_number: offer_num || null,
                    }
                };

                console.log('Payload DIRETTO a CF:', payload);

                // Disabilito bottone + avvio progress bar
                btn.disabled = true;
                const originalText = btn.textContent;
                btn.textContent = 'Running...';
                btn.classList.remove('bg-green-600', 'hover:bg-green-700');
                btn.classList.add('bg-gray-400', 'cursor-not-allowed');

                startProgress();

                try {
                    const response = await fetch(
                        'https://us-central1-tidy-tine-302317.cloudfunctions.net/diagnostic_monitoring_production', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify(payload),
                        }
                    );

                    console.log('Response status:', response.status);

                    let data;
                    try {
                        data = await response.json();
                    } catch (e) {
                        data = await response.text();
                        console.log('Risposta non JSON:', data);
                        return;
                    }

                    console.log('Risposta DIRETTA da CF:', data);

                    const contacts = Array.isArray(data.contacts) ? data.contacts : [];
                    const logs = Array.isArray(data.logs) ? data.logs : [];

                    console.log('Contacts length:', contacts.length);
                    console.log('Logs length:', logs.length);

                    fillContactsTable(contacts);
                    fillLogsTable(logs);

                } catch (error) {
                    console.error('Errore chiamata DIRETTA:', error);
                    alert('Errore di connessione alla Cloud Function');
                } finally {
                    // Ripristino bottone + stop progress bar
                    stopProgress();
                    btn.disabled = false;
                    btn.textContent = originalText;
                    btn.classList.remove('bg-gray-400', 'cursor-not-allowed');
                    btn.classList.add('bg-green-600', 'hover:bg-green-700');
                }
            });
        }
    </script>

</x-layout>
