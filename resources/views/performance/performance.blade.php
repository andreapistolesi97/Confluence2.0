<x-layout>

    <div class="bg-white p-6 rounded-lg border border-color-gray-600 overflow-x-auto overflow-y-auto">
        <h1 class="font-bold text-2xl">
            Welcome to Performance page, {{ Auth::user()->name }} {{ Auth::user()->surname }}.
        </h1>
        <span class="block text-gray-600">Full users performance and actions.</span>
    </div>

    <form method="GET" action="{{ route('performance.performance.index') }}"
        class="mt-4 bg-white p-6 rounded-lg border border-color-gray-600 overflow-x-auto overflow-y-auto gap-x-3">

        <div class="flex items-start gap-4">
            <span class="text-sm text-gray-700 font-medium whitespace-nowrap mt-3">
                Choose a Role
            </span>

            <div class="w-64">
                <x-dropdownmenurole />
            </div>
        </div>


        <div class="mt-4">
            <button type="submit"
                class="text-white text-sm rounded-xl bg-green-600 px-4 py-2.5
                           transition-colors duration-300 hover:bg-green-700">
                Run Filters
            </button>
        </div>
    </form>
    <div class="mt-8">

        <x-tableuser :users="$users" :selectedRole="$selectedRole" />
    </div>

</x-layout>
