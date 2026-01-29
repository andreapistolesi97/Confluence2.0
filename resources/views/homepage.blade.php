<x-layout>

    <div class="bg-white rounded-xl p-6 border border-gray-200 space-y-2">
        <h1 class="font-bold text-2xl">
            Overview, {{ Auth::user()->name }} {{ Auth::user()->surname }}.
        </h1>
        <span class="block text-gray-600">Your workspace at a glance</span>
    </div>

    <div class="flex flex-col lg:flex-row gap-6 mt-2">

        <div class="flex-1 flex flex-col gap-6">

        <a href="/myprofile" class="block">
                <div class="bg-white hover:bg-gray-100 rounded-xl p-8 border border-gray-200 w-full">
                    <div class="flex items-center gap-2 mb-6">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-700" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                d="M5.121 17.804A13.937 13.937 0 0112 15c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zM12 3a9 9 0 110 18 9 9 0 010-18z" />
                        </svg>
                        <h2 class="text-xl font-semibold text-gray-700">User Profile</h2>
                    </div>

                    <div class="flex items-center gap-6 mb-6">
                        <div
                            class="w-16 h-16 rounded-full bg-gray-700 flex items-center justify-center text-white text-xl font-semibold">
                            {{ strtoupper(substr(Auth::user()->name, 0, 1)) }}{{ strtoupper(substr(Auth::user()->surname, 0, 1)) }}
                        </div>

                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">
                                {{ Auth::user()->name }} {{ Auth::user()->surname }}
                            </h3>
                            <span
                                class="inline-flex items-center mt-1 px-3 py-1 rounded-full bg-gray-100 text-gray-700 text-xs font-medium">
                                {{ Auth::user()->role }}
                            </span>
                        </div>
                    </div>

                    <div class="space-y-4 text-blue-900 text-sm">
                        <div class="flex items-start gap-3 border border-gray-300 rounded-lg p-3">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-gray-700" viewBox="0 0 20 20"
                                fill="currentColor">
                                <path
                                    d="M2.94 6.94a1.5 1.5 0 01.44-.33L10 2l6.62 4.61c.143.1.27.22.38.35L10 11 2.94 6.94z" />
                                <path d="M18 8v6a2 2 0 01-2 2H4a2 2 0 01-2-2V8l8 5 8-5z" />
                            </svg>
                            <span class="text-gray-700 text-sm">{{ Auth::user()->email }}</span>
                        </div>
                    </div>
                </div>
            </a>

            <!-- QUICK ACTIONS -->
            <div class="bg-white rounded-xl p-8 border border-gray-200 w-full">

                <div class="flex items-center gap-2 mb-6">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-700" viewBox="0 0 16 16">
                        <path fill="currentColor" fill-rule="evenodd"
                            d="M3 2.5h10a.5.5 0 0 1 .5.5v10a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V3a.5.5 0 0 1 .5-.5ZM1 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3Zm8.717 1.97a.75.75 0 1 0-1.434-.44l-2 6.5a.75.75 0 0 0 1.434.44l2-6.5Z"
                            clip-rule="evenodd" />
                    </svg>
                    <h2 class="text-xl font-semibold text-gray-700">Quick Actions</h2>
                </div>

                <div class="flex flex-col gap-4">

                    @if (Auth::user()->role === 'Admin' || Auth::user()->role === 'Production Planner')
                        <a href="/schedulerlogs"
                            class="p-1.5 mx-2 text-sm flex items-center gap-4 hover:bg-gray-100 hover:border-color-gray-600 rounded-lg">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-gray-700" viewBox="0 0 16 16">
                                <path fill="currentColor" fill-rule="evenodd"
                                    d="M3.5 2.5v11h9v-11h-9ZM3 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3Zm5 10a.75.75 0 0 1 .75-.75h1.75a.75.75 0 0 1 0 1.5H8.75A.75.75 0 0 1 8 11Zm-2 1a1 1 0 1 0 0-2a1 1 0 0 0 0 2Zm2-4a.75.75 0 0 1 .75-.75h1.75a.75.75 0 0 1 0 1.5H8.75A.75.75 0 0 1 8 8ZM6 9a1 1 0 1 0 0-2a1 1 0 0 0 0 2Zm2-4a.75.75 0 0 1 .75-.75h1.75a.75.75 0 0 1 0 1.5H8.75A.75.75 0 0 1 8 5ZM6 6a1 1 0 1 0 0-2a1 1 0 0 0 0 2Z"
                                    clip-rule="evenodd" />
                            </svg>
                            Scheduler Logs
                        </a>
                        <hr class="border-gray-300">
                    @endif

                    @if (Auth::user()->role === 'Admin' || Auth::user()->role === 'Production Planner')
                        <a href="/productionlogs"
                            class="p-1.5 mx-2 text-sm flex items-center gap-4 hover:bg-gray-100 hover:border-color-gray-600 rounded-lg">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-gray-700" viewBox="0 0 48 48">
                                <g fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="4">
                                    <path d="M13 10h28v34H13z" />
                                    <path stroke-linecap="round" d="M35 10V4H8a1 1 0 0 0-1 1v33h6m8-16h12m-12 8h12" />
                                </g>
                            </svg>
                            Production Logs
                        </a>
                        <hr class="border-gray-300">
                    @endif

                    <a href="/searches/contacts"
                        class="p-1.5 mx-2 text-sm flex items-center gap-4 hover:bg-gray-100 hover:border-color-gray-600 rounded-lg text-gray-700">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-700" viewBox="0 0 512 512">
                            <path fill="currentColor" fill-rule="evenodd"
                                d="M321.923 42.667H87.256v234.667h42.667v-192h174.293l81.707 81.706v110.294h42.666v-128zM85.573 448V320.028h28.81v105.394h55V448zm153.17-130.23q30.165 0 46.24 19.146q15.444 18.334 15.443 47.143q0 31.519-18.243 50.124q-15.714 16.075-43.44 16.075q-30.165 0-46.24-19.146q-15.443-18.334-15.443-47.866q0-30.887 18.243-49.491q15.804-15.985 43.44-15.985m-.09 22.578q-15.624 0-24.114 13.005q-7.676 11.74-7.676 30.164q0 21.315 9.121 33.055q8.58 11.108 22.759 11.108q15.534 0 24.204-13.095q7.676-11.56 7.676-30.526q0-20.862-9.121-32.603q-8.58-11.108-22.85-11.108m190.83 36.035v65.295q-11.018 3.704-15.534 4.877q-13.998 3.703-30.074 3.703q-31.61 0-48.136-15.895q-18.334-17.52-18.334-48.859q0-36.035 22.759-54.368q16.527-13.365 44.614-13.366q24.024 0 44.705 8.76l-9.844 22.488q-9.754-4.876-17.07-6.819q-7.315-1.941-16.075-1.941q-20.952 0-30.887 13.637q-8.399 11.559-8.399 30.435q0 22.669 12.644 34.138q10.115 9.212 25.107 9.212q8.76 0 16.617-2.98v-25.74H379.54v-22.577z" />
                        </svg>
                        Contacts
                    </a>

                    <hr class="border-gray-300">

                    <a href="/searches/phonenumberformatting"
                        class="p-1.5 mx-2 text-sm flex items-center gap-4 hover:bg-gray-100 hover:border-color-gray-600 rounded-lg">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-700" viewBox="0 0 512 512">
                            <path fill="currentColor" fill-rule="evenodd"
                                d="M321.923 42.667H87.256v234.667h42.667v-192h174.293l81.707 81.706v110.294h42.666v-128zM85.573 448V320.028h28.81v105.394h55V448zm153.17-130.23q30.165 0 46.24 19.146q15.444 18.334 15.443 47.143q0 31.519-18.243 50.124q-15.714 16.075-43.44 16.075q-30.165 0-46.24-19.146q-15.443-18.334-15.443-47.866q0-30.887 18.243-49.491q15.804-15.985 43.44-15.985m-.09 22.578q-15.624 0-24.114 13.005q-7.676 11.74-7.676 30.164q0 21.315 9.121 33.055q8.58 11.108 22.759 11.108q15.534 0 24.204-13.095q7.676-11.56 7.676-30.526q0-20.862-9.121-32.603q-8.58-11.108-22.85-11.108m190.83 36.035v65.295q-11.018 3.704-15.534 4.877q-13.998 3.703-30.074 3.703q-31.61 0-48.136-15.895q-18.334-17.52-18.334-48.859q0-36.035 22.759-54.368q16.527-13.365 44.614-13.366q24.024 0 44.705 8.76l-9.844 22.488q-9.754-4.876-17.07-6.819q-7.315-1.941-16.075-1.941q-20.952 0-30.887 13.637q-8.399 11.559-8.399 30.435q0 22.669 12.644 34.138q10.115 9.212 25.107 9.212q8.76 0 16.617-2.98v-25.74H379.54v-22.577z" />
                        </svg>
                        Phone Number Formatting
                    </a>

                    <hr class="border-gray-300">

                    @if (Auth::user()->role === 'Admin' ||
                            Auth::user()->role === 'Integrator' ||
                            Auth::user()->role === 'Production Planner')
                        <a href="/review"
                            class="p-1.5 mx-2 text-sm flex items-center gap-4 hover:bg-gray-100 hover:border-color-gray-600 rounded-lg">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-700" viewBox="0 0 32 32">
                                <path fill="currentColor"
                                    d="m16 8l1.912 3.703l4.088.594L19 15l1 4l-4-2.25L12 19l1-4l-3-2.703l4.2-.594L16 8z" />
                                <path fill="currentColor"
                                    d="M17.736 30L16 29l4-7h6a1.997 1.997 0 0 0 2-2V8a1.997 1.997 0 0 0-2-2H6a1.997 1.997 0 0 0-2 2v12a1.997 1.997 0 0 0 2 2h9v2H6a4 4 0 0 1-4-4V8a3.999 3.999 0 0 1 4-4h20a3.999 3.999 0 0 1 4 4v12a4 4 0 0 1-4 4h-4.835Z" />
                            </svg>
                            Review
                        </a>
                        <hr class="border-gray-300">
                    @endif

                    @if (Auth::user()->role === 'Admin' ||
                            Auth::user()->role === 'Integrator' ||
                            Auth::user()->role === 'Production Planner')
                        <a href="/review"
                            class="p-1.5 mx-2 text-sm flex items-center gap-4 hover:bg-gray-100 hover:border-color-gray-600 rounded-lg">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-700" viewBox="0 0 16 16">
                                <g fill="currentColor">
                                    <path
                                        d="M14.5 2h-13l-.5.5v9l.5.5H4v2.5l.854.354L7.707 12H14.5l.5-.5v-9zm-.5 9H7.5l-.354.146L5 13.293V11.5l-.5-.5H2V3h12z" />
                                    <path
                                        d="M7.079 5.205L5.262 7.033l1.816 1.82l-.707.707L4.2 7.386v-.707L6.37 4.5zm2.621-.7l-.7.709l1.826 1.819l-1.831 1.82l.705.709l2.189-2.173V6.68z" />
                                </g>
                            </svg>
                            Detailed Review
                        </a>
                        <hr class="border-gray-300">
                    @endif

                    @if (Auth::user()->role === 'Admin' ||
                            Auth::user()->role === 'Integrator' ||
                            Auth::user()->role === 'Production Planner')
                        <a href="/review"
                            class="p-1.5 mx-2 text-sm flex items-center gap-4 hover:bg-gray-100 hover:border-color-gray-600 rounded-lg">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-700"
                                viewBox="0 0 2048 2048">
                                <path fill="currentColor"
                                    d="M0 256h2048v1536H0V256zm1920 1408V384H128v1280h1792zM1792 512v384H256V512h1536zm-128 256V640H384v128h1280zm-384 768v-512h512v512h-512zm128-384v256h256v-256h-256zm-384-128v128H256v-128h768zm0 384v128H256v-128h768z" />
                            </svg>
                            Review Queue Overview
                        </a>
                        <hr class="border-gray-300">
                    @endif

                    @if (Auth::user()->role === 'Admin' ||
                            Auth::user()->role === 'Integrator' ||
                            Auth::user()->role === 'Production Planner')
                        <a href="/diagnostics"
                            class="p-1.5 mx-2 text-sm flex items-center gap-4 hover:bg-gray-100 hover:border-color-gray-600 rounded-lg text-gray-700">
                            <svg class="h-4 w-4 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <g fill="currentColor">
                                    <path
                                        d="M16.03 6H4.004v3.938h.382L6.41 6.714l1.764 3.5l.723-1.152h3.611a4.5 4.5 0 0 0-.2 2h-2.301l-2.023 3.224l-1.765-3.5l-.722 1.152H4.004V15H16.03v-.062a4.55 4.55 0 0 0 2.005-.114V17h-7.016v1h2.005a1.001 1.001 0 1 1 0 2H7.01a1.001 1.001 0 1 1 0-2h2.004v-1H2V4h16.035v2.176a4.5 4.5 0 0 0-2.005-.114z" />
                                    <path fill-rule="evenodd"
                                        d="M19.868 12.165A3.504 3.504 0 0 0 16.782 7a3.504 3.504 0 0 0-3.508 3.5c0 1.933 1.57 3.5 3.508 3.5c.604 0 1.172-.152 1.668-.42l2.133 2.127L22 14.293zM16.782 12c.83 0 1.503-.672 1.503-1.5S17.612 9 16.782 9s-1.504.672-1.504 1.5s.674 1.5 1.504 1.5"
                                        clip-rule="evenodd" />
                                </g>
                            </svg>
                            Diagnostics
                        </a>
                        <hr class="border-gray-300">
                    @endif

                    @if (Auth::user()->role === 'Admin' ||
                            Auth::user()->role === 'Integrator' ||
                            Auth::user()->role === 'Production Planner')
                        <a href="/realtimemonitoring"
                            class="p-1.5 mx-2 text-sm flex items-center gap-4 hover:bg-gray-100 hover:border-color-gray-600 rounded-lg">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-700"
                                viewBox="0 0 24 24">
                                <path fill="currentColor"
                                    d="M3 21v-2l2-2v4H3Zm4 0v-6l2-2v8H7Zm4 0v-8l2 2.025V21h-2Zm4 0v-5.975l2-2V21h-2Zm4 0V11l2-2v12h-2ZM3 15.825V13l7-7l4 4l7-7v2.825l-7 7l-4-4l-7 7Z" />
                            </svg>
                            Real Time Monitoring
                        </a>
                        <hr class="border-gray-300">
                    @endif
                </div>
            </div>


        </div>

        <!-- COLONNA DESTRA -->
        <div class="flex-1 flex flex-col gap-6">
            <div class="bg-white rounded-xl p-8 border border-gray-200 w-full min-h-[400px] lg:min-w-[500px]">
                <div class="flex items-center gap-2 mb-6">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-700" viewBox="0 0 24 24">
                        <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                            stroke-width="2">
                            <path d="M4 18V6a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2z" />
                            <path d="m7 14l3-3l2 2l3-3l2 2" />
                        </g>
                    </svg>
                    <h2 class="text-xl font-semibold text-gray-700">Graph</h2>
                </div>

                <div class="space-y-4 text-gray-700 text-sm">
                    <x-graph />
                </div>
            </div>
        </div>

    </div>

</x-layout>
