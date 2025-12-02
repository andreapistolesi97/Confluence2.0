@props(['users'])
<div class="w-full">
    <div class="relative overflow-x-auto bg-white border border-gray-200 mt-10 rounded-lg">

        <table class="w-full text-sm text-left text-gray-600">
            <thead class="text-sm bg-white border-b border-default-medium">
                <tr>
                    <th class="px-6 py-3 font-medium">User</th>
                    <th class="px-6 py-3 font-medium w-[140px] text-center">
                        Role
                    </th>
                    <th class="px-6 py-3 font-medium">Homepage</th>
                    <th class="px-6 py-3 font-medium">Auto Coupling Overview</th>
                    <th class="px-6 py-3 font-medium">Review</th>
                    <th class="px-6 py-3 font-medium">Logs</th>
                    <th class="px-6 py-3 font-medium">Production Action</th>
                    <th class="px-6 py-3 font-medium">Monitoring</th>
                    <th class="px-6 py-3 font-medium">Searches</th>
                    <th class="px-6 py-3 font-medium">Documentation</th>
                    <th class="px-6 py-3 font-medium">Help & Support</th>
                    <th class="px-6 py-3 font-medium">Profile</th>
                    <th class="px-6 py-3 font-medium">Add User</th>
                    <th class="px-6 py-3 font-medium">Role & Permissions</th>
                </tr>
            </thead>

            <tbody>

                @foreach ($users as $user)
                    <tr class="bg-white hover:bg-gray-100">

                        <!-- Immagine + Nome -->
                        <td class="px-6 py-4 flex items-center space-x-1">
                            <div
                                class="w-10 h-10 rounded-full bg-gray-200 flex items-center justify-center text-gray-700 font-bold">
                                {{ strtoupper(substr($user->name, 0, 1)) . strtoupper(substr($user->surname, 0, 1)) }}
                            </div>
                            <div>
                                <p class="font-semibold text-gray-900">{{ $user->name }}</p>
                                <p class="text-gray-500 text-xs">{{ $user->email }}</p>
                            </div>
                        </td>

                        <!-- Ruolo -->
                        <td class="px-6 py-4 w-[140px] text-center">
                            <span title="{{ $user->role ?? 'User' }}"
                                class="inline-block max-w-[200px] px-3 py-1
               bg-blue-100 text-blue-700 rounded-full text-xs font-semibold
               truncate">
                                {{ $user->role ?? 'User' }}
                            </span>
                        </td>

                        <!-- Permission columns per ora ancora non funzionanti tramite checkboxx) -->
                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                        <td class="px-6 py-4 text-center">
                            <input type="checkbox" class="w-4 h-4 text-blue-600 border-gray-300 rounded" />
                        </td>

                    </tr>
                @endforeach

            </tbody>
        </table>
    </div>
</div>
