<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Confluence</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Flex:wght@200..1000&display=swap" rel="stylesheet">

    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.3/css/dataTables.tailwindcss.css">

    <script src="https://cdn.datatables.net/2.1.3/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.1.3/js/dataTables.tailwindcss.js"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>



</head>

<body class="bg-gray-50">

    <aside class="fixed top-0 left-0 w-[310px] h-screen bg-white border-r flex flex-col ">

        <div class="flex-1 overflow-y-auto py-2 px-5">
            @php($role = Auth::user()->role ?? '')

            <a href="">
                <img class="w-auto h-100" src="/images/confluence-logo.png" alt="">
            </a>


            @if (\App\Support\CheckPermission::hasPermissions($role, 'homepage'))
                <x-sidebarmenu title="Homepage" url="/homepage" icon="home"  />
                <div class="border-t border-gray-200 my-2"></div>
            @endif

            @if (\App\Support\CheckPermission::hasPermissions($role, 'autocoupling'))
                <x-sidebarmenu title="Auto Coupling Overview" url="/autocoupling" icon="autocopling" />
                <div class="border-t border-gray-200 my-2 "></div>
            @endif

            @if (\App\Support\CheckPermission::hasPermissions($role, 'review'))
                <x-sidebarmenu title="Review" icon="review" :items="[
                    ['label' => 'Review', 'url' => '/review'],
                    ['label' => 'Detailed Review', 'url' => '/detailedreview'],
                    ['label' => 'Review Queue Overview', 'url' => '/queueoverview'],
                ]" />
                <div class="border-t border-gray-200 my-2"></div>
            @endif

            @if (\App\Support\CheckPermission::hasPermissions($role, 'logs'))
                <x-sidebarmenu title="Logs" icon="logs" :items="[
                    ['label' => 'Scheduler Logs', 'url' => '/schedulerlogs'],
                    ['label' => 'Production Logs', 'url' => '/productionlogs'],
                    //  ['label' => 'SIMs Logs', 'url' => '/simslogs'],
                ]" />
                <div class="border-t border-gray-200 my-2"></div>
            @endif


            @if (\App\Support\CheckPermission::hasPermissions($role, 'productionaction'))
                <x-sidebarmenu title="Production Action" url="/productionaction" icon="productionaction" />
                <div class="border-t border-gray-200 my-2"></div>
            @endif

            @if (\App\Support\CheckPermission::hasPermissions($role, 'monitoring'))
                <x-sidebarmenu title="Monitoring" icon="monitoring" :items="[
                    ['label' => 'Diagnostics', 'url' => '/diagnostics'],
                    ['label' => 'Real Time Monitoring', 'url' => '/realtimemonitoring'],
                ]" />
                <div class="border-t border-gray-200 my-2"></div>
            @endif


            @if (\App\Support\CheckPermission::hasPermissions($role, 'searches'))
                <x-sidebarmenu title="Searches" icon="searches" :items="[
                    ['label' => 'Contacts', 'url' => '/searches/contacts'],
                    ['label' => 'Phone Number Formatting', 'url' => '/searches/phonenumberformatting'],
                    ['label' => 'Blacklist', 'url' => '/searches/blacklist'],

                ]" />
                <div class="border-t border-gray-200 my-2"></div>
            @endif

            @if (\App\Support\CheckPermission::hasPermissions($role, 'documentation'))
                <x-sidebarmenu title="Documentation" icon="documentation" :items="[
                    ['label' => 'Field Overview', 'url' => '/fieldoverview'],
                    ['label' => 'Formatting Overview', 'url' => '/formattingoverview'],
                    ['label' => 'General Documentation', 'url' => '/generaldocumentation'],
                    ['label' => 'Process Documentation', 'url' => '/processdocumentation'],
                    ['label' => 'Contacts Policies', 'url' => '/contactspolicies'],
                ]" />
                <div class="border-t border-gray-200 my-2"></div>
            @endif

            @if (\App\Support\CheckPermission::hasPermissions($role, 'help'))
                <x-sidebarmenu title="Help & Support" url="/help" icon="help" />
                <div class="border-t border-gray-200 my-2"></div>
            @endif



            @if (Auth::user()->role === 'Admin')
                <x-sidebarmenu title="Performance" url="/performance" icon="performance" />
            @endif

        </div>

        <div class="px-4 py-3 border-t border-gray-200 flex items-center justify-between">

            <a href="/myprofile" class="flex items-center gap-3">
                <div
                    class="w-10 h-10 rounded-full bg-green-900 flex items-center justify-center text-white text-xl font-semibold">
                    {{ strtoupper(substr(Auth::user()->name, 0, 1)) }}{{ strtoupper(substr(Auth::user()->surname, 0, 1)) }}
                </div>

                <span class="text-gray-800 text-sm whitespace-nowrap">
                    {{ Auth::user()->name }} {{ Auth::user()->surname }}
                </span>
            </a>

            <x-hamburgermenu />
        </div>

    </aside>

    <main class="ml-[310px] p-8"> {{ $slot }}
    </main>

</body>

</html>
