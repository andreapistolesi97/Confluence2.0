<div class="bg-neutral-secondary-medium border border-light-medium p-3 rounded-lg">
    <div class="grid grid-cols-3 gap-3 mb-3">


        <dl
            class="group rounded-lg bg-red-100 hover:bg-[#de5d5d] border border-success-subtle rounded-base 
           flex flex-col items-center justify-center h-[78px] transition-colors duration-200">

            <dt
                class="w-8 h-8 rounded-lg text-fg-success-strong text-sm font-semibold 
               flex items-center justify-center mb-1 
               group-hover:text-white transition-colors duration-200">
                12
            </dt>

            <dd
                class="text-fg-success-strong text-sm font-semibold 
               group-hover:text-white transition-colors duration-200">
                To Do
            </dd>
        </dl>

        <dl
            class="group rounded-lg bg-blue-100 hover:bg-[#5d75de] border border-success-subtle rounded-base 
           flex flex-col items-center justify-center h-[78px] transition-colors duration-200">

            <dt
                class="w-8 h-8 rounded-lg text-fg-success-strong text-sm font-semibold 
               flex items-center justify-center mb-1 
               group-hover:text-white transition-colors duration-200">
                23
            </dt>

            <dd
                class="text-fg-success-strong text-sm font-semibold 
               group-hover:text-white transition-colors duration-200">
                In Progress
            </dd>
        </dl>
        <dl
            class="group rounded-lg bg-green-100 hover:bg-[#5ddea0] border border-success-subtle rounded-base 
           flex flex-col items-center justify-center h-[78px] transition-colors duration-200">

            <dt
                class="w-8 h-8 rounded-lg text-fg-success-strong text-sm font-semibold 
               flex items-center justify-center mb-1 
               group-hover:text-white transition-colors duration-200">
                64
            </dt>

            <dd
                class="text-fg-success-strong text-sm font-semibold 
               group-hover:text-white transition-colors duration-200">
                Done
            </dd>
        </dl>
    </div>
</div>

<!-- Radial Chart -->
<div class="py-6" id="radial-chart"></div>

<div class="grid grid-cols-1 items-center border-light border-t justify-between">
    <div class="flex justify-between items-center pt-4 md:pt-6">
        <!-- Button -->
        <button id="dropdownLastDays6Button" data-dropdown-toggle="LastDays6dropdown" data-dropdown-placement="bottom"
            class="text-sm font-medium text-body hover:text-heading text-center inline-flex items-center"
            type="button">
            Last 7 days
            <svg class="w-4 h-4 ms-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24"
                height="24" fill="none" viewBox="0 0 24 24">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="m19 9-7 7-7-7" />
            </svg>
        </button>
        <!-- Dropdown menu -->
        <div id="LastDays6dropdown" class="z-10 hidden bg-white border border-default-medium rounded-lg shadow-lg w-44">
            <ul class="p-2 text-sm text-body font-medium" aria-labelledby="dropdownLastDays6Button">
                <li>
                    <a href="#"
                        class="inline-flex items-center w-full p-2 hover:bg-gray-200 rounded">Yesterday</a>
                </li>
                <li>
                    <a href="#" class="inline-flex items-center w-full p-2 hover:bg-gray-200 rounded">Today</a>
                </li>
                <li>
                    <a href="#" class="inline-flex items-center w-full p-2 hover:bg-gray-200  rounded">Last
                        7 days</a>
                </li>
                <li>
                    <a href="#" class="inline-flex items-center w-full p-2 hover:bg-gray-200 rounded">Last
                        30 days</a>
                </li>
                <li>
                    <a href="#" class="inline-flex items-center w-full p-2 hover:bg-gray-200 rounded">Last
                        90 days</a>
                </li>
            </ul>
        </div>
        <a href="#"
            class="inline-flex items-center text-fg-brand bg-transparent box-border border border-transparent hover:bg-neutral-secondary-medium focus:ring-4 focus:ring-neutral-tertiary font-medium leading-5 rounded-base text-sm px-3 py-2 focus:outline-none">
            Progress report
            <svg class="w-4 h-4 ms-1.5 -me-0.5 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                width="24" height="24" fill="none" viewBox="0 0 24 24">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M19 12H5m14 0-4 4m4-4-4-4" />
            </svg>
        </a>
    </div>
</div>
</div>
<script>
    // Get the CSS variable --color-brand and convert it to hex for ApexCharts
    const getBrandColor = () => {
        // Get the computed style of the document's root element
        const computedStyle = getComputedStyle(document.documentElement);

        // Get the value of the --color-brand CSS variable
        return computedStyle.getPropertyValue('--color-fg-brand').trim() || "#1447E6";
    };

    const getWarningColor = () => {
        const computedStyle = getComputedStyle(document.documentElement);
        return computedStyle.getPropertyValue('--color-warning').trim() || "#1447E6";
    };

    const getSuccessColor = () => {
        const computedStyle = getComputedStyle(document.documentElement);
        return computedStyle.getPropertyValue('--color-success').trim() || "#1447E6";
    };
    const getNeutralSecondaryMediumColor = () => {
        const computedStyle = getComputedStyle(document.documentElement);
        return computedStyle.getPropertyValue('--color-neutral-secondary-medium').trim() || "#1447E6";
    };


    const brandColor = getBrandColor();
    const warningColor = getWarningColor();
    const successColor = getSuccessColor();
    const neutralSecondaryMediumColor = getNeutralSecondaryMediumColor();

    const getChartOptions = () => {
        return {
            series: [90, 85, 70],
            colors: ["#de5d5d", "#5d75de", "#5ddea0"], //

            chart: {
                height: "350px",
                width: "100%",
                type: "radialBar",
                sparkline: {
                    enabled: true
                },
            },

            plotOptions: {
                radialBar: {
                    track: {
                        background: "#E5E7EB",
                    },
                    dataLabels: {
                        show: false
                    },
                    hollow: {
                        margin: 0,
                        size: "32%"
                    }
                }
            },

            grid: {
                show: false
            },

            labels: ["To do", "In progress", "Done"],

            legend: {
                show: true,
                position: "bottom",
                fontFamily: "Inter, sans-serif"
            },

            tooltip: {
                enabled: true,
                y: {
                    formatter: (value) => value + "%"
                }
            }
        };
    };

    if (document.getElementById("radial-chart") && typeof ApexCharts !== "undefined") {
        const chart = new ApexCharts(document.querySelector("#radial-chart"), getChartOptions());
        chart.render();
    }
</script>
