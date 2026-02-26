<x-layout>

    <div class="max-w-7xl mx-auto px-4 py-10 sm:px-6 lg:px-8 lg:py-14 bg-white border border-gray-200 rounded-lg">

        <!-- HEADER -->
        <div class="text-center mb-12">
            <h1 class="text-3xl font-bold text-gray-800 sm:text-4xl">
                Contact us
            </h1>
            <p class="mt-1 text-gray-600">
                We'd love to talk about how we can help you.
            </p>
        </div>

        <!-- GRID -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">

            <!-- FORM CARD -->
            <div class="border border-gray-200 rounded-xl p-6 sm:p-8">

                <h2 class="mb-8 text-xl font-semibold text-gray-800">
                    Fill in the form
                </h2>

                <form method="POST" action="{{ route('help.send') }}">
                    @csrf


                    <div class="grid gap-5">

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <input type="text"
                                name="name"
                                value="{{ old('name') }}"
                                placeholder="Name"
                                class="text-sm border border-gray-300 py-2 px-3 w-full rounded-lg placeholder:text-sm
                          focus:outline-indigo-600 focus:ring-indigo-600 focus:border-indigo-600" />

                            <input type="text"
                                name="surname"
                                value="{{ old('surname') }}"
                                placeholder="Surname"
                                class="text-sm border border-gray-300 py-2 px-3 w-full rounded-lg placeholder:text-sm
                          focus:outline-indigo-600 focus:ring-indigo-600 focus:border-indigo-600" />
                        </div>

                        <input type="email"
                            name="email"
                            value="{{ old('email') }}"
                            placeholder="Email"
                            class="text-sm border border-gray-300 py-2 px-3 w-full rounded-lg placeholder:text-sm
                      focus:outline-indigo-600 focus:ring-indigo-600 focus:border-indigo-600" />

                        <textarea rows="4"
                            name="details"
                            placeholder="Details"
                            class="text-sm border border-gray-300 py-2 px-3 w-full rounded-lg placeholder:text-sm
                         focus:outline-indigo-600 focus:ring-indigo-600 focus:border-indigo-600">{{ old('details') }}</textarea>
                    </div>

                    <div class="mt-6">
                        <button type="submit"
                            class="w-full text-white text-sm rounded-xl bg-green-600 p-2.5 hover:bg-green-700 transition">
                            Send inquiry
                        </button>
                    </div>

                    <p class="mt-3 text-center text-sm text-gray-500">
                        We'll get back to you in 1-2 business days.
                    </p>
                    <div class="mt-4">

                    {{-- Success / errors --}}
                    @if (session('success'))
                    <div class="mb-4 rounded-lg bg-green-50 p-3 text-green-800 text-sm">
                        {{ session('success') }}
                    </div>
                    @endif

                    @if ($errors->any())
                    <div class="mb-4 rounded-lg bg-red-50 p-3 text-red-800 text-sm">
                        <ul class="list-disc pl-5">
                            @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                    @endif
                    </div>
                </form>
            </div>

            <!-- RIGHT SIDE INFO -->
            <div class="divide-y divide-gray-200">

                <!-- EMAIL CONTACT -->
                <div class="flex gap-6 py-6">
                    <svg class="w-6 h-6 mt-1.5 text-gray-800"
                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                        viewBox="0 0 24 24">
                        <path d="M21.2 8.4c.5.38.8.97.8 1.6v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V10a2 2 0 0 1 .8-1.6l8-6a2 2 0 0 1 2.4 0l8 6Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="m22 10-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 10" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>

                    <div class="grow">
                        <h3 class="font-semibold text-gray-800">Contact us by email</h3>
                        <p class="mt-1 text-sm text-gray-500">
                            If you prefer contacting us directly, write to:
                        </p>
                        <a href="#" class="mt-2 inline-flex items-center gap-2 text-sm font-medium text-gray-600 hover:text-gray-800">
                            mail@confluence.revdev.it                     </a>
                    </div>
                </div>

            </div>

        </div>

    </div>

</x-layout>