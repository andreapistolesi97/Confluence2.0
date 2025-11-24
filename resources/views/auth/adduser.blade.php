<x-layout>
    <form method="POST" action="{{ route('adduser.store') }}">
        @csrf

       <div class="w-full px-8 py-10">

            <div class="bg-white rounded-xl shadow-xs p-4 sm:p-7">

                <!-- HEADER -->
                <div class="mb-8">
                    <h2 class="text-xl font-bold text-gray-800">Add User</h2>
                    <p class="text-sm text-gray-600">
                        Here you can add a new user by completing the fields below.
                    </p>
                </div>

                <!-- GRID -->
                <div class="grid sm:grid-cols-12 gap-4 sm:gap-6">

                    <!-- NAME -->
                    <div class="sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Name :</label>
                    </div>

                    <div class="sm:col-span-9">
                        <input type="text" name="name" required
                            class="text-sm border border-gray-300 py-2 px-3 w-full rounded-lg
                                   focus:outline-indigo-600 focus:ring-indigo-600"
                            placeholder="Admin">
                    </div>

                    <!-- SURNAME -->
                    <div class="sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Surname :</label>
                    </div>

                    <div class="sm:col-span-9">
                        <input type="text" name="surname" required
                            class="text-sm border border-gray-300 py-2 px-3 w-full rounded-lg
                                   focus:outline-indigo-600 focus:ring-indigo-600"
                            placeholder="Admin">
                    </div>

                    <!-- EMAIL -->
                    <div class="sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Email :</label>
                    </div>

                    <div class="sm:col-span-9">
                        <input type="email" name="email" required
                            class="text-sm border border-gray-300 py-2 px-3 w-full rounded-lg
                                   focus:outline-indigo-600 focus:ring-indigo-600"
                            placeholder="admin@example.com">
                    </div>

                    <!-- PASSWORD -->
                    <div class="sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Password :</label>
                    </div>

                    <div class="sm:col-span-9">
                        <x-strongpassword name="password" />
                    </div>

                    <!-- CONFIRM PASSWORD -->
                    <div class="sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Confirm Password :</label>
                    </div>

                    <div class="sm:col-span-9">
                        <x-strongpassword name="password_confirmation" />
                    </div>

                    <!-- ROLE -->
                    <div class="sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Role :</label>
                    </div>

                    <div class="sm:col-span-9">
                        <x-dropdownmenurole />
                    </div>

                </div>
                <!-- END GRID -->

                <!-- BUTTONS -->
                <div class="mt-6 flex justify-end gap-3">

                    <a href="/myprofile"
                        class="text-gray-700 text-sm rounded-xl bg-white px-4 py-2.5 border border-gray-400
                               transition-colors duration-300 hover:bg-gray-200">
                        Return to your profile
                    </a>

                    <button type="submit"
                        class="text-white text-sm rounded-xl bg-red-600 px-4 py-2.5
                               transition-colors duration-300 hover:bg-red-700">
                        Confirm New User
                    </button>
                </div>

            </div>

            <!-- SUCCESS MESSAGE -->
            @if (session('success'))
                <div id="successToast"
                    class="opacity-0 translate-y-2 transition-all duration-500
                    mt-4 bg-teal-100 border border-teal-200 text-sm text-teal-800
                    rounded-lg p-4">
                    <span class="font-bold">Success:</span> {{ session('success') }}
                </div>
            @endif

            <!-- ERROR MESSAGE -->
            @if (session('error'))
                <div id="errorToast"
                    class="opacity-0 translate-y-2 transition-all duration-500
                    mt-4 bg-red-100 border border-red-200 text-sm text-red-800
                    rounded-lg p-4">
                    <span class="font-bold">Error:</span> {{ session('error') }}
                </div>
            @endif

            <!-- VALIDATION MESSAGE -->
            @if ($errors->any())
                <div id="warningToast"
                    class="opacity-0 translate-y-2 transition-all duration-500
                    mt-4 bg-yellow-100 border border-yellow-200 text-sm text-yellow-800
                    rounded-lg p-4">
                    <span class="font-bold">Warning:</span> Please check all the data.
                </div>
            @endif

        </div>

        <script>
            document.addEventListener("DOMContentLoaded", () => {

                const showToast = (id) => {
                    const el = document.getElementById(id);
                    if (!el) return;

                    setTimeout(() => {
                        el.classList.remove('opacity-0', 'translate-y-2');
                    }, 50);

                    setTimeout(() => {
                        el.classList.add('opacity-0', 'translate-y-2');
                    }, 3500);
                };

                showToast("successToast");
                showToast("errorToast");
                showToast("warningToast");
            });
        </script>
    </form>
</x-layout>
