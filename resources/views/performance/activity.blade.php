<x-layout>

    <div class="bg-white p-6 rounded-lg border border-color-gray-600 overflow-x-auto overflow-y-auto">
        <h1 class="font-bold text-2xl">
            Performance details
        </h1>
        <span class="block text-gray-600">
            Full performance and actions for the selected user.
        </span>
    </div>

    <div class="flex items-start gap-4 bg-white p-6 rounded-lg border border-color-gray-200 mt-6">
        @if ($selectedUser)
            <span class="text-medium text-gray-800">
                You've selected
                <span class="font-semibold">
                    {{ $selectedUser->name }} {{ $selectedUser->surname }}
                </span>.
                Below are their last 10 actions — including the date, time, and action type.
            </span>
        @else
            <span class="text-medium text-gray-800">
                No user selected.
            </span>
        @endif
    </div>


    <div class="mt-6 bg-white p-6 rounded-lg border border-color-gray-200">
        @if ($actions->isNotEmpty())
            <table class="w-full text-sm text-left text-gray-700">
                <thead>
                    <tr>
                        <th class="px-4 py-2">#</th>
                        <th class="px-4 py-2">Date</th>
                        <th class="px-4 py-2">Time</th>
                        <th class="px-4 py-2">Action type</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($actions as $index => $action)
                        <tr class="border-t border-gray-100 hover:bg-gray-50">
                            <td class="px-4 py-2">{{ $index + 1 }}</td>
                            <td class="px-4 py-2">{{ $action->date }}</td>
                            <td class="px-4 py-2">{{ $action->time }}</td>
                            <td class="px-4 py-2">{{ $action->type }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p class="text-sm text-gray-500">
                No actions found for this user.
            </p>
        @endif
    </div>

</x-layout>
