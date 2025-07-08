<<<<<<< Updated upstream
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="KeyBoardShop" />
            <meta name="author" content="Nông Lâm KeyBoard" />
            <title>Dashboard - Nong Lam</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Dashboard</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Thống kê</li>
                            </ol>
                            <div class="row">
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-primary text-white mb-4">
                                        <div class="card-body">Số lượng User (${countUsers})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/user">View
                                                Details</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-danger text-white mb-4">
                                        <div class="card-body">Số lượng Product (${countProducts})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/product">View
                                                Details</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-success text-white mb-4">
                                        <div class="card-body">Số lượng Order (${countOrders})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/order">View
                                                Details</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="js/chart-area-demo.js"></script>
            <script src="js/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>
        </body>

        </html>
=======
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageTitle" value="Dashboard" />
<jsp:include page="../layout/header.jsp" />

<!-- Stats Cards -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
    <!-- Users Card -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center">
            <div class="flex-shrink-0">
                <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                    <i class="fas fa-users text-blue-600 text-xl"></i>
                </div>
            </div>
            <div class="ml-4">
                <p class="text-sm font-medium text-gray-500">Tổng người dùng</p>
                <p class="text-2xl font-semibold text-gray-900">${countUsers}</p>
            </div>
        </div>
    </div>

    <!-- Products Card -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center">
            <div class="flex-shrink-0">
                <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
                    <i class="fas fa-box text-green-600 text-xl"></i>
                </div>
            </div>
            <div class="ml-4">
                <p class="text-sm font-medium text-gray-500">Tổng sản phẩm</p>
                <p class="text-2xl font-semibold text-gray-900">${countProducts}</p>
            </div>
        </div>
    </div>

    <!-- Orders Card -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center">
            <div class="flex-shrink-0">
                <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center">
                    <i class="fas fa-shopping-cart text-purple-600 text-xl"></i>
                </div>
            </div>
            <div class="ml-4">
                <p class="text-sm font-medium text-gray-500">Tổng đơn hàng</p>
                <p class="text-2xl font-semibold text-gray-900">${countOrders}</p>
            </div>
        </div>
    </div>
</div>

<!-- Charts Section -->
<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
    <!-- Revenue Chart -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-lg font-semibold text-gray-800">Doanh thu theo ngày (7 ngày gần nhất)</h3>
            <button id="refreshRevenueChart" class="text-primary-500 hover:text-primary-600">
                <i class="fas fa-sync-alt"></i>
            </button>
        </div>
        <div class="h-64">
            <canvas id="revenueChart"></canvas>
        </div>
    </div>

    <!-- Category Revenue Chart -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-lg font-semibold text-gray-800">Doanh thu theo danh mục (tháng này)</h3>
            <button id="refreshCategoryChart" class="text-primary-500 hover:text-primary-600">
                <i class="fas fa-sync-alt"></i>
            </button>
        </div>
        <div class="h-64">
            <canvas id="categoryChart"></canvas>
        </div>
    </div>
</div>

<!-- Quick Actions -->
<div class="bg-white rounded-lg shadow-sm p-6">
    <h3 class="text-lg font-semibold text-gray-800 mb-4">Thao tác nhanh</h3>
    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
        <a href="/admin/product/create" class="flex flex-col items-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
            <i class="fas fa-plus-circle text-2xl text-green-500 mb-2"></i>
            <span class="text-sm font-medium text-gray-700">Thêm sản phẩm</span>
        </a>
        <a href="/admin/user" class="flex flex-col items-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
            <i class="fas fa-user-plus text-2xl text-blue-500 mb-2"></i>
            <span class="text-sm font-medium text-gray-700">Quản lý user</span>
        </a>
        <a href="/admin/order" class="flex flex-col items-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
            <i class="fas fa-clipboard-list text-2xl text-purple-500 mb-2"></i>
            <span class="text-sm font-medium text-gray-700">Xem đơn hàng</span>
        </a>
        <a href="/admin/statistics" class="flex flex-col items-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
            <i class="fas fa-chart-line text-2xl text-orange-500 mb-2"></i>
            <span class="text-sm font-medium text-gray-700">Thống kê</span>
        </a>
    </div>
</div>

<script>
// Helper function for error notifications
function showErrorToast(message) {
    console.error('Chart Error:', message);
    // Simple alert fallback if no toast library
    alert('Lỗi: ' + message);
}

document.addEventListener('DOMContentLoaded', function() {
    console.log('Dashboard loaded, initializing charts...');
    
    // Initialize revenue chart
    initRevenueChart();
    
    // Initialize category chart
    initCategoryChart();
    
    // Refresh handlers
    document.getElementById('refreshRevenueChart').addEventListener('click', initRevenueChart);
    document.getElementById('refreshCategoryChart').addEventListener('click', initCategoryChart);
});

function initRevenueChart() {
    console.log('Initializing revenue chart...');
    
    const endDate = new Date();
    const startDate = new Date();
    startDate.setDate(startDate.getDate() - 6);
    
    const startDateStr = startDate.toISOString().split('T')[0];
    const endDateStr = endDate.toISOString().split('T')[0];
    
    console.log('Date range:', startDateStr, 'to', endDateStr);
    
    const url = `/api/revenue-stats?rangeType=DAY&startDate=${startDateStr}&endDate=${endDateStr}`;
    console.log('Fetching:', url);
    
    fetch(url)
        .then(response => {
            console.log('Revenue response status:', response.status);
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }
            return response.json();
        })
        .then(data => {
            console.log('Revenue data:', data);
            const ctx = document.getElementById('revenueChart').getContext('2d');
            
            // Destroy existing chart if exists
            if (window.revenueChartInstance) {
                window.revenueChartInstance.destroy();
            }
            
            window.revenueChartInstance = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.labels || [],
                    datasets: [{
                        label: 'Doanh thu (VNĐ)',
                        data: data.data || [],
                        backgroundColor: 'rgba(59, 130, 246, 0.6)',
                        borderColor: 'rgb(59, 130, 246)',
                        borderWidth: 2,
                        borderRadius: 4,
                        borderSkipped: false
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        title: {
                            display: true,
                            text: 'Biểu đồ Doanh thu theo Ngày',
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
                                    return new Intl.NumberFormat('vi-VN').format(value) + ' đ';
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
                            borderWidth: 2
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
            showErrorToast('Không thể tải biểu đồ doanh thu: ' + error.message);
        });
}

function initCategoryChart() {
    console.log('Initializing category chart...');
    
    const now = new Date();
    const year = now.getFullYear();
    const month = now.getMonth() + 1;
    
    console.log('Category params:', {year, month});
    
    const url = `/api/category-revenue?year=${year}&month=${month}`;
    console.log('Fetching:', url);
    
    fetch(url)
        .then(response => {
            console.log('Category response status:', response.status);
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }
            return response.json();
        })
        .then(data => {
            console.log('Category data:', data);
            const ctx = document.getElementById('categoryChart').getContext('2d');
            
            // Destroy existing chart if exists
            if (window.categoryChartInstance) {
                window.categoryChartInstance.destroy();
            }
            
            const colors = [
                'rgba(239, 68, 68, 0.8)',
                'rgba(59, 130, 246, 0.8)',
                'rgba(16, 185, 129, 0.8)',
                'rgba(245, 158, 11, 0.8)',
                'rgba(139, 92, 246, 0.8)',
                'rgba(236, 72, 153, 0.8)'
            ];
            
            window.categoryChartInstance = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: data.labels || [],
                    datasets: [{
                        label: 'Doanh thu theo danh mục',
                        data: data.data || [],
                        backgroundColor: colors,
                        borderWidth: 2,
                        borderColor: '#ffffff'
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
                                    const value = context.parsed;
                                    const label = context.label;
                                    const total = context.dataset.data.reduce((a, b) => a + b, 0);
                                    const percentage = ((value / total) * 100).toFixed(1);
                                    const formatted = value.toLocaleString('vi-VN');
                                    
                                    return label + ': ' + formatted + ' ₫ (' + percentage + '%)';
                                }
                            }
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
            showErrorToast('Không thể tải biểu đồ danh mục: ' + error.message);
        });
}
</script>

<jsp:include page="../layout/footer.jsp" /> 
>>>>>>> Stashed changes
