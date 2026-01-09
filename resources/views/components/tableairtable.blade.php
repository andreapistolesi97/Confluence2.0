<div class="relative overflow-x-auto overflow-y-auto max-h-[50vh] border border-gray-200 rounded-lg">
    <table id="airtable-table" class="w-full text-sm text-gray-600">
        <div class="px-3 p-5 font-medium bg-gray-500 text-white">Airtable</div>
        <thead class="sticky top-0 z-10 bg-white text-sm font-semibold border-b border-gray-200">
            <tr class="align-top">
                <th class="px-4 py-3 text-left whitespace-nowrap">#</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">AM ID</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Phase</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Active<br>Offer<br>Check</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Airtable<br>Production<br>Checks</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Country<br>Check</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Production<br>Checks</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Production Checks Message</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Production<br>Mean Check</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Timezone<br>Production<br>Check</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Contacts<br>Ready to<br>Upload</th>
                <th class="px-4 py-3 text-left whitespace-nowrap">Country<br>Production<br>Status</th>
            </tr>
        </thead>


        <tbody id="airtable-body">
            <tr>
                <td colspan="12" class="px-4 py-3 text-center text-gray-400 bg-white border-b border-gray-200">
                    No data loaded yet
                </td>
            </tr>
        </tbody>
    </table>
</div>
<script>
    document.addEventListener("DOMContentLoaded", () => {

        const table = document.querySelector("#airtable-table");
        if (!table) return;

        const headers = table.querySelectorAll("thead tr:last-child th");
        const tbody = table.querySelector("tbody");

        const titleBar = table.previousElementSibling;
        const columnsRow = table.querySelector("thead tr:last-child");

        if (titleBar && columnsRow && tbody) {
            titleBar.classList.add("cursor-pointer", "select-none");
            titleBar.style.userSelect = "none";
            titleBar.style.cursor = "pointer";

            let collapsed = false;

            titleBar.addEventListener("click", (e) => {
                e.preventDefault();
                e.stopPropagation();

                collapsed = !collapsed;

                if (collapsed) {
                    columnsRow.style.display = "none";
                    tbody.style.display = "none";
                    
                } else {
                    columnsRow.style.display = "";
                    tbody.style.display = "";
                }
            });
        }


        let dragSrcIndex = null;
        let isDragging = false;

        // ======================
        //  SORT + DRAG & DROP
        // ======================

        headers.forEach((header) => {

            // Stato iniziale ordinamento
            header.dataset.order = "none";

            // Rendo tutte le colonne trascinabili
            header.setAttribute("draggable", "true");

            // ========= CLICK PER ORDINARE =========
            header.addEventListener("click", () => {
                // Se arrivo da un drag & drop, non ordinare
                if (isDragging) return;

                const allHeaders = Array.from(header.parentElement.children);
                const columnIndex = allHeaders.indexOf(header);

                const rows = Array.from(tbody.querySelectorAll("tr"));
                const order = header.dataset.order;

                let newOrder;
                let direction;

                if (order === "none") {
                    newOrder = "desc";
                    direction = -1;
                } else if (order === "desc") {
                    newOrder = "asc";
                    direction = 1;
                } else {
                    newOrder = "desc";
                    direction = -1;
                }

                // Reset icone e stato per tutte le colonne
                headers.forEach(h => {
                    h.dataset.order = "none";
                    const iconSpan = h.querySelector(".sort-icon");
                    if (iconSpan) {
                        iconSpan.innerHTML = `@php echo trim(view('components.sidebaricons', ['icon' => 'sort-up'])->render()); @endphp`;
                    }
                });

                header.dataset.order = newOrder;

                const icon = header.querySelector(".sort-icon");
                if (newOrder === "asc") {
                    icon.innerHTML = `@php echo trim(view('components.sidebaricons', ['icon' => 'sort-up'])->render()); @endphp`;
                } else {
                    icon.innerHTML = `@php echo trim(view('components.sidebaricons', ['icon' => 'sort-down'])->render()); @endphp`;
                }

                const sorted = rows.sort((a, b) => {
                    const cellA = a.children[columnIndex]?.innerText.trim() ?? "";
                    const cellB = b.children[columnIndex]?.innerText.trim() ?? "";

                    const numA = parseFloat(cellA.replace(",", ""));
                    const numB = parseFloat(cellB.replace(",", ""));

                    if (!isNaN(numA) && !isNaN(numB)) {
                        return (numA - numB) * direction;
                    }

                    return cellA.localeCompare(cellB) * direction;
                });

                sorted.forEach(row => tbody.appendChild(row));
            });

            // ========= DRAG & DROP PER SPOSTARE LE COLONNE =========

            header.addEventListener("dragstart", (e) => {
                isDragging = true;
                const allHeaders = Array.from(header.parentElement.children);
                dragSrcIndex = allHeaders.indexOf(header);
                e.dataTransfer.effectAllowed = "move";
                header.classList.add("opacity-50");
            });

            header.addEventListener("dragend", () => {
                header.classList.remove("opacity-50");
                // Evita che il click subito dopo il drop faccia partire l'ordinamento
                setTimeout(() => {
                    isDragging = false;
                }, 0);
            });

            header.addEventListener("dragover", (e) => {
                e.preventDefault(); // necessario per permettere il drop
                e.dataTransfer.dropEffect = "move";
            });

            header.addEventListener("drop", (e) => {
                e.preventDefault();
                const targetHeader = header;
                const allHeaders = Array.from(targetHeader.parentElement.children);
                const dropIndex = allHeaders.indexOf(targetHeader);

                if (dragSrcIndex === null || dragSrcIndex === dropIndex) return;

                moveColumn(table, dragSrcIndex, dropIndex);
                dragSrcIndex = null;
            });
        });

        function moveColumn(table, fromIndex, toIndex) {
            const rows = table.querySelectorAll("tr");

            rows.forEach((row) => {
                const cells = Array.from(row.children);

                if (fromIndex < 0 || fromIndex >= cells.length ||
                    toIndex < 0 || toIndex >= cells.length) return;

                const cellToMove = cells[fromIndex];

                if (fromIndex < toIndex) {
                    row.insertBefore(cellToMove, cells[toIndex].nextSibling);
                } else {
                    row.insertBefore(cellToMove, cells[toIndex]);
                }
            });
        }

        // ======================
        //  DROPDOWN "FILTER COLUMNS" FUORI DALLA TABELLA
        // ======================

        const wrapper = table.parentElement; // div overflow-x-auto...
        const outer = wrapper.parentElement; // card/container esterno

        if (!outer) return;

        outer.classList.add("relative");

        // Barra sopra la tabella, allineata a destra
        const topBar = document.createElement("div");
        topBar.className = "flex justify-end mb-2";

        const panelWrapper = document.createElement("div");
        panelWrapper.className = "relative";
        topBar.appendChild(panelWrapper);

        // Inserisco la barra PRIMA del wrapper della tabella
        outer.insertBefore(topBar, wrapper);

        // Bottone che apre/chiude il menu
        const filterBtn = document.createElement("button");
        filterBtn.type = "button";
        filterBtn.className =
            "inline-flex items-center gap-1 px-3 py-1.5 text-xs font-medium " +
            "bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50";

        filterBtn.innerHTML = `
            <span>Filter columns</span>
            <svg xmlns="http://www.w3.org/2000/svg" class="w-3 h-3" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd"
                      d="M5.23 7.21a.75.75 0 011.06.02L10 10.94l3.71-3.71a.75.75 0 011.08 1.04l-4.25 4.25a.75.75 0 01-1.08 0L5.21 8.27a.75.75 0 01.02-1.06z"
                      clip-rule="evenodd" />
            </svg>
        `;

        // Dropdown vero e proprio (menu a tendina)
        const dropdown = document.createElement("div");
        dropdown.className =
            "hidden absolute right-0 mt-1 w-96 bg-white border border-gray-200 " +
            "rounded-lg shadow-lg text-xs p-3 z-30";

        dropdown.style.maxHeight = "360px";
        dropdown.style.overflowY = "auto";

        const title = document.createElement("div");
        title.className = "mb-2 font-semibold text-gray-800";
        title.textContent = "Show / hide columns";
        dropdown.appendChild(title);

        // BOTTONI SELECT / DESELECT ALL
        const actions = document.createElement("div");
        actions.className = "flex items-center gap-2 mb-3";

        const btnAll = document.createElement("button");
        btnAll.type = "button";
        btnAll.className = "px-2 py-1 text-xs rounded border border-gray-300 hover:bg-gray-50";
        btnAll.textContent = "Select all";

        const btnNone = document.createElement("button");
        btnNone.type = "button";
        btnNone.className = "px-2 py-1 text-xs rounded border border-gray-300 hover:bg-gray-50";
        btnNone.textContent = "Deselect all";

        actions.appendChild(btnAll);
        actions.appendChild(btnNone);
        dropdown.appendChild(actions);

        const grid = document.createElement("div");
        // 3 colonne nel menu
        grid.className = "grid grid-cols-3 gap-2";
        dropdown.appendChild(grid);

        const headerArray = Array.from(headers);

        // ✅ funzioni riusabili (supporta drag&drop: ricalcola indice reale)
        function setColumnVisibleByHeader(headerEl, visible) {
            const currentHeaders = Array.from(table.querySelectorAll("thead th"));
            const idx = currentHeaders.indexOf(headerEl);
            if (idx === -1) return;

            headerEl.classList.toggle("hidden", !visible);

            const rows = table.querySelectorAll("tbody tr");
            rows.forEach((row) => {
                const cell = row.children[idx];
                if (!cell) return;
                cell.classList.toggle("hidden", !visible);
            });
        }

        const checkboxItems = []; // { header, checkbox }

        headerArray.forEach((header) => {
            const item = document.createElement("label");
            item.className =
                "flex items-center gap-1 px-2 py-1 rounded cursor-pointer hover:bg-gray-50";

            const checkbox = document.createElement("input");
            checkbox.type = "checkbox";
            checkbox.checked = !header.classList.contains("hidden");
            checkbox.className = "rounded border-gray-300";

            const textSpan = document.createElement("span");
            textSpan.className = "truncate";
            textSpan.title = header.innerText.trim();
            textSpan.textContent = header.innerText.trim() || "Column";

            item.appendChild(checkbox);
            item.appendChild(textSpan);
            grid.appendChild(item);

            checkboxItems.push({
                header,
                checkbox
            });

            checkbox.addEventListener("change", (e) => {
                setColumnVisibleByHeader(header, e.target.checked);
            });
        });

        // ✅ SELECT ALL / DESELECT ALL
        btnAll.addEventListener("click", () => {
            checkboxItems.forEach(({
                header,
                checkbox
            }) => {
                checkbox.checked = true;
                setColumnVisibleByHeader(header, true);
            });
        });

        btnNone.addEventListener("click", () => {
            checkboxItems.forEach(({
                header,
                checkbox
            }) => {
                checkbox.checked = false;
                setColumnVisibleByHeader(header, false);
            });
        });

        panelWrapper.appendChild(filterBtn);
        panelWrapper.appendChild(dropdown);

        // Toggle apertura/chiusura dropdown
        filterBtn.addEventListener("click", (e) => {
            e.stopPropagation();
            dropdown.classList.toggle("hidden");
        });

        // Chiudi cliccando fuori
        document.addEventListener("click", (e) => {
            if (!panelWrapper.contains(e.target)) {
                dropdown.classList.add("hidden");
            }
        });

    });
</script>
