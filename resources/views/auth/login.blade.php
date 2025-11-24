<!DOCTYPE html>
<html lang="en" class="fui">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confluence</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Google+Sans+Flex:opsz,wght@6..144,1..1000&family=Zalando+Sans:ital,wght@0,200..900;1,200..900&display=swap"
        rel="stylesheet">

    <style>
        * {
            font-family: "Zalando Sans", sans-serif !important;
        }
    </style>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen bg-[url('/images/background-login.jpg')] bg-cover bg-center">
    <div class="min-h-screen flex items-center justify-center ">
        <div class="w-full max-w-lg bg-white p-8 rounded-xl border border-black-600 min-h-[800px]">
            <div class="flex flex-col items-center space-y-4">
                <img class="w-auto h-14" src="/images/revelop_logo.png" alt="Revelop Logo">
                <img class="w-auto h-24" src="/images/confluence-logo.png" alt="Confluence Logo">
            </div>

            <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-sm">
                <h2 class="mt-10 text-2xl/9 font-semibold tracking-tight text-gray-700">Sign in to your account</h2>
                <p>Access the application panel using your email and password.</p>
                <form method="POST" action="{{ route('login.store') }}">
                    @csrf
                    <div>
                        <label for="email" class="mt-6 block text-sm/6 font-medium text-gray-900">Email
                            address</label>
                        <div class="mt-3 ">
                            <input id="email" type="email" name="email" value="{{ old('email') }}" required
                                autocomplete="email"
                                class="border border-black-600 block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400  focus:outline-indigo-600 sm:text-sm/6" />
                        </div>
                    </div>

                    <div>
                        <div class="flex items-center justify-between">
                            <label for="password"
                                class="mt-6 block text-sm/6 font-medium text-gray-900">Password</label>
                            <div class="text-sm mt-6">
                                <a href="#" class=" text-green-600 hover:text-green-500 underline">Forgot
                                    password?</a>
                            </div>
                        </div>
                        <div class="mt-3">
                            <input id="password" type="password" name="password" required
                                autocomplete="current-password"
                                class="border border-black-600 block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400  focus:outline-indigo-600 sm:text-sm/6" />
                        </div>
                    </div>
                    {{-- TERMS DROPDOWN --}}
                    <div class="mt-6">
                        <x-dropdownmenuterms />
                    </div>

                    {{-- TERMS CHECKBOX --}}
                    <div class="space-y-4 mt-6">

                        <div class="flex items-center">
                            <input id="link-checkbox" type="checkbox" name="terms"
                                class="w-4 h-4 border border-default-medium rounded-xs bg-neutral-secondary-medium">

                            <label for="link-checkbox" class="select-none ms-2 text-sm font-small text-heading">
                                I agree with the terms and conditions
                            </label>
                        </div>

                        {{-- ERROR TERMS --}}
                        @error('terms')
                            <div class="bg-red-100 border border-red-300 text-red-700 p-3 rounded-md text-sm">
                                 The terms must be accepted.</div>
                        @enderror


                        <div class="flex items-center">
                            <input id="link-checkbox2" type="checkbox" value=""
                                class="w-4 h-4 border border-default-medium rounded-xs bg-neutral-secondary-medium">
                            <label for="link-checkbox2"
                                class="select-none ms-2 text-sm font-small text-heading">Remember me</a></label>
                        </div>
                    </div>



                    <div>
                        <button type="submit"
                            class="mt-8 flex w-full justify-center rounded-md bg-green-600 px-3 py-1.5 text-sm/6 font-semibold text-white shadow-xs hover:bg-green-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Sign
                            in</button>
                    </div>

                    <div class="mt-4">
                        @error('email')
                            <div class="bg-red-100 border border-red-300 text-red-700 p-3 rounded-md text-sm">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                </form>

            </div>
        </div>
    </div>


</body>

</html>
