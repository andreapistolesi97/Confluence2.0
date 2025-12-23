<div class="relative overflow-x-auto overflow-y-auto max-h-[50vh] border border-gray-200 rounded-lg shadow-sm">
    <table class="w-full text-sm text-left text-gray-700">
        <thead class="bg-white text-sm font-semibold whitespace-nowrap border border-color-gray-200">

            <div class="bg-white p-4 border-b border-gray-200">
                @if (!empty($selectedRole))
                    <span class="inline-flex items-center gap-2 text-sm text-gray-800 whitespace-nowrap mt-3"> <svg
                            xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="size-6 bg bg-color-gray-200">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                        </svg>
                        User with role: <span
                            class="font-semibold text-green-600">{{ ucfirst($selectedRole) }}</span></span>
                @else
                    <span class="text-gray-500">All users (no role selected)</span>
                @endif
            </div>

            <tr>
                <th class="px-4 py-5 cursor-pointer">#</th>
                <th class="px-4 py-5 cursor-pointer">Name</th>
                <th class="px-4 py-5 cursor-pointer">Email</th>
                <th class="px-4 py-5 cursor-pointer">Role</th>
            </tr>
        </thead>
        <tbody>
            @forelse($users as $user)
                <tr class="bg-white border-t border-gray-100 hover:bg-gray-200">
                    <td class="px-4 py-3">{{ $loop->iteration }}</td>
                    <td class="px-4 py-3">{{ $user->name }} {{ $user->surname }}</td>
                    <td class="px-4 py-3">{{ $user->email }}</td>
                    <td class="px-4 py-3 "><span class="text-white bg-blue-400 rounded-xl p-1 text-xs">
                            {{ ucfirst($user->role) }}
                        </span></td>
                </tr>
            @empty
                <tr>
                    <td colspan="5" class="px-4 py-4 text-center text-gray-500">
                        No users found for this role.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>


</div>
