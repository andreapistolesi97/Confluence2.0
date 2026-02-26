<x-layout>
    <div class="min-h-screen bg-gray-50 py-12 px-6">
        <div class="max-w-5xl mx-auto bg-white border border-gray-200 rounded-lg shadow-sm p-10">

            <h1 class="text-3xl font-bold mb-6">Formatting Documentation</h1>

            <p class="mb-6 text-gray-700">
                In Lists4Charon on the Offers table in the
                <strong>Contact Configuration</strong> field use the following
                formatting and generation rules using the following structure:
            </p>

            <div class="bg-gray-100 rounded-md p-4 font-mono text-sm mb-8">
                { <br>
                "date-of-birth": "DD/MM/YYYY", <br>
                "plate": "car", <br>
                "phone": "add_0", <br>
                "address": "be-nl" <br>
                }
            </div>

            <h2 class="text-2xl font-semibold mb-4">FORMAT ONLY</h2>

            <div class="space-y-6">

                <div>
                    <h3 class="font-semibold mb-2">MANDATORY SETTINGS</h3>
                    <ul class="list-disc pl-6 space-y-1">
                        <li>date-of-birth: "DD/MM/YYYY","DD-MM-YYYY","D-M-YYYY","MM-D-YYYY","DDMMYYYY"</li>
                        <li>gender: "M:3!F:5"</li>
                    </ul>
                </div>

                <div>
                    <h3 class="font-semibold mb-2">OPTIONAL SETTINGS</h3>
                    <ul class="list-disc pl-6 space-y-1">
                        <li>phone: "add_0","remove_0"</li>
                    </ul>
                </div>

            </div>

            <h2 class="text-2xl font-semibold mt-10 mb-4">GENERATION</h2>

            <div class="space-y-6">

                <div>
                    <h3 class="font-semibold mb-2">MANDATORY SETTINGS</h3>
                    <ul class="list-disc pl-6 space-y-1">
                        <li>plate: "car","bike"</li>
                        <li>date-of-birth: "DD/MM/YYYY","DD-MM-YYYY","D-M-YYYY","MM-D-YYYY","DDMMYYYY"</li>
                    </ul>
                </div>

                <div>
                    <h3 class="font-semibold mb-2">OPTIONAL SETTINGS</h3>
                    <ul class="list-disc pl-6 space-y-1">
                        <li>
                            address,civic-number,zip-code,city:
                            "it","es","pl","pt","be-nl","be-fr","de","fr","nl","us","au","ch","gb"
                            (defaults to contact list country)
                        </li>
                        <li>
                            password:
                            {"special":"yes","numbers":"yes"},
                            {"special":"no","numbers":"yes"}
                            (defaults to everything yes)
                        </li>
                    </ul>
                </div>

                <div>
                    <h3 class="font-semibold mb-2">NO SETTINGS</h3>
                    <div class="grid grid-cols-2 md:grid-cols-3 gap-2 text-sm">
                        <span>codice-fiscale</span>
                        <span>date-of-birth1-8</span>
                        <span>phone1-10</span>
                        <span>zip-code1-5</span>
                        <span>province-abbreviation</span>
                        <span>birthplace</span>
                    </div>
                </div>

            </div>

            <h2 class="text-2xl font-semibold mt-10 mb-4">OFFER SHOOTS</h2>

            <div class="space-y-4">
                <div>
                    <h3 class="font-semibold mb-2">RULES</h3>
                    <ul class="list-disc pl-6 space-y-1">
                        <li>ALWAYS USE THE SAME CONFIGURATION FOR AN OFFER</li>
                        <li>A MAXIMUM OF 10 SHOOTS (10 LINES) CAN BE PLACED</li>
                    </ul>
                </div>

                <div>
                    <h3 class="font-semibold mb-2">CONFIGURATION</h3>
                    <ul class="list-disc pl-6 space-y-1">
                        <li>Simple configuration: "dd_hh&gt;amount" or "mm/dd_hh&gt;amount"</li>
                        <li>Multiple configuration between months using line breaks</li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</x-layout>
