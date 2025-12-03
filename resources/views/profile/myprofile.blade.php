<x-layout>
    <div class="w-full px-8 py-10" x-data="{ edit: false }">

        <div class="bg-white rounded-xl shadow-xs p-6">

            <!-- HEADER -->
            <div class="mb-2 flex justify-between items-start">
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Profile</h2>
                    <p class="text-sm text-gray-600 mt-4">
                        Welcome to your profile overview, here you can see your account settings.
                    </p>
                    <a href="/help" class="text-sm underline text-green-600 mt-6">Click Here for Support</a>
                </div>
            </div>



            <!-- FORM -->
            <form method="POST" action="{{ route('profile.myprofile.update') }}" class="mt-4">
                @csrf
                @method('PUT')

                <!-- GRID -->
                <div class="grid grid-cols-12 gap-6">

                    <!-- NAME -->
                    <div class="col-span-12 sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Your Name :</label>
                    </div>

                    <div class="col-span-12 sm:col-span-9">
                        <input type="text" disabled
                            class="border border-gray-300 py-2 px-3 w-full rounded-lg shadow-sm 
                                   focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70 text-xs text-gray-500"
                            value="{{ Auth::user()->name }}">
                    </div>

                    <!-- SURNAME -->
                    <div class="col-span-12 sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Your Surname :</label>
                    </div>

                    <div class="col-span-12 sm:col-span-9">
                        <input type="text" disabled
                            class="border border-gray-300 py-2 px-3 w-full rounded-lg shadow-sm 
                                   focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70 text-xs text-gray-500"
                            value="{{ Auth::user()->surname }}">
                    </div>

                    <!-- EMAIL (solo lettura) -->
                    <div class="col-span-12 sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Email :</label>
                    </div>

                    <div class="col-span-12 sm:col-span-9">
                        <input type="email" disabled
                            class="border border-gray-300 py-2 px-3 w-full rounded-lg shadow-sm 
                                   focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70 text-xs text-gray-500"
                            value="{{ Auth::user()->email }}">
                    </div>

                    <!-- CURRENT PASSWORD -->
                    <div class="col-span-12 sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Current Password :</label>
                    </div>

                    <div class="col-span-12 sm:col-span-9">
                        <div class="relative" x-data="{ showCurrent: false }">
                            <input :type="showCurrent ? 'text' : 'password'" name="current_password"
                                :disabled="!edit" id="password_current"
                                class="py-2.5 pl-4 pr-12 w-full border border-gray-300 rounded-lg text-sm
                                       focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70 placeholder:text-xs text-gray-500"
                                placeholder="Enter your current password">

                            <button type="button" x-show="edit" @click="showCurrent = !showCurrent"
                                class="absolute inset-y-0 right-0 flex items-center px-3 text-sm">
                                <span x-show="!showCurrent">👁</span>
                                <span x-show="showCurrent">👁</span>
                            </button>
                        </div>

                        @error('current_password')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <!-- NEW PASSWORD -->
                    <div class="col-span-12 sm:col-span-3 flex items-center">
                        <label class="text-sm text-gray-800">Modify your Password :</label>
                    </div>

                    <div class="col-span-12 sm:col-span-9">
                        <div class="relative" x-data="{ showNew: false }">
                            <input :type="showNew ? 'text' : 'password'" name="password" :disabled="!edit"
                                id="password_new"
                                class="py-2.5 pl-4 pr-12 w-full border border-gray-300 rounded-lg text-sm
                                       focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70 placeholder:text-xs text-gray-600"
                                placeholder="Enter new password">

                            <button type="button" x-show="edit" @click="showNew = !showNew"
                                class="absolute inset-y-0 right-0 flex items-center px-3 text-sm">
                                <span x-show="!showNew">👁</span>
                                <span x-show="showNew">👁</span>
                            </button>
                        </div>

                        @error('password')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                </div>

                <!-- BUTTONS -->
                <div class="mt-10 flex justify-end gap-3">

                    @if (Auth::user()->role === 'Admin')
                        <a href="/adduser"
                            class="text-white text-sm rounded-xl bg-red-600 px-4 py-2.5
                                   transition-colors duration-300 hover:bg-red-700">
                            Add User
                        </a>
                    @endif

                    <!-- EDIT / CANCEL -->
                    <button type="button" @click="edit = !edit"
                        class="text-white text-sm rounded-xl bg-gray-500 px-4 py-2.5
                               transition-colors duration-300 ease-in-out hover:bg-blue-700">
                        <span x-show="!edit">Edit Profile</span>
                        <span x-show="edit">Cancel</span>
                    </button>

                    <!-- SAVE -->
                    <button type="submit" x-show="edit"
                        class="text-white text-sm rounded-xl bg-green-600 px-4 py-2.5
                               transition-colors duration-300 ease-in-out hover:bg-green-700">
                        Save changes
                    </button>

                </div>
            </form>

        </div>
        <!-- TOAST MESSAGES -->
        @if (session('success'))
            <div id="successToast"
                class="opacity-0 translate-y-2 transition-all duration-500
                           mt-4 bg-teal-100 border border-teal-200 text-sm text-teal-800
                           rounded-lg p-4">
                <span class="font-bold">Success:</span> {{ session('success') }}
            </div>
        @endif

        @if (session('error'))
            <div id="errorToast"
                class="opacity-0 translate-y-2 transition-all duration-500
                           mt-4 bg-red-100 border border-red-200 text-sm text-red-800
                           rounded-lg p-4">
                <span class="font-bold">Error:</span> {{ session('error') }}
            </div>
        @endif

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
</x-layout>
