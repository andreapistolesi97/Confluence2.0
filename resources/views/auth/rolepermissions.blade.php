<x-layout>
    <div class="bg-white rounded-xl p-6 border border-gray-200 space-y-2">
        <h1 class="font-bold text-2xl">Role & Permissions</h1>
        <span class="block text-gray-600">
            The Role & Permissions view allows administrators to manage access control within the system. From this
            section,
            you can view, create, and modify user roles, as well as assign the specific permissions associated with each
            role.
            Configure access permissions for each user using the checkboxes.

        </span>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 xl:grid-cols-5 gap-5 mt-8 min-w-0 ">

        <!-- CARD 1 -->
        <a href="/totalusers">
            <div
                class="bg-white hover:bg-gray-200 border border-gray-200 rounded-xl p-6 flex flex-col sm:flex-row justify-between items-center gap-3 transition ">
                <div>
                    <button class="text-gray-600 text-sm">Total User
                    </button>
                    <p class="text-3xl font-bold mt-1">{{ $totalUsers }}</p>
                </div>

                <div
                    class="w-12 h-12 rounded-full bg-white border border-color-gray-200 flex items-center justify-center">
                    <span class="text-black font-bold ">{{ $totalUsers }}</span>
                </div>
            </div>
        </a>

        <!-- CARD 2 -->
        <div
            class="bg-red-200 hover:bg-red-300 border border-gray-200 rounded-xl p-6 flex flex-col sm:flex-row justify-between items-center gap-3 transition">
            <div>
                <p class="text-gray-600 text-sm">Total Administrator</p>
                <p class="text-3xl font-bold mt-1">{{ $admin }}</p>
            </div>

            <div class="w-12 h-12 rounded-full bg-white border border-color-gray-200 flex items-center justify-center">
                <span class="text-gray-400 font-bold">{{ $admin }}</span>
            </div>
        </div>

        <!-- CARD 3 -->
        <div
            class="bg-yellow-200 hover:bg-yellow-300 border border-gray-200 rounded-xl p-6 flex flex-col sm:flex-row justify-between items-center gap-3 transition">
            <div>
                <p class="text-gray-600 text-sm">Total Integrator</p>
                <p class="text-3xl font-bold mt-1">{{ $integrator }}</p>
            </div>

            <div class="w-12 h-12 rounded-full bg-white border border-color-gray-200 flex items-center justify-center">
                <span class="text-gray-400 font-bold">{{ $integrator }}</span>
            </div>
        </div>

        <!-- CARD 4 -->

        <div
            class="bg-blue-200 hover:bg-blue-300 border border-gray-200 rounded-xl p-6 flex flex-col sm:flex-row justify-between items-center gap-3 transition">
            <div>
                <p class="text-gray-600 text-sm">Total Production Planner</p>
                <p class="text-3xl font-bold mt-1">{{ $productionplanner }}</p>
            </div>

            <div class="w-12 h-12 rounded-full bg-white border border-color-gray-200 flex items-center justify-center">
                <span class="text-gray-400 font-bold">{{ $productionplanner }}</span>
            </div>
        </div>

        <!-- CARD 5 -->

        <div
            class="bg-green-200 hover:bg-green-300 border border-gray-200 rounded-xl p-6 flex flex-col sm:flex-row justify-between items-center gap-3 transition">
            <div>
                <p class="text-gray-600 text-sm">Total Sales</p>
                <p class="text-3xl font-bold mt-1">{{ $sales }}</p>
            </div>

            <div class="w-12 h-12 rounded-full bg-white border border-color-gray-200 flex items-center justify-center">
                <span class="text-gray-400 font-bold">{{ $sales }}</span>
            </div>
        </div>


    </div>


    <div>
        <x-tablepermissions :permissions="$permissions" :rolePermissions="$rolePermissions" />
    </div>


</x-layout>
