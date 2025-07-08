$(document).ready(function() {
    const $ordersContainer = $('#ordersContainer');
    const $noResultsMessage = $('#noResultsMessage');
    const $statusFilter = $('#statusFilter');
    const $sortFilter = $('#sortFilter');
    const $searchInput = $('#searchInput');
    const $resetFilters = $('#resetFilters');
    
    let allOrders = [];
    
    // Store original orders
    $('.order-card').each(function() {
        const $card = $(this);
        allOrders.push({
            element: $card.clone(),
            status: $card.data('status'),
            price: parseFloat($card.data('price')) || 0,
            date: new Date($card.data('date')),
            keyboard: $card.data('keyboard').toLowerCase(),
            orderId: $card.data('order-id').toString()
        });
    });
    
    // Filter and search functionality
    function filterOrders() {
        const statusFilter = $statusFilter.val();
        const sortFilter = $sortFilter.val();
        const searchTerm = $searchInput.val().toLowerCase();
        
        let filteredOrders = allOrders.filter(order => {
            // Status filter
            if (statusFilter && order.status !== statusFilter) {
                return false;
            }
            
            // Search filter
            if (searchTerm && 
                !order.keyboard.includes(searchTerm) && 
                !order.orderId.includes(searchTerm)) {
                return false;
            }
            
            return true;
        });
        
        // Sort orders
        filteredOrders.sort((a, b) => {
            switch (sortFilter) {
                case 'oldest':
                    return a.date - b.date;
                case 'price-high':
                    return b.price - a.price;
                case 'price-low':
                    return a.price - b.price;
                case 'newest':
                default:
                    return b.date - a.date;
            }
        });
        
        // Update display
        $ordersContainer.empty();
        
        if (filteredOrders.length === 0) {
            $noResultsMessage.show();
        } else {
            $noResultsMessage.hide();
            filteredOrders.forEach(order => {
                $ordersContainer.append(order.element);
            });
        }
    }
    
    // Event listeners
    $statusFilter.on('change', filterOrders);
    $sortFilter.on('change', filterOrders);
    $searchInput.on('input', debounce(filterOrders, 300));
    
    $resetFilters.on('click', function() {
        $statusFilter.val('');
        $sortFilter.val('newest');
        $searchInput.val('');
        filterOrders();
    });
    
    // Debounce function
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
    
    // Update pagination links to preserve filters
    $('.pagination .page-link').on('click', function(e) {
        const href = $(this).attr('href');
        const url = new URL(href, window.location.origin);
        
        // Preserve current filters in pagination
        const statusFilter = $statusFilter.val();
        const sortFilter = $sortFilter.val();
        const searchTerm = $searchInput.val();
        
        if (statusFilter) url.searchParams.set('status', statusFilter);
        if (sortFilter) url.searchParams.set('sort', sortFilter);
        if (searchTerm) url.searchParams.set('search', searchTerm);
        
        $(this).attr('href', url.pathname + url.search);
    });
});

// Cancel order function
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

// Copy order function
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

// Auto refresh status every 30 seconds for processing orders
setInterval(function() {
    const $processingOrders = $('.order-card[data-status="PROCESSING"]');
    if ($processingOrders.length > 0) {
        // Optional: Auto refresh status for processing orders
        // You can implement AJAX call to check status updates
    }
}, 30000);

// Change page size function
function changePageSize(newSize) {
    const url = new URL(window.location);
    url.searchParams.set('size', newSize);
    url.searchParams.set('page', '0'); // Reset to first page
    window.location.href = url.toString();
}