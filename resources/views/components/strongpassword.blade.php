@props([
    'name' => 'password',
])

@php
    $uid = 'sp-' . uniqid();
    $inputId = $uid . '-input';
    $hintsId = $uid . '-hints';
@endphp

<div class="max-w-sm">
    {{-- INPUT PASSWORD --}}
    <div class="mb-2">
        <input type="password" name="{{ $name }}" id="{{ $inputId }}"
            class="text-sm border border-black-600 py-2 px-3 w-full rounded-lg placeholder:text-sm
           focus:outline-indigo-600 focus:ring-indigo-600 focus:border-indigo-600"
            placeholder="Enter password">

        {{-- ATTIVO SOLO LA LOGICA DI PRELINE (SENZA PALLINI) --}}
        <div
            data-hs-strong-password='{
                "target": "#{{ $inputId }}",
                "hints": "#{{ $hintsId }}"
            }'>
        </div>
    </div>

    {{-- HINTS --}}
    <div id="{{ $hintsId }}" class="mb-3">

        <div>
            <span
                data-hs-strong-password-hints-weakness-text='["Empty","Weak","Medium","Strong","Very Strong","Super Strong"]'
                class="text-sm font-semibold text-gray-800 hs-strong-password-hints-level">
            </span>
        </div>

        <h4 class="my-2 text-sm font-semibold text-gray-800">Your password must contain:</h4>

        <ul class="space-y-1 text-sm text-gray-500">

            <li data-rule="min-length" class="flex items-center gap-x-2">
                <span class="hidden" data-check>✔</span>
                <span data-uncheck>✖</span>
                Minimum number of characters is 6.
            </li>

            <li data-rule="lowercase" class="flex items-center gap-x-2">
                <span class="hidden" data-check>✔</span>
                <span data-uncheck>✖</span>
                Should contain lowercase.
            </li>

            <li data-rule="uppercase" class="flex items-center gap-x-2">
                <span class="hidden" data-check>✔</span>
                <span data-uncheck>✖</span>
                Should contain uppercase.
            </li>

            <li data-rule="numbers" class="flex items-center gap-x-2">
                <span class="hidden" data-check>✔</span>
                <span data-uncheck>✖</span>
                Should contain numbers.
            </li>

            <li data-rule="special" class="flex items-center gap-x-2">
                <span class="hidden" data-check>✔</span>
                <span data-uncheck>✖</span>
                Should contain special characters.
            </li>

        </ul>

    </div>
</div>

<script>
    (function() {
        const input = document.getElementById('{{ $inputId }}');
        const hints = document.getElementById('{{ $hintsId }}');
        if (!input || !hints) return;

        function updateHints() {
            const val = input.value;

            const rules = {
                "min-length": val.length >= 6,
                "lowercase": /[a-z]/.test(val),
                "uppercase": /[A-Z]/.test(val),
                "numbers": /[0-9]/.test(val),
                "special": /[^A-Za-z0-9]/.test(val)
            };

            Object.keys(rules).forEach(rule => {
                const li = hints.querySelector(`[data-rule="${rule}"]`);
                if (!li) return;

                const check = li.querySelector('[data-check]');
                const uncheck = li.querySelector('[data-uncheck]');

                if (rules[rule]) {
                    check.classList.remove('hidden');
                    uncheck.classList.add('hidden');
                    li.classList.add('text-green-600');
                } else {
                    check.classList.add('hidden');
                    uncheck.classList.remove('hidden');
                    li.classList.remove('text-green-600');
                }
            });
        }

        input.addEventListener('input', updateHints);
        updateHints();
    })();
</script>
