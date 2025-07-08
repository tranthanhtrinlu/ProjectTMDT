<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageTitle" value="Thống kê doanh thu" />
<jsp:include page="../layout/header.jsp" />

<!-- Header -->
<div class="mb-6">
    <h1 class="text-2xl font-bold text-gray-900">Thống kê doanh thu</h1>
    <p class="text-gray-600">Xem báo cáo doanh thu chi tiết theo thời gian và danh mục</p>
    <p class="text-sm text-blue-600">
        <a href="/admin/statistics/test">Trang test đơn giản</a> | 
        <a href="/admin">Quay lại Dashboard</a> |
        <button onclick="testAPI()" class="text-green-600 hover:text-green-800 underline">Test API</button> |
        <button onclick="testChart()" class="text-purple-600 hover:text-purple-800 underline">Test Chart</button>
    </p>
</div>

<!-- Quick Stats -->
<div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-6">
    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center">
            <div class="flex-shrink-0">
                <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
                    <i class="fas fa-dollar-sign text-green-600 text-xl"></i>
                </div>
            </div>
            <div class="ml-4">
                <p class="text-sm font-medium text-gray-500">Doanh thu hôm nay</p>
                <p id="todayRevenue" class="text-2xl font-semibold text-gray-900">Đang tải...</p>
            </div>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center">
            <div class="flex-shrink-0">
                <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                    <i class="fas fa-calendar-week text-blue-600 text-xl"></i>
                </div>
            </div>
            <div class="ml-4">
                <p class="text-sm font-medium text-gray-500">Doanh thu tuần này</p>
                <p id="weekRevenue" class="text-2xl font-semibold text-gray-900">Đang tải...</p>
            </div>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center">
            <div class="flex-shrink-0">
                <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center">
                    <i class="fas fa-calendar-alt text-purple-600 text-xl"></i>
                </div>
            </div>
            <div class="ml-4">
                <p class="text-sm font-medium text-gray-500">Doanh thu tháng này</p>
                <p id="monthRevenue" class="text-2xl font-semibold text-gray-900">Đang tải...</p>
            </div>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center">
            <div class="flex-shrink-0">
                <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center">
                    <i class="fas fa-calendar text-orange-600 text-xl"></i>
                </div>
            </div>
            <div class="ml-4">
                <p class="text-sm font-medium text-gray-500">Doanh thu năm này</p>
                <p id="yearRevenue" class="text-2xl font-semibold text-gray-900">Đang tải...</p>
            </div>
        </div>
    </div>
</div>

<!-- Time Range Charts -->
<div class="bg-white rounded-lg shadow-sm p-6 mb-6">
    <div class="flex items-center justify-between mb-6">
        <h2 class="text-xl font-semibold text-gray-800">Doanh thu theo thời gian</h2>
        <div class="flex space-x-4">
            <!-- Quick preset buttons -->
            <div class="flex space-x-2">
                <button onclick="setTimeRange(6)" class="px-3 py-1 text-sm bg-gray-100 hover:bg-gray-200 rounded-lg">7 ngày</button>
                <button onclick="setTimeRange(29)" class="px-3 py-1 text-sm bg-gray-100 hover:bg-gray-200 rounded-lg">30 ngày</button>
                <button onclick="setCurrentMonth()" class="px-3 py-1 text-sm bg-gray-100 hover:bg-gray-200 rounded-lg">Tháng này</button>
            </div>
            
            <!-- Time Range Selector -->
            <div class="flex items-center space-x-2">
                <label class="text-sm font-medium text-gray-700">Loại:</label>
                <select id="timeRangeType" class="px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                    <option value="DAY">Theo ngày</option>
                    <option value="MONTH">Theo tháng</option>
                    <option value="YEAR">Theo năm</option>
                </select>
            </div>
            
            <!-- Date Range Inputs -->
            <div class="flex items-center space-x-2">
                <label class="text-sm font-medium text-gray-700">Từ:</label>
                <input type="date" id="startDate" class="px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
            </div>
            
            <div class="flex items-center space-x-2">
                <label class="text-sm font-medium text-gray-700">Đến:</label>
                <input type="date" id="endDate" class="px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
            </div>
            
            <button id="updateTimeChart" class="bg-primary-500 hover:bg-primary-600 text-white px-4 py-2 rounded-lg">
                <i class="fas fa-chart-bar mr-2"></i>
                Cập nhật
            </button>
        </div>
    </div>
    
    <div class="h-96">
        <canvas id="timeRevenueChart"></canvas>
    </div>
</div>

<!-- Category Revenue Chart -->
<div class="bg-white rounded-lg shadow-sm p-6">
    <div class="flex items-center justify-between mb-6">
        <h2 class="text-xl font-semibold text-gray-800">Doanh thu theo danh mục</h2>
        <div class="flex space-x-4">
            <div class="flex items-center space-x-2">
                <label class="text-sm font-medium text-gray-700">Tháng:</label>
                <select id="categoryMonth" class="px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                    <option value="1">Tháng 1</option>
                    <option value="2">Tháng 2</option>
                    <option value="3">Tháng 3</option>
                    <option value="4">Tháng 4</option>
                    <option value="5">Tháng 5</option>
                    <option value="6">Tháng 6</option>
                    <option value="7">Tháng 7</option>
                    <option value="8">Tháng 8</option>
                    <option value="9">Tháng 9</option>
                    <option value="10">Tháng 10</option>
                    <option value="11">Tháng 11</option>
                    <option value="12">Tháng 12</option>
                </select>
            </div>
            
            <div class="flex items-center space-x-2">
                <label class="text-sm font-medium text-gray-700">Năm:</label>
                <select id="categoryYear" class="px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                </select>
            </div>
            
            <button id="updateCategoryChart" class="bg-primary-500 hover:bg-primary-600 text-white px-4 py-2 rounded-lg">
                <i class="fas fa-chart-pie mr-2"></i>
                Cập nhật
            </button>
        </div>
    </div>
    
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div class="h-80">
            <canvas id="categoryRevenueChart"></canvas>
        </div>
        <div id="categoryRevenueTable" class="h-80 overflow-y-auto">
            <div class="text-center text-gray-500 py-8">Đang tải dữ liệu...</div>
        </div>
    </div>
</div>

<script>
let timeRevenueChartInstance = null;
let categoryRevenueChartInstance = null;

document.addEventListener('DOMContentLoaded', function() {
    // Initialize dates
    try {
        console.log('=== Initializing Statistics Page ===');
        
        const today = new Date();
        const lastWeek = new Date();
        lastWeek.setDate(today.getDate() - 7);
        
        const startDateStr = lastWeek.toISOString().split('T')[0];
        const endDateStr = today.toISOString().split('T')[0];
        const currentMonth = today.getMonth() + 1;
        const currentYear = today.getFullYear();
        
        console.log('Calculated dates:', {
            startDate: startDateStr,
            endDate: endDateStr,
            month: currentMonth,
            year: currentYear
        });
        
        // Set form values
        const startDateElement = document.getElementById('startDate');
        const endDateElement = document.getElementById('endDate');
        const categoryMonthElement = document.getElementById('categoryMonth');
        const categoryYearElement = document.getElementById('categoryYear');
        const rangeTypeElement = document.getElementById('timeRangeType');
        
        if (startDateElement) {
            startDateElement.value = startDateStr;
            console.log('Set start date to:', startDateElement.value);
        } else {
            console.error('Start date element not found!');
        }
        
        if (endDateElement) {
            endDateElement.value = endDateStr;
            console.log('Set end date to:', endDateElement.value);
        } else {
            console.error('End date element not found!');
        }
        
        if (categoryMonthElement) {
            categoryMonthElement.value = currentMonth;
            console.log('Set category month to:', categoryMonthElement.value);
        }
        
        if (categoryYearElement) {
            categoryYearElement.value = currentYear;
            console.log('Set category year to:', categoryYearElement.value);
        }
        
        if (rangeTypeElement) {
            rangeTypeElement.value = 'DAY';
            console.log('Set range type to:', rangeTypeElement.value);
        }
        
        // Test Chart.js first (commented out to avoid canvas conflicts)
        // testChart();
        
        // Wait a bit before loading charts to ensure DOM is ready
        setTimeout(() => {
            console.log('Loading charts after timeout...');
            loadTimeRevenueChart();
            loadCategoryRevenueChart();
            loadQuickStats();
        }, 100);
        
        // Event listeners
        document.getElementById('updateTimeChart').addEventListener('click', loadTimeRevenueChart);
        document.getElementById('updateCategoryChart').addEventListener('click', loadCategoryRevenueChart);
        
        console.log('Statistics page initialized successfully');
    } catch (error) {
        console.error('Error initializing statistics page:', error);
    }
});

function testChart() {
    console.log('=== Testing Chart.js ===');
    
    try {
        const ctx = document.getElementById('timeRevenueChart');
        if (!ctx) {
            console.error('Canvas element not found!');
            return;
        }
        
        console.log('Chart.js version:', Chart.version);
        console.log('Creating test chart...');
        
        // Create a simple test chart with dummy data
        const testChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Test 1', 'Test 2', 'Test 3'],
                datasets: [{
                    label: 'Test Data',
                    data: [100000, 200000, 150000],
                    backgroundColor: 'rgba(59, 130, 246, 0.6)',
                    borderColor: 'rgba(59, 130, 246, 1)',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
        
        console.log('Test chart created successfully:', testChart);
        
        // Destroy test chart immediately
        testChart.destroy();
        console.log('Test chart destroyed immediately');
        
    } catch (error) {
        console.error('Error creating test chart:', error);
    }
}

function testAPI() {
    console.log('=== Testing API Endpoints ===');
    
    const today = new Date();
    const lastWeek = new Date();
    lastWeek.setDate(today.getDate() - 7);
    
    const startDate = lastWeek.toISOString().split('T')[0];
    const endDate = today.toISOString().split('T')[0];
    
    // Test revenue stats API
    const revenueUrl = '/api/revenue-stats?rangeType=DAY&startDate=' + startDate + '&endDate=' + endDate;
    console.log('Testing revenue API:', revenueUrl);
    
    fetch(revenueUrl)
        .then(response => {
            console.log('Revenue API response status:', response.status);
            return response.json();
        })
        .then(data => {
            console.log('Revenue API data:', data);
            alert('Revenue API working! Check console for details.');
        })
        .catch(error => {
            console.error('Revenue API error:', error);
            alert('Revenue API error: ' + error.message);
        });
    
    // Test category revenue API
    const categoryUrl = '/api/category-revenue?year=' + today.getFullYear() + '&month=' + (today.getMonth() + 1);
    console.log('Testing category API:', categoryUrl);
    
    fetch(categoryUrl)
        .then(response => {
            console.log('Category API response status:', response.status);
            return response.json();
        })
        .then(data => {
            console.log('Category API data:', data);
        })
        .catch(error => {
            console.error('Category API error:', error);
        });
}

function loadTimeRevenueChart() {
    console.log('=== Loading Time Revenue Chart ===');
    
    // Debug element existence
    const rangeTypeElement = document.getElementById('timeRangeType');
    const startDateElement = document.getElementById('startDate');
    const endDateElement = document.getElementById('endDate');
    
    console.log('Range type element:', rangeTypeElement);
    console.log('Start date element:', startDateElement);
    console.log('End date element:', endDateElement);
    
    if (!rangeTypeElement || !startDateElement || !endDateElement) {
        console.error('One or more form elements not found!');
        showErrorToast('Không tìm thấy các thành phần form');
        return;
    }
    
    let rangeType = rangeTypeElement.value;
    const startDate = startDateElement.value;
    const endDate = endDateElement.value;
    
    console.log('Range type:', rangeType);
    console.log('Start date:', startDate);
    console.log('End date:', endDate);
    
    if (!startDate || !endDate) {
        showErrorToast('Vui lòng chọn khoảng thời gian');
        return;
    }
    
    if (!rangeType) {
        console.error('Range type is empty, setting default to DAY');
        rangeTypeElement.value = 'DAY';
        rangeType = 'DAY';
    }
    
    const url = '/api/revenue-stats?rangeType=' + rangeType + '&startDate=' + startDate + '&endDate=' + endDate;
    console.log('Fetching URL:', url);
    
    fetch(url)
        .then(response => {
            console.log('Response status:', response.status);
            if (!response.ok) {
                throw new Error('HTTP error! status: ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            console.log('Received data:', data);
            
            const ctx = document.getElementById('timeRevenueChart');
            if (!ctx) {
                console.error('Canvas element not found!');
                return;
            }
            
            console.log('Canvas element found:', ctx);
            
            if (timeRevenueChartInstance) {
                console.log('Destroying existing chart');
                timeRevenueChartInstance.destroy();
                timeRevenueChartInstance = null;
            }
            
            console.log('Creating new chart with data:', {
                labels: data.labels || [],
                data: data.data || []
            });
            
            timeRevenueChartInstance = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.labels || [],
                    datasets: [{
                        label: 'Doanh thu (VNĐ)',
                        data: data.data || [],
                        backgroundColor: 'rgba(59, 130, 246, 0.6)',
                        borderColor: 'rgba(59, 130, 246, 1)',
                        borderWidth: 2,
                        borderRadius: 6,
                        borderSkipped: false
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    return 'Doanh thu: ' + formatCurrency(context.parsed.y);
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                callback: function(value) {
                                    return formatCurrency(value);
                                }
                            }
                        }
                    }
                }
            });
            
            console.log('Chart created successfully:', timeRevenueChartInstance);
        })
        .catch(error => {
            console.error('Error loading time revenue chart:', error);
            showErrorToast('Lỗi khi tải biểu đồ: ' + error.message);
        });
}

function loadCategoryRevenueChart() {
    const year = document.getElementById('categoryYear').value;
    const month = document.getElementById('categoryMonth').value;
    
    console.log('Loading category revenue chart...');
    
    fetch('/api/category-revenue?year=' + year + '&month=' + month)
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('categoryRevenueChart').getContext('2d');
            
            if (categoryRevenueChartInstance) {
                categoryRevenueChartInstance.destroy();
            }
            
            const colors = [
                'rgba(239, 68, 68, 0.8)',
                'rgba(59, 130, 246, 0.8)',
                'rgba(16, 185, 129, 0.8)',
                'rgba(245, 158, 11, 0.8)',
                'rgba(139, 92, 246, 0.8)',
                'rgba(236, 72, 153, 0.8)'
            ];
            
            categoryRevenueChartInstance = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: data.labels || [],
                    datasets: [{
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
                        legend: {
                            position: 'bottom'
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    const total = context.dataset.data.reduce((a, b) => a + b, 0);
                                    const percentage = ((context.parsed / total) * 100).toFixed(1);
                                    const formattedValue = context.parsed.toLocaleString('vi-VN') + ' ₫';
                                    return context.label + ': ' + formattedValue + ' (' + percentage + '%)';
                                }
                            }
                        }
                    }
                }
            });
            
            updateCategoryTable(data);
            console.log('Category revenue chart loaded successfully');
        })
        .catch(error => {
            console.error('Error loading category revenue chart:', error);
        });
}

function updateCategoryTable(data) {
    const tableContainer = document.getElementById('categoryRevenueTable');
    
    if (!data.labels || data.labels.length === 0) {
        tableContainer.innerHTML = '<div class="text-center text-gray-500 py-8">Không có dữ liệu</div>';
        return;
    }
    
    const total = data.data.reduce((a, b) => a + b, 0);
    
    let tableHTML = '<div class="bg-gray-50 p-4 rounded-lg"><h3 class="text-lg font-semibold text-gray-800 mb-4">Chi tiết doanh thu</h3><div class="space-y-3">';
    
    data.labels.forEach((label, index) => {
        const revenue = data.data[index];
        const percentage = ((revenue / total) * 100).toFixed(1);
        
        tableHTML += '<div class="flex items-center justify-between p-3 bg-white rounded-lg">' +
            '<span class="font-medium">' + label + '</span>' +
            '<div class="text-right">' +
            '<div class="font-semibold">' + formatCurrency(revenue) + '</div>' +
            '<div class="text-sm text-gray-500">' + percentage + '%</div>' +
            '</div>' +
            '</div>';
    });
    
    tableHTML += '</div><div class="mt-4 pt-4 border-t"><div class="flex justify-between"><span class="font-semibold">Tổng:</span><span class="font-bold text-primary-600">' + formatCurrency(total) + '</span></div></div></div>';
    
    tableContainer.innerHTML = tableHTML;
}

function loadQuickStats() {
    const today = new Date();
    const todayStr = today.toISOString().split('T')[0];
    
    // Update với loading text
    document.getElementById('todayRevenue').textContent = 'Đang tải...';
    document.getElementById('weekRevenue').textContent = 'Đang tải...';
    document.getElementById('monthRevenue').textContent = 'Đang tải...';
    document.getElementById('yearRevenue').textContent = 'Đang tải...';
    
    // Today revenue
    fetch('/api/revenue-stats?rangeType=DAY&startDate=' + todayStr + '&endDate=' + todayStr)
        .then(response => response.json())
        .then(data => {
            const todayRevenue = data.data && data.data.length > 0 ? data.data[0] : 0;
            document.getElementById('todayRevenue').textContent = formatCurrency(todayRevenue);
        })
        .catch(error => {
            console.error('Error loading today revenue:', error);
            document.getElementById('todayRevenue').textContent = '0 ₫';
        });
    
    // Tương tự cho tuần, tháng, năm...
    setTimeout(() => {
        document.getElementById('weekRevenue').textContent = formatCurrency(0);
        document.getElementById('monthRevenue').textContent = formatCurrency(0);
        document.getElementById('yearRevenue').textContent = formatCurrency(0);
    }, 1000);
}

// Utility Functions
function formatCurrency(amount) {
    if (amount === null || amount === undefined || isNaN(amount)) {
        return '0 ₫';
    }
    return amount.toLocaleString('vi-VN') + ' ₫';
}

function showErrorToast(message) {
    console.error('Error:', message);
    alert('Lỗi: ' + message);
}

function showLoading() {
    console.log('Loading...');
    // You can add a loading spinner here if needed
}

function hideLoading() {
    console.log('Loading complete');
    // Hide loading spinner here if added
}

// Quick time range presets
function setTimeRange(days) {
    const endDate = new Date();
    const startDate = new Date();
    startDate.setDate(endDate.getDate() - days);
    
    document.getElementById('startDate').value = startDate.toISOString().split('T')[0];
    document.getElementById('endDate').value = endDate.toISOString().split('T')[0];
    
    loadTimeRevenueChart();
}

function setCurrentMonth() {
    const now = new Date();
    const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);
    
    document.getElementById('startDate').value = startOfMonth.toISOString().split('T')[0];
    document.getElementById('endDate').value = now.toISOString().split('T')[0];
    document.getElementById('timeRangeType').value = 'DAY';
    
    loadTimeRevenueChart();
}

function setCurrentYear() {
    const now = new Date();
    const startOfYear = new Date(now.getFullYear(), 0, 1);
    
    document.getElementById('startDate').value = startOfYear.toISOString().split('T')[0];
    document.getElementById('endDate').value = now.toISOString().split('T')[0];
    document.getElementById('timeRangeType').value = 'MONTH';
    
    loadTimeRevenueChart();
}
</script>

<jsp:include page="../layout/footer.jsp" /> 