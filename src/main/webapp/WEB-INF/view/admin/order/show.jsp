<<<<<<< Updated upstream
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nong Lam - Dự án KeyBoardShop" />
                <meta name="author" content="Nong Lam" />
                <title>Manager Orders - Nông Lâm Keyboard</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Orders</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Order</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex">
                                                <h3>Table Orders</h3>
                                            </div>

                                            <hr />
                                            <table class=" table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Total Price</th>
                                                        <th>User</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="order" items="${orders}">
                                                        <tr>
                                                            <th>${order.id}</th>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${order.totalPrice}" /> đ
                                                            </td>
                                                            <td>${order.user.fullName}</td>
                                                            <td>${order.status}</td>
                                                            <td>
                                                                <a href="/admin/order/${order.id}"
                                                                    class="btn btn-success">View</a>
                                                                <a href="/admin/order/update/${order.id}"
                                                                    class="btn btn-warning  mx-2">Update</a>
                                                                <a href="/admin/order/delete/${order.id}"
                                                                    class="btn btn-danger">Delete</a>
                                                            </td>
                                                        </tr>

                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item">
                                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/admin/order?page=${currentPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                                href="/admin/order?page=${loop.index + 1}">
                                                                ${loop.index + 1}
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/admin/order?page=${currentPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
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
                <script src="/js/scripts.js"></script>

            </body>

            </html>
=======
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageTitle" value="Quản lý đơn hàng" />
<jsp:include page="../layout/header.jsp" />

<!-- Header Actions -->
<div class="flex justify-between items-center mb-6">
    <div>
        <h1 class="text-2xl font-bold text-gray-900">Quản lý đơn hàng</h1>
        <p class="text-gray-600">Quản lý và cập nhật trạng thái đơn hàng</p>
    </div>
    <div class="flex space-x-3">
        <button id="refreshOrders" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg flex items-center">
            <i class="fas fa-sync-alt mr-2"></i>
            Làm mới
        </button>
    </div>
</div>

<!-- Filters -->
<div class="bg-white rounded-lg shadow-sm p-6 mb-6">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Tìm kiếm</label>
            <input type="text" id="searchInput" placeholder="Mã đơn hàng, tên khách hàng..." 
                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Trạng thái</label>
            <select id="statusFilter" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                <option value="">Tất cả trạng thái</option>
                <option value="PENDING">Chờ xử lý</option>
                <option value="CONFIRM">Đã xác nhận</option>
                <option value="SHIPPING">Đang giao</option>
                <option value="COMPLETE">Hoàn thành</option>
                <option value="CANCEL">Đã hủy</option>
            </select>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Phương thức thanh toán</label>
            <select id="paymentFilter" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                <option value="">Tất cả</option>
                <option value="COD">Thanh toán khi nhận hàng</option>
                <option value="BANKING">Chuyển khoản</option>
            </select>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">&nbsp;</label>
            <button id="resetFilters" class="w-full px-4 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600">
                Đặt lại
            </button>
        </div>
    </div>
</div>

<!-- Orders Table -->
<div class="bg-white rounded-lg shadow-sm overflow-hidden">
    <div class="px-6 py-4 border-b border-gray-200">
        <h3 class="text-lg font-semibold text-gray-800">Danh sách đơn hàng</h3>
    </div>
    
    <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Mã đơn hàng
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Khách hàng
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Tổng tiền
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Trạng thái
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Thanh toán
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Ngày tạo
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Thao tác
                    </th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <c:forEach var="order" items="${orders}">
                    <tr class="hover:bg-gray-50" data-order-id="${order.id}">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">#${order.id}</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm">
                                <div class="font-medium text-gray-900">${order.receiverName}</div>
                                <div class="text-gray-500">${order.receiverPhone}</div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">
                                <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <c:choose>
                                <c:when test="${order.status == 'PENDING'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                        <i class="fas fa-clock mr-1"></i>
                                        Chờ xử lý
                                    </span>
                                                                </c:when>
                                <c:when test="${order.status == 'CONFIRM'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">
                                        <i class="fas fa-check mr-1"></i>
                                        Đã xác nhận
                                    </span>
                                </c:when>
                                <c:when test="${order.status == 'SHIPPING'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-purple-100 text-purple-800">
                                        <i class="fas fa-truck mr-1"></i>
                                        Đang giao
                                    </span>
                                </c:when>
                                <c:when test="${order.status == 'COMPLETE'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                        <i class="fas fa-check-circle mr-1"></i>
                                        Hoàn thành
                                    </span>
                                </c:when>
                                <c:when test="${order.status == 'CANCEL'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">
                                        <i class="fas fa-times-circle mr-1"></i>
                                        Đã hủy
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-gray-100 text-gray-800">
                                        ${order.status}
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <c:choose>
                                <c:when test="${order.paymentMethod == 'COD'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-orange-100 text-orange-800">
                                        <i class="fas fa-money-bill mr-1"></i>
                                        COD
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                        <i class="fas fa-credit-card mr-1"></i>
                                        Banking
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            ${order.formattedCreatedAt}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                            <div class="flex space-x-2">
                                <a href="/admin/order/${order.id}" 
                                   class="text-blue-600 hover:text-blue-900" title="Xem chi tiết">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <c:if test="${order.status == 'PENDING'}">
                                    <button onclick="confirmOrder(${order.id})" 
                                            class="text-green-600 hover:text-green-900" title="Xác nhận đơn hàng">
                                        <i class="fas fa-check"></i>
                                    </button>
                                </c:if>
                                <c:if test="${order.status == 'CONFIRM'}">
                                    <button onclick="updateOrderStatus(${order.id}, 'SHIPPING')" 
                                            class="text-purple-600 hover:text-purple-900" title="Chuyển sang đang giao">
                                        <i class="fas fa-truck"></i>
                                    </button>
                                </c:if>
                                <c:if test="${order.status == 'SHIPPING'}">
                                    <button onclick="updateOrderStatus(${order.id}, 'COMPLETE')" 
                                            class="text-green-600 hover:text-green-900" title="Hoàn thành đơn hàng">
                                        <i class="fas fa-check-circle"></i>
                                    </button>
                                </c:if>
                                <c:if test="${order.status != 'COMPLETE' && order.status != 'CANCEL'}">
                                    <button onclick="updateOrderStatus(${order.id}, 'CANCEL')" 
                                            class="text-red-600 hover:text-red-900" title="Hủy đơn hàng">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </c:if>

                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <!-- Pagination -->
    <c:if test="${totalPages > 1}">
        <div class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
            <div class="flex-1 flex justify-between sm:hidden">
                <c:if test="${currentPage > 1}">
                    <a href="/admin/order?page=${currentPage - 1}" 
                       class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                        Trước
                    </a>
                </c:if>
                <c:if test="${currentPage < totalPages}">
                    <a href="/admin/order?page=${currentPage + 1}" 
                       class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                        Sau
                    </a>
                </c:if>
            </div>
            <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
                <div>
                    <p class="text-sm text-gray-700">
                        Trang <span class="font-medium">${currentPage}</span> / <span class="font-medium">${totalPages}</span>
                    </p>
                </div>
                <div>
                    <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="/admin/order?page=${currentPage - 1}" 
                               class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </c:if>
                        
                        <c:forEach begin="1" end="${totalPages}" var="page">
                            <c:choose>
                                <c:when test="${page == currentPage}">
                                    <span class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-primary-50 text-sm font-medium text-primary-600">
                                        ${page}
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <a href="/admin/order?page=${page}" 
                                       class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                                        ${page}
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <c:if test="${currentPage < totalPages}">
                            <a href="/admin/order?page=${currentPage + 1}" 
                               class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </c:if>
                    </nav>
                </div>
            </div>
        </div>
    </c:if>
</div>

<!-- Status Update Modal -->
<div id="statusUpdateModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
    <div class="bg-white rounded-lg max-w-md w-full mx-4">
        <div class="flex items-center justify-between p-6 border-b">
            <h3 class="text-lg font-semibold text-gray-800">Cập nhật trạng thái đơn hàng</h3>
            <button onclick="closeStatusModal()" class="text-gray-400 hover:text-gray-600">
                <i class="fas fa-times text-xl"></i>
            </button>
        </div>
        <div class="p-6">
            <form id="statusUpdateForm">
                <input type="hidden" id="updateOrderId" name="orderId">
                
                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-700 mb-2">Trạng thái mới</label>
                    <select id="newStatus" name="status" required
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                        <option value="PENDING">Chờ xử lý</option>
                        <option value="CONFIRM">Đã xác nhận</option>
                        <option value="SHIPPING">Đang giao</option>
                        <option value="COMPLETE">Hoàn thành</option>
                        <option value="CANCEL">Đã hủy</option>
                    </select>
                </div>
                
                <div class="flex justify-end space-x-3">
                    <button type="button" onclick="closeStatusModal()" 
                            class="px-4 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400">
                        Hủy
                    </button>
                    <button type="submit" 
                            class="px-4 py-2 bg-primary-500 text-white rounded-lg hover:bg-primary-600">
                        Cập nhật
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Filter functionality
    const searchInput = document.getElementById('searchInput');
    const statusFilter = document.getElementById('statusFilter');
    const paymentFilter = document.getElementById('paymentFilter');
    const resetButton = document.getElementById('resetFilters');
    const refreshButton = document.getElementById('refreshOrders');
    
    // Filter events
    searchInput.addEventListener('input', filterOrders);
    statusFilter.addEventListener('change', filterOrders);
    paymentFilter.addEventListener('change', filterOrders);
    
    resetButton.addEventListener('click', function() {
        searchInput.value = '';
        statusFilter.value = '';
        paymentFilter.value = '';
        filterOrders();
    });
    
    refreshButton.addEventListener('click', function() {
        location.reload();
    });
    
    // Status update form
    document.getElementById('statusUpdateForm').addEventListener('submit', handleStatusUpdate);
    
    function filterOrders() {
        const searchTerm = searchInput.value.toLowerCase();
        const statusValue = statusFilter.value;
        const paymentValue = paymentFilter.value;
        
        const rows = document.querySelectorAll('tbody tr');
        
        rows.forEach(row => {
            const orderId = row.querySelector('td:first-child .text-gray-900').textContent.toLowerCase();
            const customerName = row.querySelector('td:nth-child(2) .text-gray-900').textContent.toLowerCase();
            const statusElement = row.querySelector('td:nth-child(4) span');
            const paymentElement = row.querySelector('td:nth-child(5) span');
            
            let showRow = true;
            
            // Search filter
            if (searchTerm && !orderId.includes(searchTerm) && !customerName.includes(searchTerm)) {
                showRow = false;
            }
            
            // Status filter
            if (statusValue) {
                const statusText = statusElement.textContent;
                let orderStatus = '';
                if (statusText.includes('Chờ xử lý')) orderStatus = 'PENDING';
                else if (statusText.includes('Đã xác nhận')) orderStatus = 'CONFIRM';
                else if (statusText.includes('Đang giao')) orderStatus = 'SHIPPING';
                else if (statusText.includes('Hoàn thành')) orderStatus = 'COMPLETE';
                else if (statusText.includes('Đã hủy')) orderStatus = 'CANCEL';
                
                if (orderStatus !== statusValue) {
                    showRow = false;
                }
            }
            
            // Payment filter
            if (paymentValue) {
                const paymentText = paymentElement.textContent;
                let paymentMethod = '';
                if (paymentText.includes('COD')) paymentMethod = 'COD';
                else if (paymentText.includes('Banking')) paymentMethod = 'BANKING';
                
                if (paymentMethod !== paymentValue) {
                    showRow = false;
                }
            }
            
            row.style.display = showRow ? '' : 'none';
        });
    }
});

function confirmOrder(orderId) {
    console.log('Confirming order with ID:', orderId);
    if (confirm('Bạn có chắc chắn muốn xác nhận đơn hàng này?')) {
        // Show loading state
        const button = event.target.closest('button');
        const originalHTML = button.innerHTML;
        button.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Đang xử lý...';
        button.disabled = true;
        
        const url = '/admin/order/confirm/' + orderId;
        console.log('Making request to:', url);
        
        fetch(url, {
            method: 'POST'
        })
        .then(response => {
            console.log('Response status:', response.status);
            return response.json();
        })
        .then(data => {
            console.log('Response data:', data);
            if (data.success) {
                alert('Đơn hàng đã được xác nhận thành công');
                location.reload();
            } else {
                alert('Có lỗi xảy ra: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi xác nhận đơn hàng');
        })
        .finally(() => {
            // Reset button state
            button.innerHTML = originalHTML;
            button.disabled = false;
        });
    }
}

function updateOrderStatus(orderId, newStatus) {
    console.log('Updating order status - orderId:', orderId, 'newStatus:', newStatus);
    
    const statusNames = {
        'PENDING': 'Chờ xử lý',
        'CONFIRM': 'Đã xác nhận',
        'SHIPPING': 'Đang giao',
        'COMPLETE': 'Hoàn thành',
        'CANCEL': 'Đã hủy'
    };
    
    if (confirm('Bạn có chắc chắn muốn chuyển đơn hàng sang trạng thái "' + statusNames[newStatus] + '"?')) {
        // Show loading state
        const button = event.target.closest('button');
        const originalHTML = button.innerHTML;
        button.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
        button.disabled = true;
        
        // Prepare form data
        const formData = new FormData();
        formData.append('orderId', orderId);
        formData.append('status', newStatus);
        
        console.log('Sending data - orderId:', orderId, 'status:', newStatus);
        
        // Use AJAX with FormData
        fetch('/admin/order/update-status', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            console.log('Response status:', response.status);
            return response.json();
        })
        .then(data => {
            console.log('Response data:', data);
            if (data.success) {
                alert('Cập nhật trạng thái thành công');
                location.reload();
            } else {
                alert('Có lỗi xảy ra: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi cập nhật trạng thái');
        })
        .finally(() => {
            // Reset button state
            button.innerHTML = originalHTML;
            button.disabled = false;
        });
    }
}

function handleStatusUpdate(event) {
    event.preventDefault();
    
    const orderId = document.getElementById('updateOrderId').value;
    const newStatus = document.getElementById('newStatus').value;
    
    updateOrderStatus(orderId, newStatus);
    closeStatusModal();
}

function closeStatusModal() {
    document.getElementById('statusUpdateModal').classList.add('hidden');
}
</script>

<jsp:include page="../layout/footer.jsp" /> 
>>>>>>> Stashed changes
