<x-layout>
    <div class="p-8 mt-15 space-y-10">
        <div class="bg-white rounded-lg border border-color-gray-200 p-6">
            <h1 class="font-bold text-2xl">Blacklist</h1>
            <span class="block">
                Here you can import and export blacklisted contact from a File csv choosing a business driver
            </span>
        </div>

        <div class="mt-5">
            <div class="bg-white rounded-lg border border-color-gray-200 p-6">

                <form method="GET" action="{{ route('searches.blacklist.export') }}" class="space-y-4">

                    <div class="flex flex-col">
                        <label class="text-sm text-gray-700 mb-2 font-medium">
                            Choose a Business Driver
                        </label>
                        <x-dropdownmenubusinessdriver name="business_driver_id" id="business-driver"
                            :drivers="$drivers" />
                    </div>

                    <div class="flex gap-4">
                        <button type="submit"
                            class="text-white text-sm font-medium rounded-xl bg-red-600 px-5 py-2.5
                                   transition hover:bg-red-700 border border-color-gray-700">
                            Export Blacklist
                        </button>
                    </div>

                </form>

                <form method="POST" action="{{ route('searches.blacklist.import') }}" enctype="multipart/form-data"
                    class="mt-6 space-y-4">
                    @csrf

                    <div>
                        <label class="text-sm text-gray-700 mb-2 font-medium block">Choose a Business Drivers</label>

                        <div class="flex items-center gap-2 mb-3">
                            <button type="button" id="bd-deselect-all"
                                class="px-3 py-1.5 text-xs rounded border border-gray-300 hover:bg-gray-50">
                                Deselect all
                            </button>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                            @foreach ($drivers as $d)
                                <label class="flex items-center gap-2 text-sm">
                                    <input type="checkbox" class="bd-checkbox rounded border border-gray-300"
                                        name="business_driver_ids[]" value="{{ $d->id }}"
                                        @if ($d->id == 1) data-all="1" @endif>
                                    <span>{{ $d->driver_name }}</span>
                                </label>
                            @endforeach
                        </div>
                    </div>

                    <div>
                        <label class="text-sm text-gray-700 mb-2 font-medium block">CSV Format</label>
                        <select name="format" class="border rounded-lg p-2 w-64">
                            <option value="plain">Plain</option>
                            <option value="md5">MD5</option>
                            <option value="sha256">SHA-256</option>
                        </select>

                    </div>

                    <div>
                        <label class="text-sm text-gray-700 mb-2 font-medium block">CSV file</label>
                        <input type="file" name="file" accept=".csv,text/csv" class="border rounded-lg p-2 w-120"
                            required>

                    </div>

                    <button type="submit"
                        class="text-white text-sm font-medium rounded-xl bg-green-600 px-5 py-2.5
                                   transition hover:bg-green-700 border border-color-gray-700">
                        Import Blacklist
                    </button>

                    @if (session('import_result'))
                        <div class="mt-3 text-sm text-gray-700">
                            {!! session('import_result') !!}
                        </div>
                    @endif

                    @if ($errors->any())
                        <div class="mt-3 text-sm text-red-600">
                            <ul class="list-disc pl-5">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                </form>
            </div>
        </div>
    </div>
</x-layout>
<script>
document.addEventListener('DOMContentLoaded', () => {
  const btnNone = document.getElementById('bd-deselect-all');

  const allBox = document.querySelector('.bd-checkbox[data-all="1"]');
  const driverBoxes = () => Array.from(document.querySelectorAll('.bd-checkbox:not([data-all="1"])'));

  function setDriversChecked(checked) {
    driverBoxes().forEach(cb => cb.checked = checked);
  }

  allBox?.addEventListener('change', (e) => {
    setDriversChecked(e.target.checked);
  });

  driverBoxes().forEach(cb => {
    cb.addEventListener('change', () => {
      const boxes = driverBoxes();
      const every = boxes.length > 0 && boxes.every(x => x.checked);
      const none = boxes.every(x => !x.checked);

      if (!allBox) return;
      allBox.checked = every;
      allBox.indeterminate = !every && !none;
    });
  });

  btnNone?.addEventListener('click', () => {
    setDriversChecked(false);
    if (allBox) {
      allBox.checked = false;
      allBox.indeterminate = false;
    }
  });
});
</script>
