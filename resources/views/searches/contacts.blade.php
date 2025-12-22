<x-layout>
    <div class="p-8 space-y-12 mt-15">

        <div class="bg-white rounded-lg p-6 border border-color-gray-200">
            <h1 class="font-bold text-2xl">Search Contacts</h1>
            <span class="block">You can search for a contact by entering their email address or phone number.</span>
        </div>
        <form method="POST" action="{{ route('searches.contacts.run') }}" class="space-y-9">
            @csrf

            <div class="bg-white rounded-lg p-6 border border-color-gray-200 space-y-9">


                <div>
                    <label for="email" class="block mb-2.5 text-sm font-medium text-heading text-gray-700">
                        Insert Email
                    </label>

                    <div class="relative w-[400px]">
                        <!-- icna mail-->
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                            <svg class="w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M16 12l-4 4-4-4m8-8H8a2 2 0 00-2 2v12a2 2 0 002 2h8a2 2 0 002-2V6a2 2 0 00-2-2z" />
                            </svg>
                        </div>

                        <input name="email" type="text" id="email"
                            class="rounded-lg bg-neutral-secondary-medium border border-default-medium 
                           text-heading text-sm block w-full pl-10 pr-3 py-2 shadow-xs placeholder:text-body
                           focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-300"
                            placeholder="example@email.com" />
                    </div>
                </div>

                <div>
                    <label for="phone" class="block mb-2.5 text-sm font-medium text-heading text-gray-700">
                        Insert Phone Number
                    </label>

                    <div class="relative w-[400px]">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                            <svg class="w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M3 5h2l3 7-1.5 3A8.97 8.97 0 0012 21a8.97 8.97 0 005.5-1.5L18 15l3-7h2" />
                            </svg>
                        </div>

                        <input name="phone" type="text" id="phone"
                            class="rounded-lg bg-neutral-secondary-medium border border-default-medium 
                           text-heading text-sm block w-full pl-10 pr-3 py-2 shadow-xs placeholder:text-body
                           focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-300"
                            placeholder="es. +39/331123456" />
                    </div>
                </div>

                <!-- BUTTON -->
                <div class="flex items-center gap-20">
                    <button type="submit"
                        class="text-white text-sm font-medium  rounded-xl bg-green-600 p-2.5
                transition-colors duration-300 ease-in-out hover:bg-green-700 border border-color-gray-600">
                        Check List
                    </button>
                </div>
        </form>



    </div>

    <div class="bg-white rounded-lg p-6 border border-colorgray-200 mt-6">

        @if (!empty($message))
            <div class=" text-red-500 font-medium p-3 rounded-lg">
                {{ $message }}
            </div>
        @endif

        @if (!empty($contact))
            <h2 class="font-semibold text-lg mb-4">Contact Found</h2>

            <div class="gap-4 text-sm space-y-3">
                <div><span class="w-60 text-sm text-gray-700 mb-2 font-medium">ID:</span>
                    {{ $contact['ID_Contact'] }}</div>
                <div><span class="w-60 text-sm text-gray-700 mb-2 font-medium">Country:</span>
                    {{ $contact['Info_Country'] ?? '-' }}</div>

                <div class="md:col-span-2">
                    <span class="w-60 text-sm text-gray-700 mb-2 font-medium">Email:</span>
                    {{ $contact['email_plain'] ?? '-' }}
                </div>

                <div class="md:col-span-2">
                    <span class="w-60 text-sm text-gray-700 mb-2 font-medium">Phone:</span>
                    @php
                        $p = $contact['phone_plain'] ?? '';
                        $pNorm = preg_replace('/[^\d+]/', '', $p);

                        $len = strlen($pNorm);
                        $masked = $len > 7 ? substr($pNorm, 0, $len - 7) . str_repeat('*', 7) : str_repeat('*', $len);
                    @endphp

                    {{ $masked ?: '-' }}
                </div>
            </div>
        @endif

        @if (empty($message) && empty($contact))
            <div class="text-gray-400 text-sm">
                No search performed yet.
            </div>
        @endif

    </div>

</x-layout>
