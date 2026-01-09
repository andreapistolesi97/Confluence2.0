<x-layout>
    <div class="p-8 space-y-12 mt-15">

        <div class="bg-white rounded-xl p-6 border border-gray-200">
            <h1 class="font-bold text-2xl">Real Time Monitoring</h1>
            <p>Choose all these filters to see the results.</p>
        </div>

        <div class="bg-white rounded-xl p-6 border border-gray-200 mt-4">
            <div class="flex flex-col md:flex-row md:items-center md:space-x-8 mt-3">
                <p class="mt-6 flex items-center space-x-2">
                    <span class="text-sm text-gray-700 font-medium">Date Range</span>
                </p>
                <x-startenddate></x-startenddate>
            </div>

            <hr class="border-1 rounded-lg mt-8">

            <div class="mt-10 flex justify-between items-center">
                <div class="space-x-3">
                    <form method="POST" action="{{ route('realtimemonitoring.log') }}" class="inline">
                        @csrf
                        <button type="submit" id="btn-run-filters"
                            class="text-white text-sm rounded-xl bg-green-600 p-2.5 transition-colors duration-300 ease-in-out hover:bg-green-700 border border-color-gray-600">
                            Run filters
                        </button>
                    </form>

                    <button type="button" id="btn-refresh"
                        class="text-white text-sm rounded-xl bg-blue-600 p-2.5 transition-colors duration-300 ease-in-out hover:bg-blue-700 border border-color-gray-600">
                        Refresh
                    </button>
                </div>
            </div>
            <div class="flex justify-end gap-4">
                <button id="btn-export-airtable"
                    class="text-gray-600 text-sm rounded-xl bg-gray-100 p-2.5 transition-colors duration-300 ease-in-out hover:bg-gray-200 border border-color-gray-600">
                    Export Airtable CSV
                </button>
                <button id="btn-export-confluence"
                    class="text-gray-600 text-sm rounded-xl bg-gray-100 p-2.5 transition-colors duration-300 ease-in-out hover:bg-gray-200 border border-color-gray-600">
                    Export Confluence CSV
                </button>
            </div>

        </div>



        {{-- Progress bar --}}
        <div id="monitoring-progress" class="w-full bg-gray-200 rounded-full h-2 mt-4 hidden">
            <div id="monitoring-progress-inner" class="bg-green-600 h-2 rounded-full w-0 transition-all duration-300">
            </div>
        </div>

        <div class="mt-6 space-y-5">
            <x-tableairtable></x-tableairtable>
            <x-tableconfluence></x-tableconfluence>
        </div>

    </div>

    <script>
        console.log('SCRIPT monitoring eseguito');

        // ---------- Progress bar ----------
        const progressBar = document.getElementById('monitoring-progress');
        const progressBarInner = document.getElementById('monitoring-progress-inner');
        let progressInterval = null;

        function startProgress() {
            if (!progressBar || !progressBarInner) return;

            progressBar.classList.remove('hidden');
            progressBarInner.style.width = '0%';

            let value = 0;
            progressInterval = setInterval(() => {
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

            setTimeout(() => {
                progressBar.classList.add('hidden');
                progressBarInner.style.width = '0%';
            }, 500);
        }

        // Funzione per aggiornare la tabella Airtable
   function fillAirtableTable(rows) {
    const body = document.getElementById('airtable-body');
    if (!body) {
        console.error('Non trovo #airtable-body nel DOM');
        return;
    }

    // converte qualsiasi valore in stringa "stampabile"
    const cell = (v) => {
        if (v === null || v === undefined) return '';
        if (typeof v === 'object') {
            if (Array.isArray(v)) return v.join(', ');
            return JSON.stringify(v); // <-- evita [object Object]
        }
        return String(v);
    };

    body.innerHTML = '';

    if (!rows || rows.length === 0) {
        body.innerHTML = `
            <tr>
                <td colspan="12" class="px-4 py-3 text-center text-gray-400 bg-white hover:bg-gray-200">
                    No Airtable records found
                </td>
            </tr>
        `;
        return;
    }

    rows.forEach((row, index) => {
        const tr = document.createElement('tr');
        tr.className = 'border-t border-gray-200 hover:bg-gray-200';

        tr.innerHTML = `
            <td class="px-4 py-3 ">${index + 1}</td>
            <td class="px-4 py-3 ">${cell(row['AM ID'])}</td>
            <td class="px-4 py-3 ">${cell(row['Phase'])}</td>
            <td class="px-4 py-3 ">${cell(row['Active Offer Check'])}</td>
            <td class="px-4 py-3 ">${cell(row['Airtable Production Checks'])}</td>
            <td class="px-4 py-3 ">${cell(row['Country Check'])}</td>
            <td class="px-4 py-3 ">${cell(row['Production Checks'])}</td>
            <td class="px-4 py-3 ">${cell(row['Production Checks Message'])}</td>
            <td class="px-4 py-3 ">${cell(row['Production Mean Check'])}</td>
            <td class="px-4 py-3 ">${cell(row['Timezone Production Check'])}</td>
            <td class="px-4 py-3 ">${cell(row['Contacts Ready to Upload'])}</td>
            <td class="px-4 py-3 ">${cell(row['Country Production Status'])}</td>
        `;

        body.appendChild(tr);
    });
}

        // Funzione per aggiornare la tabella Confluence
        function fillConfluenceTable(rows) {
    const body = document.getElementById('confluence-body');
    if (!body) {
        console.error('Non trovo #confluence-body nel DOM');
        return;
    }

    const cell = (v) => {
        if (v === null || v === undefined) return '';
        if (typeof v === 'object') {
            if (Array.isArray(v)) return v.join(', ');
            try { return JSON.stringify(v); } catch { return String(v); }
        }
        return String(v);
    };

    body.innerHTML = '';

    if (!rows || rows.length === 0) {
        body.innerHTML = `
            <tr>
                <td colspan="20" class="px-4 py-3 text-center text-gray-400 bg-white hover:bg-gray-200">
                    No Confluence records found
                </td>
            </tr>
        `;
        return;
    }

    rows.forEach((row, index) => {
        const tr = document.createElement('tr');
        tr.className = 'border-t border-gray-100 hover:bg-gray-200';

        tr.innerHTML = `
            <td class="px-4 py-3">${index + 1}</td>
            <td class="px-4 py-3">${cell(row['AM ID'])}</td>
            <td class="px-4 py-3">${cell(row['Offer Number'])}</td>
            <td class="px-4 py-3">${cell(row['Offer Name'])}</td>
            <td class="px-4 py-3">${cell(row['Production Machine'])}</td>
            <td class="px-4 py-3">${cell(row['Phase'])}</td>
            <td class="px-4 py-3">${cell(row['Coupled'])}</td>
            <td class="px-4 py-3">${cell(row['Reviewed'])}</td>
            <td class="px-4 py-3">${cell(row['Active Offer Check'])}</td>
            <td class="px-4 py-3">${cell(row['Country Check'])}</td>
            <td class="px-4 py-3">${cell(row['Desktop Only Production Check'])}</td>
            <td class="px-4 py-3">${cell(row['Different Links Check'])}</td>
            <td class="px-4 py-3">${cell(row['Production Checks'])}</td>
            <td class="px-4 py-3">${cell(row['Production Checks Message'])}</td>
            <td class="px-4 py-3">${cell(row['Production Mean Check'])}</td>
            <td class="px-4 py-3">${cell(row['Timezone Production Check'])}</td>
            <td class="px-4 py-3">${cell(row['Confluence Production Checks'])}</td>
            <td class="px-4 py-3">${cell(row['Country Production Status'])}</td>
            <td class="px-4 py-3">${cell(row['Contacts Ready to Upload'])}</td>
            <td class="px-4 py-3">${cell(row['Offer Shoots'])}</td>
        `;

        body.appendChild(tr);
    });
}
        async function fetchTableData(startDate, endDate) {
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            fetch('{{ route('realtimemonitoring.refresh.log') }}', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                    'Accept': 'application/json'
                }
            });

            const response = await fetch('{{ route('realtimemonitoring.refresh') }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': csrfToken,
                    'Accept': 'application/json',
                },
                body: JSON.stringify({
                    start_date: startDate,
                    end_date: endDate
                }),
            });

            const data = await response.json();
            fillAirtableTable(data.airtable ?? []);
            fillConfluenceTable(data.confluence ?? []);
        }

        const btnRunFilters = document.getElementById('btn-run-filters');
        if (btnRunFilters) {
            btnRunFilters.addEventListener('click', async () => {
                console.log('Click su Run filters (via Laravel)');

                const startInput = document.getElementById('datepicker-range-start');
                const endInput = document.getElementById('datepicker-range-end');

                const start_date = startInput ? startInput.value : null;
                const end_date = endInput ? endInput.value : null;

                if (!start_date || !end_date) {
                    alert('Select start and end date');
                    return;
                }

                const payload = {
                    start_date: start_date,
                    end_date: end_date,
                };

                const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

                btnRunFilters.disabled = true;
                const originalText = btnRunFilters.textContent;
                btnRunFilters.textContent = 'Loading...';
                btnRunFilters.classList.remove('bg-green-600', 'hover:bg-green-700');
                btnRunFilters.classList.add('bg-gray-400', 'cursor-not-allowed');

                startProgress();

                try {
                    await fetch('{{ route('realtimemonitoring.log') }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': csrfToken,
                            'Accept': 'application/json',
                        },
                        body: JSON.stringify({
                            start_date: start_date,
                            end_date: end_date,
                        }),
                    });

                    const response = await fetch('{{ route('monitoring.realtimemonitoring') }}', {
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
                        const raw = await response.text();
                        console.log('Risposta non JSON da Laravel:', raw);
                        alert('Risposta non valida dal backend');
                        return;
                    }

                    console.log('Risposta monitoring.run (Laravel → CF):', data);

                    if (!response.ok) {
                        alert('Errore: ' + (data.message || data.error || 'errore sconosciuto'));
                        return;
                    }

                    const airtable = Array.isArray(data.airtable) ? data.airtable : [];
                    const confluence = Array.isArray(data.confluence) ? data.confluence : [];

                    console.log('Airtable length:', airtable.length);
                    console.log('Confluence length:', confluence.length);

                    fillAirtableTable(airtable);
                    fillConfluenceTable(confluence);

                } catch (error) {
                    console.error('Errore nella chiamata a monitoring.run:', error);
                    alert('Errore di connessione verso il backend');
                } finally {
                    stopProgress();
                    btnRunFilters.disabled = false;
                    btnRunFilters.textContent = originalText;
                    btnRunFilters.classList.remove('bg-gray-400', 'cursor-not-allowed');
                    btnRunFilters.classList.add('bg-green-600', 'hover:bg-green-700');
                }
            });
        }

        const btnRefresh = document.getElementById('btn-refresh');
        if (btnRefresh) {
            btnRefresh.addEventListener('click', async (e) => {
                e.preventDefault();
                console.log('Refresh button clicked');

                const startInput = document.getElementById('datepicker-range-start');
                const endInput = document.getElementById('datepicker-range-end');

                const start_date = startInput ? startInput.value : null;
                const end_date = endInput ? endInput.value : null;

                if (!start_date || !end_date) {
                    alert('Select start and end date before refreshing.');
                    return;
                }

                btnRefresh.disabled = true;
                const originalText = btnRefresh.textContent;
                btnRefresh.textContent = 'Refreshing...';
                btnRefresh.classList.add('opacity-60', 'cursor-not-allowed');

                startProgress();

                try {
                    await fetchTableData(start_date, end_date);
                } catch (err) {
                    console.error(err);
                    alert('Refresh failed');
                } finally {
                    stopProgress();
                    btnRefresh.disabled = false;
                    btnRefresh.textContent = originalText;
                    btnRefresh.classList.remove('opacity-60', 'cursor-not-allowed');
                }
            });
        }
    </script>
</x-layout>
