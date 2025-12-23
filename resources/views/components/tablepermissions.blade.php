@props(['permissions', 'rolePermissions'])

@php
    // qui metti i ruoli che usi davvero nel DB users.role
    $roles = ['admin', 'integrator', 'production planner', 'sales'];
@endphp

<div class="w-full">
    <div class="relative overflow-x-auto bg-white border border-gray-200 mt-10 rounded-lg">

        <form method="POST" action="{{ route('rolepermissions.save') }}">
            @csrf

            <table class="w-full text-sm text-left text-gray-600">
                <thead class="text-sm bg-white border-b border-default-medium">
                    <tr>
                        <th class="px-6 py-3 font-medium">Role</th>

                        @foreach ($permissions as $perm)
                            <th class="px-6 py-3 font-medium text-center whitespace-nowrap">
                                {{ $perm->label }}
                            </th>
                        @endforeach
                    </tr>
                </thead>

                <tbody>
                    @foreach ($roles as $role)
                        <tr class="bg-white hover:bg-gray-50 border-t">

                            {{-- ROLE --}}
                            <td class="px-6 py-4 w-[180px]">
                                <span
                                    class="inline-block px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-xs font-semibold">
                                    {{ ucfirst($role) }}
                                </span>
                            </td>

                            {{-- CHECKBOX PERMISSIONI --}}
                            @foreach ($permissions as $perm)
                                @php
                                    $checked = in_array($perm->id, $rolePermissions[$role] ?? []);
                                @endphp

                                <td class="px-6 py-4 text-center">
                                    <input type="checkbox" name="permissions[{{ $role }}][]"
                                        value="{{ $perm->id }}"
                                        class="w-4 h-4 text-blue-600 border-gray-300 rounded"
                                        @checked($checked) />
                                </td>
                            @endforeach

                        </tr>
                    @endforeach
                </tbody>
            </table>

            <div class="p-6 flex justify-end">
                <button type="submit"
                    class="text-white text-sm font-medium rounded-xl bg-green-600 px-4 py-2.5
                           transition-colors duration-300 ease-in-out hover:bg-green-700 border border-color-gray-600">
                    Save Permissions
                </button>
            </div>
        </form>

    </div>
</div>
