<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confluence</title>

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

<body class="overflow-x-hidden bg-gray-50">

    <!-- SIDEBAR FISSA -->
    <aside class="fixed top-0 left-0 w-[310px] h-screen bg-white border-r flex flex-col">

        <!-- BLOCCO (logo + menu) -->
        <div class="flex-1 overflow-y-auto py-2">

            <nav class="flex flex-col space-y-2 mx-5">

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

        </div>

        <div
            class="border-t border-gray-200 px-4 py-3 flex items-center justify-between bg-white mx-4 mb-4 rounded-3xl shadow-sm">

            <a href="/myprofile" class="flex items-center gap-3">
                <div
                    class="w-10 h-10 rounded-full bg-green-900 flex items-center justify-center text-white text-xl font-semibold">
                    {{ strtoupper(substr(Auth::user()->name, 0, 1)) }}{{ strtoupper(substr(Auth::user()->surname, 0, 1)) }}
                </div>
                <span class="text-gray-700 text-sm whitespace-nowrap">
                    {{ Auth::user()->name }} {{ Auth::user()->surname }}
                </span>
            </a>

            <x-hamburgermenu />

        </div>

    </aside>

    <!-- CONTENUTO -->
    <main class="ml-[310px] p-8">
        {{ $slot }}
    </main>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</body>

</html>
