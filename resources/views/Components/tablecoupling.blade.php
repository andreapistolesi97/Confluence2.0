<div class="overflow-x-auto bg-white rounded-lg border border-gray-200 shadow-sm">

    <!-- INNER: scrollbar VERTICALE -->
    <div class="max-h-[600px] overflow-y-auto">
        <table class="min-w-[1800px] text-sm text-left text-gray-700">

            <thead class="bg-gray-100 text-xs font-semibold">
                <tr>
                    <th class="px-4 py-2">AM ID</th>
                    <th class="px-4 py-2">Offer Number</th>
                    <th class="px-4 py-2">Customer</th>
                    <th class="px-4 py-2">Day Start</th>
                    <th class="px-4 py-2">Day End</th>
                    <th class="px-4 py-2">Offer Name</th>
                    <th class="px-4 py-2">Offer Cluster</th>
                    <th class="px-4 py-2">Number of L4C Offers</th>
                    <th class="px-4 py-2">Total Amount to Couple</th>
                    <th class="px-4 py-2">Hot to Couple</th>
                    <th class="px-4 py-2">Warm to Couple</th>
                    <th class="px-4 py-2">Cold to Couple</th>
                    <th class="px-4 py-2">Perf to Couple</th>
                    <th class="px-4 py-2">Real Time to Couple</th>
                    <th class="px-4 py-2">Total Planned</th>
                    <th class="px-4 py-2">Hot Planned</th>
                    <th class="px-4 py-2">Warm Planned</th>
                    <th class="px-4 py-2">Cold Planned</th>
                    <th class="px-4 py-2">Perf Planned</th>
                    <th class="px-4 py-2">Real Time Planned</th>
                    <th class="px-4 py-2">Total Coupled</th>
                    <th class="px-4 py-2">Hot Coupled</th>
                    <th class="px-4 py-2">Warm Coupled</th>
                    <th class="px-4 py-2">Cold Coupled</th>
                    <th class="px-4 py-2">Perf Coupled</th>
                    <th class="px-4 py-2">Coupling Filters</th>
                    <th class="px-4 py-2">L4C Phase</th>
                    <th class="px-4 py-2">Real Time Coupled</th>
                    <th class="px-4 py-2">Qualification Settings</th>
                    <th class="px-4 py-2">Qualification Settings Limit</th>
                    <th class="px-4 py-2">Real Time ID_List</th>
                    <th class="px-4 py-2">Real Time Meta Campaign ID</th>
                    <th class="px-4 py-2">Category</th>
                    <th class="px-4 py-2">Country</th>
                    <th class="px-4 py-2">Country Code</th>
                    <th class="px-4 py-2">Business Driver</th>
                    <th class="px-4 py-2">Landing Page</th>
                    <th class="px-4 py-2">Confluence Mandatory Field List</th>
                    <th class="px-4 py-2">Campi AIRtable</th>
                    <th class="px-4 py-2">Confluence Check</th>
                    <th class="px-4 py-2">Contact Configuration</th>
                    <th class="px-4 py-2">Night Production Settings</th>
                    <th class="px-4 py-2">Delete Needed</th>
                    <th class="px-4 py-2">Created Time</th>
                    <th class="px-4 py-2">Trigger Update Time</th>
                    <th class="px-4 py-2">Last Processing Start Time</th>
                    <th class="px-4 py-2">Last Processing End Time</th>
                </tr>
            </thead>

            <tbody>

                @forelse ($results as $row)
                    <tr class="border-b hover:bg-gray-50">

                        <td class="px-4 py-2">{{ $row->{'AM ID'} }}</td>
                        <td class="px-4 py-2 font-bold">{{ $row->{'Offer Number'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Customer'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Day Start'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Day End'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Offer Name'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Offer Cluster'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Number of L4C Offers'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Total Amount to Couple'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Hot to Couple'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Warm to Couple'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Cold to Couple'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Perf to Couple'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Real Time to Couple'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Total Planned'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Hot Planned'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Warm Planned'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Cold Planned'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Perf Planned'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Real Time Planned'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Total Coupled'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Hot Coupled'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Warm Coupled'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Cold Coupled'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Perf Coupled'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Coupling Filters'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'L4C Phase'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Real Time Coupled'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Qualification Settings'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Qualification Settings Limit'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Real Time ID_List'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Real Time Meta Campaign ID'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Category'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Country'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Country Code'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Business Driver'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Landing Page'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Confluence Mandatory Field List'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Campi AIRtable'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Confluence Check'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Contact Configuration'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Night Production Settings'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Delete Needed'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Created Time'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Trigger Update Time'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Last Processing Start Time'} }}</td>
                        <td class="px-4 py-2">{{ $row->{'Last Processing End Time'} }}</td>

                    </tr>
                @empty
                    <tr>
                        <td colspan="50" class="px-4 py-4 text-center text-gray-500">
                            No results found
                        </td>
                    </tr>
                @endforelse

            </tbody>

        </table>
    </div>
