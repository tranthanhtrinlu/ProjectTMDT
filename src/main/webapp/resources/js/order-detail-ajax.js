$(document).ready(function() {
    const orderId = window.orderDetailData.orderId;
    
    // Load order detail on page load
    loadOrderDetail();
    
    function loadOrderDetail() {
        showLoading();
        
        $.ajax({
            url: '/order/' + orderId + '/data',
            method: 'GET',
            success: function(response) {
                hideLoading();
                if (response.success) {
                    renderOrderDetail(response.data);
                } else {
                    showError(response.message);
                }
            },
            error: function() {
                hideLoading();
                showError('Không thể kết nối đến server');
            }
        });
    }
    
    function renderOrderDetail(order) {
        $('#orderDetailContainer').html(createOrderDetailHTML(order));
        $('#errorContainer').hide();
    }
    
    function createOrderDetailHTML(order) {
        const statusBadge = getStatusBadge(order.status);
        const timeline = createTimeline(order);
        const products = createProductsList(order.orderDetails);
        const actions = getActionButtons(order);
        
        return `
            <!-- Order Header -->
            <div class="order-detail-card">
                <div class="order-header">
                    <div class="order-header-content">
                        <div class="order-id">Đơn hàng #${order.id}</div>
                        <div class="order-meta">
                            <i class="fas fa-calendar-alt"></i> 
                            Đặt hàng: ${formatDate(order.createdAt)}
                        </div>
                    </div>
                    <div class="status-badge status-${order.status.toLowerCase()}">
                        ${statusBadge}
                    </div>
                </div>
                
                <!-- Order Information -->
                <div class="info-section">
                    <h3 class="section-title">
                        <i class="fas fa-info-circle"></i>
                        Thông tin đơn hàng
                    </h3>
                    
                    <div class="info-grid">
                        <div class="info-item">
                            <div class="info-label">Mã đơn hàng</div>
                            <div class="info-value">#${order.id}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Ngày đặt</div>
                            <div class="info-value">${formatDate(order.createdAt)}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Trạng thái</div>
                            <div class="info-value">${getStatusText(order.status)}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Phương thức thanh toán</div>
                            <div class="info-value">${getPaymentMethodText(order.paymentMethod)}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Trạng thái thanh toán</div>
                            <div class="info-value">${getPaymentStatusText(order.paymentStatus)}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Tổng tiền</div>
                            <div class="info-value" style="color: #e74c3c; font-weight: bold; font-size: 1.2em;">
                                ${formatPrice(order.totalPrice)} đ
                            </div>
                        </div>
                    </div>
                    
                    <!-- Order Timeline -->
                    <h3 class="section-title">
                        <i class="fas fa-history"></i>
                        Lịch sử đơn hàng
                    </h3>
                    ${timeline}
                </div>
            </div>
            
            <!-- Products List -->
            <div class="order-detail-card">
                <div class="info-section">
                    <h3 class="section-title">
                        <i class="fas fa-box"></i>
                        Sản phẩm trong đơn hàng (${order.orderDetails.length} sản phẩm)
                    </h3>
                    
                    <div class="product-list">
                        ${products}
                    </div>
                    
                    <!-- Order Summary -->
                    <div class="order-summary">
                        <div class="summary-row">
                            <span>Tạm tính:</span>
                            <span>${formatPrice(order.totalPrice)} đ</span>
                        </div>
                        <div class="summary-row">
                            <span>Phí vận chuyển:</span>
                            <span>Miễn phí</span>
                        </div>
                        <div class="summary-row">
                            <span>Tổng cộng:</span>
                            <span>${formatPrice(order.totalPrice)} đ</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Action Buttons -->
            <div class="order-actions">
                ${actions}
            </div>
        `;
    }
    
    function getStatusBadge(status) {
        const statusMap = {
            'PENDING': { icon: 'clock', text: 'Đang chờ' },
            'PROCESSING': { icon: 'cogs', text: 'Đang xử lý' },
            'SHIPPED': { icon: 'shipping-fast', text: 'Đã giao' },
            'COMPLETE': { icon: 'check-circle', text: 'Hoàn thành' },
            'CANCEL': { icon: 'times-circle', text: 'Đã hủy' }
        };
        
        const statusInfo = statusMap[status] || statusMap['PENDING'];
        return `<i class="fas fa-${statusInfo.icon}"></i> ${statusInfo.text}`;
    }
    
    function getStatusText(status) {
        const statusMap = {
            'PENDING': 'Đang chờ xử lý',
            'PROCESSING': 'Đang xử lý',
            'SHIPPED': 'Đã giao hàng',
            'COMPLETE': 'Hoàn thành',
            'CANCEL': 'Đã hủy'
        };
        return statusMap[status] || status;
    }
    
    function getPaymentMethodText(method) {
        const methodMap = {
            'COD': '<i class="fas fa-money-bill-wave"></i> Thanh toán khi nhận hàng',
            'VNPAY': '<i class="fas fa-credit-card"></i> VNPay'
        };
        return methodMap[method] || `<i class="fas fa-question-circle"></i> ${method}`;
    }
    
    function getPaymentStatusText(status) {
        const statusMap = {
            'PAYMENT_SUCCEED': '<span class="text-success"><i class="fas fa-check-circle"></i> Đã thanh toán</span>',
            'PAYMENT_FAILED': '<span class="text-danger"><i class="fas fa-times-circle"></i> Thanh toán thất bại</span>'
        };
        return statusMap[status] || '<span class="text-warning"><i class="fas fa-clock"></i> Chưa thanh toán</span>';
    }
    
    function createTimeline(order) {
        let timeline = `
            <div class="timeline">
                <div class="timeline-item">
                    <div class="timeline-content">
                        <div class="timeline-title">Đặt hàng thành công</div>
                        <div class="timeline-date">${formatDate(order.createdAt)}</div>
                    </div>
                </div>
        `;
        
        if (order.status !== 'PENDING') {
            const statusTitle = {
                'PROCESSING': 'Đang xử lý đơn hàng',
                'SHIPPED': 'Đã giao cho đơn vị vận chuyển',
                'COMPLETE': 'Giao hàng thành công',
                'CANCEL': 'Đơn hàng đã bị hủy'
            };
            
            timeline += `
                <div class="timeline-item">
                    <div class="timeline-content">
                        <div class="timeline-title">${statusTitle[order.status] || order.status}</div>
                        <div class="timeline-date">${formatDate(order.createdAt)}</div>
                    </div>
                </div>
            `;
        }
        
        timeline += `</div>`;
        return timeline;
    }
    
    function createProductsList(orderDetails) {
        return orderDetails.map(detail => `
            <div class="product-item">
                <img src="/images/product/${detail.product.image}" 
                     class="product-image" 
                     alt="${detail.product.name}">
                
                <div class="product-info">
                    <div class="product-name">
                        <a href="/product/${detail.product.id}" target="_blank">
                            ${detail.product.name}
                        </a>
                    </div>
                    <div class="product-details">
                        <div><strong>Số lượng:</strong> ${detail.quantity}</div>
                        <div><strong>Đơn giá:</strong> ${formatPrice(detail.price)} đ</div>
                    </div>
                </div>
                
                <div class="product-pricing">
                    <div class="product-price">${formatPrice(detail.price)} đ</div>
                    <div class="product-total">
                        Thành tiền: ${formatPrice(detail.price * detail.quantity)} đ
                    </div>
                    ${detail.hasReviewed !== undefined ? `
                        <div class="product-actions mt-2">
                            ${detail.hasReviewed ? 
                                `<span class="btn btn-outline-success btn-sm disabled">
                                    <i class="fas fa-check"></i> Đã đánh giá
                                </span>` :
                                `<a href="/product/${detail.product.id}/review" class="btn btn-success btn-sm">
                                    <i class="fas fa-star"></i> Đánh giá
                                </a>`
                            }
                        </div>
                    ` : ''}
                </div>
            </div>
        `).join('');
    }
    
    function getActionButtons(order) {
        let buttons = `
            <a href="/order/history" class="btn btn-secondary btn-action">
                <i class="fas fa-arrow-left"></i> Quay lại lịch sử
            </a>
        `;
        
        if (order.status === 'PENDING') {
            buttons += `
                <button onclick="cancelOrder(${order.id})" class="btn btn-danger btn-action">
                    <i class="fas fa-times"></i> Hủy đơn hàng
                </button>
            `;
        }
        
        if (order.status === 'COMPLETE') {
            // Kiểm tra xem có sản phẩm nào chưa đánh giá không
            const unreviewedProducts = order.orderDetails.filter(detail => detail.hasReviewed !== undefined && !detail.hasReviewed);
            if (unreviewedProducts.length > 0) {
                buttons += `
                    <div class="btn-group me-2" role="group">
                        <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-star"></i> Đánh giá sản phẩm
                        </button>
                        <ul class="dropdown-menu">
                            ${unreviewedProducts.map(detail => `
                                <li><a class="dropdown-item" href="/product/${detail.product.id}/review">
                                    <i class="fas fa-star me-2"></i>${detail.product.name}
                                </a></li>
                            `).join('')}
                        </ul>
                    </div>
                `;
            }
            
            buttons += `
                <button onclick="reorderOrder(${order.id})" class="btn btn-primary btn-action">
                    <i class="fas fa-redo"></i> Đặt lại đơn hàng
                </button>
            `;
        }
        
        buttons += `
            <a href="javascript:window.print()" class="btn btn-outline-primary btn-action">
                <i class="fas fa-print"></i> In đơn hàng
            </a>
        `;
        
        return buttons;
    }
    
    function showLoading() {
        $('#loadingSpinner').show();
        $('#orderDetailContainer').hide();
        $('#errorContainer').hide();
    }
    
    function hideLoading() {
        $('#loadingSpinner').hide();
        $('#orderDetailContainer').show();
    }
    
    function showError(message) {
        $('#loadingSpinner').hide();
        $('#orderDetailContainer').hide();
        $('#errorContainer').html(`
            <div class="error-message">
                <i class="fas fa-exclamation-triangle"></i>
                <h4>Có lỗi xảy ra</h4>
                <p>${message}</p>
                <a href="/order/history" class="btn btn-primary">
                    <i class="fas fa-arrow-left"></i> Quay lại lịch sử
                </a>
            </div>
        `).show();
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
});

// Global functions
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

function reorderOrder(orderId) {
    if (confirm('Bạn có muốn thêm tất cả sản phẩm từ đơn hàng này vào giỏ hàng?')) {
        $.ajax({
            url: '/order/' + orderId + '/reorder',
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')
            },
            success: function(response) {
                if (response.success) {
                    alert(response.message);
                    if (response.redirectUrl) {
                        window.location.href = response.redirectUrl;
                    }
                } else {
                    alert('Lỗi: ' + response.message);
                }
            },
            error: function() {
                alert('Có lỗi xảy ra khi đặt lại đơn hàng!');
            }
        });
    }
} 