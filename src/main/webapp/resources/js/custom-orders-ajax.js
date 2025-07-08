$(document).ready(function() {
    let currentPage = 0;
    let pageSize = 5;
    let currentFilters = {
        status: '',
        sort: 'newest',
        search: ''
    };
    
    // Load orders on page load
    loadOrders();
    
    // Event listeners
    $('#statusFilter').on('change', function() {
        currentFilters.status = $(this).val();
        currentPage = 0;
        loadOrders();
    });
    
    $('#sortFilter').on('change', function() {
        currentFilters.sort = $(this).val();
        currentPage = 0;
        loadOrders();
    });
    
    $('#searchInput').on('input', debounce(function() {
        currentFilters.search = $(this).val();
        currentPage = 0;
        loadOrders();
    }, 300));
    
    $('#pageSizeSelect').on('change', function() {
        pageSize = parseInt($(this).val());
        currentPage = 0;
        loadOrders();
    });
    
    // Load orders via AJAX
    function loadOrders() {
        showLoading();
        
        const params = new URLSearchParams({
            page: currentPage,
            size: pageSize,
            status: currentFilters.status,
            sort: currentFilters.sort,
            search: currentFilters.search
        });
        
        $.ajax({
            url: '/custom/orders/data?' + params.toString(),
            method: 'GET',
            success: function(response) {
                hideLoading();
                if (response.success) {
                    renderOrders(response.data);
                    renderPagination(response.pagination);
                    updateFiltersVisibility(response.data.length > 0);
                } else {
                    showError('Có lỗi xảy ra khi tải dữ liệu');
                }
            },
            error: function() {
                hideLoading();
                showError('Không thể kết nối đến server');
            }
        });
    }
    
    // Render orders
    function renderOrders(orders) {
        const $container = $('#ordersContainer');
        $container.empty();
        
        if (orders.length === 0) {
            $('#emptyState').show();
            $('#filtersSection').hide();
            return;
        }
        
        $('#emptyState').hide();
        
        orders.forEach(order => {
            const orderHtml = createOrderCard(order);
            $container.append(orderHtml);
        });
    }
    
    // Create order card HTML
    function createOrderCard(order) {
        const statusBadge = getStatusBadge(order.status);
        const services = getServicesList(order);
        const actions = getActionButtons(order);
        
        return `
            <div class="card mb-3 order-card ${order.status.toLowerCase()}">
                <div class="card-header bg-primary text-white">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <h5 class="mb-1">
                                <i class="fas fa-keyboard"></i> ${order.baseKeyboard.name}
                            </h5>
                            <p class="mb-0 opacity-75">
                                <span class="order-id">Đơn hàng #CUSTOM${order.id}</span> - 
                                ${formatDate(order.createdAt)}
                            </p>
                        </div>
                        <div class="col-md-3 text-center">
                            <h4 class="mb-0">${formatPrice(order.totalPrice)} đ</h4>
                            ${order.totalPrice > order.baseKeyboard.price ? 
                                `<small class="text-muted">(Gốc: ${formatPrice(order.baseKeyboard.price)} đ)</small>` : ''}
                        </div>
                        <div class="col-md-3 text-end">
                            ${statusBadge}
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="/images/product/${order.baseKeyboard.image}" 
                                 class="img-fluid rounded" alt="${order.baseKeyboard.name}">
                        </div>
                        <div class="col-md-8">
                            <h6 class="mb-3">Chi tiết tùy chỉnh:</h6>
                            <div class="component-list">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <strong>Keycap:</strong><br>
                                        ${order.selectedKeycap ? order.selectedKeycap.name : '<span class="text-muted">Giữ nguyên gốc</span>'}
                                    </div>
                                    <div class="col-sm-6">
                                        <strong>Switch:</strong><br>
                                        ${order.selectedSwitchType || '<span class="text-muted">Giữ nguyên gốc</span>'}
                                    </div>
                                </div>
                                <hr class="my-2">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <strong>Kit:</strong><br>
                                        ${order.selectedKit ? order.selectedKit.name : '<span class="text-muted">Không sử dụng</span>'}
                                    </div>
                                    <div class="col-sm-6">
                                        <strong>Dịch vụ:</strong><br>
                                        ${services}
                                    </div>
                                </div>
                            </div>
                            ${order.customNotes ? `
                                <div class="mt-3">
                                    <strong>Ghi chú:</strong>
                                    <p class="text-muted mb-0">"${order.customNotes}"</p>
                                </div>
                            ` : ''}
                            <div class="mt-3 d-flex flex-wrap gap-2">
                                ${actions}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `;
    }
    
    // Get status badge
    function getStatusBadge(status) {
        const statusMap = {
            'PENDING': { class: 'bg-warning', icon: 'clock', text: 'Đang chờ xử lý' },
            'PROCESSING': { class: 'bg-info', icon: 'cogs', text: 'Đang thực hiện' },
            'READY': { class: 'bg-success', icon: 'check', text: 'Hoàn thành' },
            'SHIPPED': { class: 'bg-primary', icon: 'shipping-fast', text: 'Đã giao hàng' },
            'CANCELLED': { class: 'bg-secondary', icon: 'times', text: 'Đã hủy' }
        };
        
        const statusInfo = statusMap[status] || statusMap['PENDING'];
        return `<span class="badge ${statusInfo.class}">
            <i class="fas fa-${statusInfo.icon}"></i> ${statusInfo.text}
        </span>`;
    }
    
    // Get services list
    function getServicesList(order) {
        const services = [];
        if (order.lubingService) services.push('<span class="badge bg-light text-dark">Lubing</span>');
        if (order.stabilizerTuning) services.push('<span class="badge bg-light text-dark">Stabilizer</span>');
        if (order.keycapCustomization) services.push('<span class="badge bg-light text-dark">Keycap Custom</span>');
        if (order.cableCustomization) services.push('<span class="badge bg-light text-dark">Cable</span>');
        if (order.caseModding) services.push('<span class="badge bg-light text-dark">Case Mod</span>');
        
        return services.length > 0 ? services.join(' ') : '<span class="text-muted">Không có</span>';
    }
    
    // Get action buttons
    function getActionButtons(order) {
        let buttons = `
            <a href="/custom/preview/${order.id}" class="btn btn-outline-primary btn-sm">
                <i class="fas fa-eye"></i> Xem chi tiết
            </a>
        `;
        
        if (order.status === 'PENDING') {
            buttons += `
                <a href="/custom/keyboard/${order.baseKeyboard.id}?customOrderId=${order.id}" class="btn btn-outline-warning btn-sm">
                    <i class="fas fa-edit"></i> Chỉnh sửa
                </a>
                <button class="btn btn-outline-danger btn-sm" onclick="cancelOrder(${order.id})">
                    <i class="fas fa-times"></i> Hủy đơn
                </button>
            `;
        }
        
        buttons += `
            <button class="btn btn-outline-secondary btn-sm" onclick="copyOrder(${order.id})">
                <i class="fas fa-copy"></i> Sao chép
            </button>
        `;
        
        return buttons;
    }
    
    // Render pagination
    function renderPagination(pagination) {
        const $container = $('#paginationContainer');
        $container.empty();
        
        if (pagination.totalPages <= 1) {
            return;
        }
        
        let paginationHtml = `
            <nav aria-label="Custom orders pagination">
                <ul class="pagination justify-content-center">
        `;
        
        // Previous button
        paginationHtml += `
            <li class="page-item ${pagination.hasPrevious ? '' : 'disabled'}">
                <a class="page-link" href="#" data-page="${pagination.currentPage - 1}" 
                   ${pagination.hasPrevious ? '' : 'tabindex="-1" aria-disabled="true"'}>
                    <i class="fas fa-chevron-left"></i> Trước
                </a>
            </li>
        `;
        
        // Page numbers - limit to show only 5 pages around current
        const startPage = Math.max(0, pagination.currentPage - 2);
        const endPage = Math.min(pagination.totalPages - 1, pagination.currentPage + 2);
        
        // Show first page if not in range
        if (startPage > 0) {
            paginationHtml += `
                <li class="page-item">
                    <a class="page-link" href="#" data-page="0">1</a>
                </li>
            `;
            if (startPage > 1) {
                paginationHtml += `
                    <li class="page-item disabled">
                        <span class="page-link">...</span>
                    </li>
                `;
            }
        }
        
        // Page numbers
        for (let i = startPage; i <= endPage; i++) {
            paginationHtml += `
                <li class="page-item ${i === pagination.currentPage ? 'active' : ''}">
                    <a class="page-link" href="#" data-page="${i}">${i + 1}</a>
                </li>
            `;
        }
        
        // Show last page if not in range
        if (endPage < pagination.totalPages - 1) {
            if (endPage < pagination.totalPages - 2) {
                paginationHtml += `
                    <li class="page-item disabled">
                        <span class="page-link">...</span>
                    </li>
                `;
            }
            paginationHtml += `
                <li class="page-item">
                    <a class="page-link" href="#" data-page="${pagination.totalPages - 1}">${pagination.totalPages}</a>
                </li>
            `;
        }
        
        // Next button
        paginationHtml += `
            <li class="page-item ${pagination.hasNext ? '' : 'disabled'}">
                <a class="page-link" href="#" data-page="${pagination.currentPage + 1}"
                   ${pagination.hasNext ? '' : 'tabindex="-1" aria-disabled="true"'}>
                    Sau <i class="fas fa-chevron-right"></i>
                </a>
            </li>
        `;
        
        paginationHtml += `
                </ul>
            </nav>
            <div class="text-center text-muted mt-2">
                <small>
                    Hiển thị ${pagination.currentSize} trong tổng số ${pagination.totalOrders} đơn hàng 
                    (Trang ${pagination.currentPage + 1} / ${pagination.totalPages})
                </small>
            </div>
        `;
        
        $container.html(paginationHtml);
        
        // Pagination click handlers
        $container.find('.page-link').on('click', function(e) {
            e.preventDefault();
            const page = parseInt($(this).data('page'));
            if (!isNaN(page) && page >= 0 && page < pagination.totalPages) {
                currentPage = page;
                loadOrders();
                // Scroll to top of orders container
                $('#ordersContainer')[0].scrollIntoView({ behavior: 'smooth' });
            }
        });
    }
    
    // Utility functions
    function showLoading() {
        $('#loadingSpinner').show();
        $('#ordersContainer').hide();
        $('#paginationContainer').hide();
    }
    
    function hideLoading() {
        $('#loadingSpinner').hide();
        $('#ordersContainer').show();
        $('#paginationContainer').show();
    }
    
    function updateFiltersVisibility(hasOrders) {
        $('#filtersSection').toggle(hasOrders);
    }
    
    function showError(message) {
        $('#ordersContainer').html(`
            <div class="alert alert-danger text-center">
                <i class="fas fa-exclamation-triangle"></i> ${message}
            </div>
        `);
    }
    
    function formatDate(dateString) {
        const date = new Date(dateString);
        return date.toLocaleDateString('vi-VN') + ' ' + date.toLocaleTimeString('vi-VN', {
            hour: '2-digit',
            minute: '2-digit'
        });
    }
    
    function formatPrice(price) {
        return new Intl.NumberFormat('vi-VN').format(price);
    }
    
    function debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }
});

// Global functions for order actions
function cancelOrder(orderId) {
    if (confirm('Bạn có chắc chắn muốn hủy đơn hàng custom này?')) {
        $.ajax({
            url: '/custom/cancel/' + orderId,
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')
            },
            success: function(response) {
                if (response.success) {
                    alert('Đơn hàng đã được hủy thành công!');
                    location.reload();
                } else {
                    alert('Có lỗi xảy ra: ' + response.message);
                }
            },
            error: function() {
                alert('Có lỗi xảy ra khi hủy đơn hàng!');
            }
        });
    }
}

function copyOrder(orderId) {
    if (confirm('Bạn có muốn tạo đơn hàng custom mới dựa trên đơn hàng này?')) {
        $.ajax({
            url: '/custom/copy/' + orderId,
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')
            },
            success: function(response) {
                if (response.success && response.newOrderId) {
                    alert('Đã tạo đơn hàng mới thành công!');
                    window.location.href = '/custom/keyboard/' + response.keyboardId + '?customOrderId=' + response.newOrderId;
                } else {
                    alert('Có lỗi xảy ra: ' + response.message);
                }
            },
            error: function() {
                alert('Có lỗi xảy ra khi sao chép đơn hàng!');
            }
        });
    }
} 