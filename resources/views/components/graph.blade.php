<div class="bg-neutral-secondary-medium border border-light-medium p-3 rounded-lg">
    <div class="grid grid-cols-3 gap-3 mb-3">


        <dl
            class="group rounded-lg bg-red-100 hover:bg-[#de5d5d] border border-success-subtle rounded-base 
           flex flex-col items-center justify-center h-[78px] transition-colors duration-200">

            <dt id="top1-count"
                class="w-8 h-8 rounded-lg text-fg-success-strong text-sm font-semibold 
               flex items-center justify-center mb-1 
               group-hover:text-white transition-colors duration-200">
                
            </dt>

            <dd id="top1-label"
                class="text-fg-success-strong text-sm font-semibold 
               group-hover:text-white transition-colors duration-200">
                
            </dd>
        </dl>

        <dl
            class="group rounded-lg bg-blue-100 hover:bg-[#5d75de] border border-success-subtle rounded-base 
           flex flex-col items-center justify-center h-[78px] transition-colors duration-200">

            <dt id="top2-count"
                class="w-8 h-8 rounded-lg text-fg-success-strong text-sm font-semibold 
               flex items-center justify-center mb-1 
               group-hover:text-white transition-colors duration-200">
                
            </dt>

            <dd id="top2-label"
                class="text-fg-success-strong text-sm font-semibold 
               group-hover:text-white transition-colors duration-200">
                
            </dd>
        </dl>
        <dl
            class="group rounded-lg bg-green-100 hover:bg-[#5ddea0] border border-success-subtle rounded-base 
           flex flex-col items-center justify-center h-[78px] transition-colors duration-200">

            <dt id="top3-count"
                class="w-8 h-8 rounded-lg text-fg-success-strong text-sm font-semibold 
               flex items-center justify-center mb-1 
               group-hover:text-white transition-colors duration-200">
                
            </dt>

            <dd id="top3-label"
                class="text-fg-success-strong text-sm font-semibold 
               group-hover:text-white transition-colors duration-200">
                
            </dd>
        </dl>
    </div>
</div>

<!-- Radial Chart -->
<div class="py-6" id="radial-chart"></div>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script>
    let chart = null;

    function chartOptions(series, labels) {
        return {
            series,
            labels,
            colors: ["#de5d5d", "#5d75de", "#5ddea0"],
            chart: {
                height: 350,
                width: "100%",
                type: "radialBar",
                sparkline: {
                    enabled: true
                }
            },
            plotOptions: {
                radialBar: {
                    track: {
                        background: "#E5E7EB"
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
            legend: {
                show: true,
                position: "bottom",
                fontFamily: "Inter, sans-serif"
            },
            tooltip: {
                enabled: true,
                y: {
                    formatter: (v) => v + "%"
                }
            }
        };
    }

    function setText(id, val) {
        const el = document.getElementById(id);
        if (el) el.textContent = val;
    }

    async function loadTopActions(days = 7) {
        const res = await fetch(`{{ route('dashboard.top-actions') }}?days=${days}`, {
            headers: {
                'Accept': 'application/json'
            }
        });
        const data = await res.json();

        const labels = data.labels || ["No data", "No data", "No data"];
        const series = data.series || [0, 0, 0];
        const clicks = data.clicks || [0, 0, 0];

        setText('top1-count', clicks[0] ?? 0);
        setText('top1-label', labels[0] ?? 'No data');

        setText('top2-count', clicks[1] ?? 0);
        setText('top2-label', labels[1] ?? 'No data');

        setText('top3-count', clicks[2] ?? 0);
        setText('top3-label', labels[2] ?? 'No data');

        if (!chart) {
            chart = new ApexCharts(document.querySelector("#radial-chart"), chartOptions(series, labels));
            chart.render();
        } else {
            chart.updateOptions({
                labels
            });
            chart.updateSeries(series);
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        loadTopActions(7);
    });
</script>
