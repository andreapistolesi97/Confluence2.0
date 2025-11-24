<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confluence Dashboard</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Flex:wght@200..1000&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: "Roboto Flex", sans-serif !important;
        }
    </style>

    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/alpinejs" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/preline/dist/preline.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts@3.46.0/dist/apexcharts.min.js"></script>
</head>

<body class="flex">

    {{-- SIDEBAR --}}
    <aside
        class="flex flex-col w-[310px] h-screen py-2 overflow-y-auto bg-white border-r dark:bg-gray-900 dark:border-gray-700">
        <nav class="flex flex-col flex-1 space-y-2 mx-5">

            <a href="">
                <img class="w-auto h-100" src="/images/confluence-logo.png" alt="">
            </a>

            <x-sidebarmenu title="Homepage" url="/homepage" icon="home" />
            <div class="border-t border-gray-200 my-2"></div>



            <x-sidebarmenu title="Auto Copling Overview" url="/autocoupling" icon="autocopling" />
            <div class="border-t border-gray-200 my-2"></div>
            <x-sidebarmenu title="Review" icon="review" :items="[
                ['label' => 'Review', 'url' => '/review'],
                ['label' => 'Detailed Review', 'url' => '/detailedreview'],
                ['label' => 'Review Queue Overview', 'url' => '/queueoverview'],
            ]" />
            <div class="border-t border-gray-200 my-2"></div>
            <x-sidebarmenu title="Logs" icon="logs" :items="[
                ['label' => 'Scheduler Logs', 'url' => '/schedulerlogs'],
                ['label' => 'Production Logs', 'url' => '/productionlogs'],
                ['label' => 'SIMs Logs', 'url' => '/simslogs'],
            ]" />
            <div class="border-t border-gray-200 my-2"></div>
            <x-sidebarmenu title="Production Action" url="/productionaction" icon="productionaction" />
            <div class="border-t border-gray-200 my-2"></div>
            <x-sidebarmenu title="Monitoring" icon="monitoring" :items="[
                ['label' => 'Diagnostics', 'url' => '/diagnostics'],
                ['label' => 'Real Time Monitoring', 'url' => '/realtimemonitoring'],
            ]" />
            <div class="border-t border-gray-200 my-2"></div>
            <x-sidebarmenu title="Searches" icon="searches" :items="[
                ['label' => 'Contacs', 'url' => '/contacts'],
                ['label' => 'Phone Number Formatting', 'url' => '/phonenumberformatting'],
            ]" />
            <div class="border-t border-gray-200 my-2"></div>
            <x-sidebarmenu title="Documentation" icon="documentation" :items="[
                ['label' => 'Field Overview', 'url' => '/fieldoverview'],
                ['label' => 'Formatting Overview', 'url' => '/formattingoverview'],
                ['label' => 'General Documentation', 'url' => '/generaldocumentation'],
                ['label' => 'Process Documentation', 'url' => '/processdocumentation'],
                ['label' => 'Contacts Policies', 'url' => '/contactspolicies'],
            ]" />
            <div class="border-t border-gray-200 my-2"></div>
            <x-sidebarmenu title="Help & Support" url="/help" icon="help" />

        </nav>

        <div
            class="rounded-3xl border border-color-gray-200 w-full px-2 py-2 w-[250px] mx-5
           flex items-center justify-between gap-4 bg-white my-4">

            <!-- Avatar + Nome -->
            <a href="/myprofile" class="flex items-center gap-3">

                <!-- logo persona -->
                <div
                    class="w-10 h-10 rounded-full bg-green-900 flex items-center justify-center text-white text-xl font-semibold">
                    {{ strtoupper(substr(Auth::user()->name, 0, 1)) }}{{ strtoupper(substr(Auth::user()->surname, 0, 1)) }}
                </div>

                <!-- Nome -->
                <span class="text-gray-700 text-sm whitespace-nowrap">
                    {{ Auth::user()->name }} {{ Auth::user()->surname }}
                </span>
            </a>

            <!-- MENU A TRE PUNTINI (fuori dal link, ora funziona) -->
            <x-hamburgermenu />            

        </div>



    </aside>

    {{-- CONTENUTO DELLA PAGINA --}}
    <main class="flex-1 p-8 bg-gray-50">
        {{ $slot }}
    </main>

    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>

</body>

</html>
