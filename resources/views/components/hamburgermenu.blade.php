<button id="dropdownMenuIconButton" data-dropdown-toggle="dropdownDots" data-dropdown-placement="bottom-end"
    class="text-heading bg-neutral-primary box-border border border-transparent hover:bg-neutral-secondary-medium focus:ring-4 focus:ring-neutral-tertiary font-medium leading-5 rounded-lg text-sm p-2 focus:outline-none"
    type="button">
    <svg class="w-6 h-6" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
        viewBox="0 0 24 24">
        <path stroke="currentColor" stroke-linecap="round" stroke-width="3" d="M12 6h.01M12 12h.01M12 18h.01" />
    </svg>
</button>

<!-- Dropdown menu -->
<div id="dropdownDots" class="z-10 hidden bg-white border border-gray-300 rounded-lg shadow-lg w-44 ">
    <ul class="p-2 text-sm text-body font-medium" aria-labelledby="dropdownMenuIconButton">
        <li>
            <a href="/myprofile"
                class="inline-flex items-center w-full p-2 hover:bg-gray-200 hover:text-heading rounded text-gray-600">My
                Profile</a>
        </li>
        @if (Auth::user()->role === 'Admin')
            <li>
                <a href="/rolepermissions"
                    class="inline-flex items-center w-full p-2 hover:bg-gray-200 hover:text-heading rounded text-gray-600">Role
                    &
                    Permissions</a>
            </li>
        @endif
        @if (Auth::user()->role === 'Admin')
            <li>
                <a href="/adduser"
                    class="inline-flex items-center w-full p-2 hover:bg-gray-200 hover:text-heading rounded text-gray-600">Add
                    User</a>
            </li>
        @endif
        <li>
            <a href="/"
                class="inline-flex items-center w-full p-2 hover:bg-gray-200 hover:text-heading rounded text-gray-600">Logout</a>
        </li>
    </ul>

</div>
