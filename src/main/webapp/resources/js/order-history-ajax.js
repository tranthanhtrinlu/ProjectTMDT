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
            url: '/order/history/data?' + params.toString(),
            method: 'GET',
            success: function(response) {
                hideLoading();
                if (response.success) {
                    renderOrders(response.data);
                    renderPagination(response.pagination);
                    updateStats(response.data, response.pagination);
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
            $('#statsSection').hide();
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
        const actions = getActionButtons(order);
        
        return `
            <div class="order-card ${order.status.toLowerCase()}">
                <div class="order-header">
                    <div class="order-header-content">
                        <div class="order-id">Đơn hàng #${order.id}</div>
                        <div class="order-date">
                            <i class="fas fa-calendar-alt"></i> 
                            ${formatDate(order.createdAt)}
                        </div>
                    </div>
                    <div class="order-status">
                        ${statusBadge}
                    </div>
                </div>
                
                <div class="order-body">
                    ${order.orderDetails.map(detail => `
                        <div class="product-item">
                            <img src="/images/product/${detail.product.image}" 
                                 class="product-image" 
                                 alt="${detail.product.name}">
                            
                            <div class="product-info">
                                <a href="/product/${detail.product.id}" 
                                   class="product-name" 
                                   target="_blank">
                                    ${detail.product.name}
                                </a>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="product-price">
                                        ${formatPrice(detail.price)} đ
                                    </div>
                                    <div class="product-quantity">
                                        <i class="fas fa-times"></i> ${detail.quantity}
                                    </div>
                                </div>
                            </div>
                            
                            <div class="text-end">
                                <div class="product-price">
                                    ${formatPrice(detail.price * detail.quantity)} đ
                                </div>
                            </div>
                        </div>
                    `).join('')}
                    
                    <div class="order-summary">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="order-actions">
                                    ${actions}
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="order-total">
                                    Tổng cộng: ${formatPrice(order.totalPrice)} đ
                                </div>
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
            'PENDING': { class: 'status-pending', icon: 'clock', text: 'Đang chờ' },
            'PROCESSING': { class: 'status-processing', icon: 'cogs', text: 'Đang xử lý' },
            'SHIPPED': { class: 'status-shipped', icon: 'shipping-fast', text: 'Đã giao' },
            'COMPLETE': { class: 'status-complete', icon: 'check-circle', text: 'Hoàn thành' },
            'CANCEL': { class: 'status-cancel', icon: 'times-circle', text: 'Đã hủy' }
        };
        
        const statusInfo = statusMap[status] || statusMap['PENDING'];
        return `<span class="status-badge ${statusInfo.class}">
            <i class="fas fa-${statusInfo.icon}"></i> ${statusInfo.text}
        </span>`;
    }
    
    // Get action buttons
    function getActionButtons(order) {
        let buttons = '';
        
        if (order.status === 'PENDING') {
            buttons += `
                <button onclick="cancelOrder(${order.id})" class="btn btn-danger btn-action">
                    <i class="fas fa-times"></i> Hủy đơn
                </button>
            `;
        }
        
        if (order.status === 'COMPLETE') {
            // Chỉ hiển thị nút đánh giá cho sản phẩm chưa được đánh giá
            const unreviewedProducts = order.orderDetails.filter(detail => !detail.hasReviewed);
            unreviewedProducts.forEach(detail => {
                buttons += `
                    <a href="/product/${detail.product.id}/review" class="btn btn-success btn-action">
                        <i class="fas fa-star"></i> Đánh giá
                    </a>
                `;
            });
            
            // Hiển thị trạng thái nếu tất cả sản phẩm đã được đánh giá
            const allReviewed = order.orderDetails.every(detail => detail.hasReviewed);
            if (allReviewed) {
                buttons += `
                    <span class="btn btn-outline-success btn-action disabled">
                        <i class="fas fa-check"></i> Đã đánh giá
                    </span>
                `;
            }
        }
        
        buttons += `
            <a href="/order/${order.id}" class="btn btn-outline-primary btn-action">
                <i class="fas fa-eye"></i> Chi tiết
            </a>
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
            <nav aria-label="Order history pagination">
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
    
    // Update statistics
    function updateStats(orders, pagination) {
        const allOrdersCount = pagination.totalOrders;
        
        // Count by status (need to get from server for accurate stats)
        let pendingCount = 0;
        let completeCount = 0;
        let totalSpent = 0;
        
        // Calculate from current page (approximate)
        orders.forEach(order => {
            totalSpent += order.totalPrice;
            if (order.status === 'PENDING') pendingCount++;
            if (order.status === 'COMPLETE') completeCount++;
        });
        
        // Estimate total spent based on current page
        if (pagination.totalPages > 1) {
            totalSpent = Math.round(totalSpent * (pagination.totalOrders / pagination.currentSize));
        }
        
        $('#totalOrders').text(allOrdersCount);
        $('#pendingOrders').text(pendingCount);
        $('#completeOrders').text(completeCount);
        $('#totalSpent').text(formatPrice(totalSpent));
        
        $('#statsSection').show();
    }
    
    // Utility functions
    function showLoading() {
        $('#loadingSpinner').show();
        $('#ordersContainer').hide();
        $('#paginationContainer').hide();
        $('#statsSection').hide();
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

// Global function for cancel order
function cancelOrder(orderId) {
    if (confirm('Bạn có chắc chắn muốn hủy đơn hàng này?')) {
        $.ajax({
            url: '/order/cancel/' + orderId,
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')
            },
            success: function() {
                alert('Đơn hàng đã được hủy thành công!');
                location.reload();
            },
            error: function() {
                alert('Có lỗi xảy ra khi hủy đơn hàng!');
            }
        });
    }
} 