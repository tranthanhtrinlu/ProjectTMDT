document.addEventListener('DOMContentLoaded', function () {
    // Initialize Flatpickr for date pickers
    flatpickr("#startDate", {
        dateFormat: "Y-m-d",
        defaultDate: new Date().toISOString().split('T')[0]
    });
    flatpickr("#endDate", {
        dateFormat: "Y-m-d",
        defaultDate: new Date().toISOString().split('T')[0]
    });

    let revenueChartInstance = null;
    let categoryChartInstance = null;

    // Revenue Chart Form Submission
    document.getElementById('revenueChartForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const rangeType = document.getElementById('rangeType').value;
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;

        loadRevenueChart(rangeType, startDate, endDate);
    });

    // Category Chart Form Submission
    document.getElementById('categoryChartForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const year = document.getElementById('year').value;
        const month = document.getElementById('month').value;

        loadCategoryChart(year, month);
    });

    function loadRevenueChart(rangeType, startDate, endDate) {
        fetch(`/api/revenue-stats?rangeType=${rangeType}&startDate=${startDate}&endDate=${endDate}`, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('revenueChart').getContext('2d');
                if (revenueChartInstance) {
                    revenueChartInstance.destroy();
                }
                revenueChartInstance = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: data.labels,
                        datasets: [{
                            label: 'Doanh thu (VND)',
                            data: data.data,
                            backgroundColor: 'rgba(54, 162, 235, 0.6)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 2,
                            borderRadius: 4,
                            borderSkipped: false,
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            title: {
                                display: true,
                                text: 'Biểu đồ Doanh thu theo Thời gian',
                                font: {
                                    size: 16,
                                    weight: 'bold'
                                }
                            },
                            legend: {
                                display: true,
                                position: 'top'
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function(value) {
                                        return new Intl.NumberFormat('vi-VN', {
                                            style: 'currency',
                                            currency: 'VND'
                                        }).format(value);
                                    }
                                },
                                grid: {
                                    display: true,
                                    color: 'rgba(0, 0, 0, 0.1)'
                                }
                            },
                            x: {
                                grid: {
                                    display: false
                                },
                                ticks: {
                                    maxRotation: 45,
                                    minRotation: 45
                                }
                            }
                        },
                        elements: {
                            bar: {
                                borderWidth: 2,
                            }
                        },
                        layout: {
                            padding: {
                                left: 10,
                                right: 10,
                                top: 10,
                                bottom: 10
                            }
                        }
                    }
                });
            })
            .catch(error => {
                console.error('Error loading revenue chart:', error);
                alert('Không thể tải dữ liệu biểu đồ doanh thu.');
            });
    }

    function loadCategoryChart(year, month) {
        fetch(`/api/category-revenue?year=${year}&month=${month}`, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('categoryChart').getContext('2d');
                if (categoryChartInstance) {
                    categoryChartInstance.destroy();
                }
                categoryChartInstance = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: data.labels,
                        datasets: [{
                            label: 'Doanh thu theo danh mục',
                            data: data.data,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.8)',
                                'rgba(54, 162, 235, 0.8)',
                                'rgba(255, 206, 86, 0.8)',
                                'rgba(75, 192, 192, 0.8)',
                                'rgba(153, 102, 255, 0.8)',
                                'rgba(255, 159, 64, 0.8)',
                                'rgba(199, 199, 199, 0.8)',
                                'rgba(83, 102, 255, 0.8)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(199, 199, 199, 1)',
                                'rgba(83, 102, 255, 1)'
                            ],
                            borderWidth: 2
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            title: {
                                display: true,
                                text: 'Doanh thu theo Danh mục Sản phẩm',
                                font: {
                                    size: 16,
                                    weight: 'bold'
                                }
                            },
                            legend: {
                                display: true,
                                position: 'right',
                                labels: {
                                    padding: 20,
                                    usePointStyle: true
                                }
                            },
                            tooltip: {
                                callbacks: {
                                    label: function(context) {
                                        const label = context.label || '';
                                        const value = context.parsed;
                                        const total = context.dataset.data.reduce((sum, val) => sum + val, 0);
                                        const percentage = ((value / total) * 100).toFixed(1);
                                        
                                        console.log('Tooltip data:', {
                                            label: label,
                                            value: value,
                                            total: total,
                                            percentage: percentage
                                        });
                                        
                                        // Simple and reliable Vietnamese currency format
                                        const formattedValue = value.toLocaleString('vi-VN') + ' ₫';
                                        
                                        console.log('Formatted value:', formattedValue);
                                        
                                        const tooltipText = `${label}: ${formattedValue} (${percentage}%)`;
                                        console.log('Final tooltip:', tooltipText);
                                        
                                        return tooltipText;
                                    },
                                    title: function(context) {
                                        return 'Doanh thu theo danh mục';
                                    }
                                },
                                displayColors: true,
                                backgroundColor: 'rgba(0, 0, 0, 0.8)',
                                titleColor: '#ffffff',
                                bodyColor: '#ffffff',
                                borderColor: 'rgba(255, 255, 255, 0.2)',
                                borderWidth: 1
                            }
                        },
                        layout: {
                            padding: {
                                left: 10,
                                right: 10,
                                top: 10,
                                bottom: 10
                            }
                        }
                    }
                });
            })
            .catch(error => {
                console.error('Error loading category chart:', error);
                alert('Không thể tải dữ liệu biểu đồ danh mục.');
            });
    }
});