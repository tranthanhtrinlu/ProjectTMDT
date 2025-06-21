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
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
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
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
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