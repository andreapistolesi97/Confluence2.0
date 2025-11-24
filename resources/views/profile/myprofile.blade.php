<x-layout>
    <div class="w-full px-8 py-10" x-data="{ edit: false }">

        <div class="bg-white rounded-xl shadow-xs p-6">

            <!-- HEADER -->
            <div class="mb-8 flex justify-between items-start">
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Profile</h2>
                    <p class="text-sm text-gray-600 mt-4">
                        Welcome to your profile overview, here you can see your account settings.
                    </p>
                    <a href="/help" class="text-sm underline text-green-600 mt-6">Click Here for Support</a>
                </div>


            </div>

            <!-- GRID -->
            <div class="grid grid-cols-12 gap-6">

                <!-- NAME -->
                <div class="col-span-12 sm:col-span-3 flex items-center">
                    <label class="text-sm text-gray-800">Your Name :</label>
                </div>

                <div class="col-span-12 sm:col-span-9">
                    <input type="text" :disabled="!edit"
                        class="border border-gray-300 py-2 px-3 w-full rounded-lg shadow-sm 
                               focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70 placeholder:text-sm"
                        placeholder="{{ Auth::user()->name }}">
                </div>

                <!-- SURNAME -->
                <div class="col-span-12 sm:col-span-3 flex items-center">
                    <label class="text-sm text-gray-800">Your Surname :</label>
                </div>

                <div class="col-span-12 sm:col-span-9">
                    <input type="text" :disabled="!edit"
                        class="border border-gray-300 py-2 px-3 w-full rounded-lg shadow-sm 
                               focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70  placeholder:text-sm"
                        placeholder="{{ Auth::user()->surname }}">
                </div>

                <!-- EMAIL -->
                <div class="col-span-12 sm:col-span-3 flex items-center">
                    <label class="text-sm text-gray-800">Email :</label>
                </div>

                <div class="col-span-12 sm:col-span-9">
                    <input type="email" :disabled="!edit"
                        class="border border-gray-300 py-2 px-3 w-full rounded-lg shadow-sm 
                               focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70 placeholder:text-sm"
                        placeholder="{{ Auth::user()->email }}">
                </div>

                <!-- CURRENT PASSWORD -->
                <div class="col-span-12 sm:col-span-3 flex items-center">
                    <label class="text-sm text-gray-800">Current Password :</label>
                </div>

                <div class="col-span-12 sm:col-span-9">
                    <div class="relative">
                        <input type="password" :disabled="!edit" id="password_current"
                            class="py-2.5 pl-4 pr-12 w-full border border-gray-300 rounded-lg text-sm
                                   focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70 placeholder:text-sm"
                            placeholder="Enter your password">
                        <button type="button" x-show="edit" data-hs-toggle-password='{"target": "#password_current"}'
                            class="absolute inset-y-0 right-0 flex items-center px-3">👁</button>
                    </div>
                </div>

                <!-- NEW PASSWORD -->
                <div class="col-span-12 sm:col-span-3 flex items-center">
                    <label class="text-sm text-gray-800">Modify your Password :</label>
                </div>

                <div class="col-span-12 sm:col-span-9">
                    <div class="relative">
                        <input type="password" :disabled="!edit" id="password_new"
                            class="py-2.5 pl-4 pr-12 w-full border border-gray-300 rounded-lg text-sm
                                   focus:outline-indigo-600 disabled:bg-gray-100 disabled:opacity-70 placeholder:text-sm"
                            placeholder="Enter new password">
                        <button type="button" x-show="edit" data-hs-toggle-password='{"target": "#password_new"}'
                            class="absolute inset-y-0 right-0 flex items-center px-3">👁</button>
                    </div>
                </div>

            </div>
            <!-- END GRID -->

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
                <button @click="edit = !edit"
                    class="text-white text-sm rounded-xl bg-blue-600 px-4 py-2.5
               transition-colors duration-300 ease-in-out hover:bg-blue-700">
                    <span x-show="!edit">Edit Profile</span>
                    <span x-show="edit">Cancel</span>
                </button>

                <!-- SAVE -->
                <button x-show="edit"
                    class="text-white text-sm rounded-xl bg-green-600 px-4 py-2.5
               transition-colors duration-300 ease-in-out hover:bg-green-700">
                    Save changes
                </button>

            </div>

        </div>
    </div>
</x-layout>
