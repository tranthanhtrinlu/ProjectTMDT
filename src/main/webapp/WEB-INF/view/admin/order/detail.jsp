<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageTitle" value="Chi tiết đơn hàng #${order.id}" />
<jsp:include page="../layout/header.jsp" />

<<<<<<< Updated upstream
                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Nông Lam - Dự án KeyBoardShop" />
                    <meta name="author" content="Nong Lam" />
                    <title>Detail Order - Nông Lâm Keyboard</title>
                    <link href="/css/styles.css" rel="stylesheet" />
=======
<!-- Header with Back Button -->
<div class="flex items-center justify-between mb-6">
    <div class="flex items-center">
        <a href="/admin/order" class="text-gray-600 hover:text-gray-800 mr-4">
            <i class="fas fa-arrow-left text-xl"></i>
        </a>
        <div>
            <h1 class="text-2xl font-bold text-gray-900">Chi tiết đơn hàng #${order.id}</h1>
            <p class="text-gray-600">Thông tin chi tiết về đơn hàng</p>
        </div>
    </div>
    <div class="flex space-x-3">
        <c:if test="${order.status == 'PENDING'}">
            <button onclick="confirmOrder(${order.id})" 
                    class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-check mr-2"></i>
                Xác nhận đơn hàng
            </button>
        </c:if>
        <c:if test="${order.status == 'CONFIRM'}">
            <button onclick="updateOrderStatus(${order.id}, 'SHIPPING')" 
                    class="bg-purple-500 hover:bg-purple-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-truck mr-2"></i>
                Chuyển giao hàng
            </button>
        </c:if>
        <c:if test="${order.status == 'SHIPPING'}">
            <button onclick="updateOrderStatus(${order.id}, 'COMPLETE')" 
                    class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-check-circle mr-2"></i>
                Hoàn thành
            </button>
        </c:if>
        <c:if test="${order.status != 'COMPLETE' && order.status != 'CANCEL'}">
            <button onclick="updateOrderStatus(${order.id}, 'CANCEL')" 
                    class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-times mr-2"></i>
                Hủy đơn hàng
            </button>
        </c:if>
    </div>
</div>
>>>>>>> Stashed changes

<!-- Order Info Grid -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
    <!-- Order Information -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
            <i class="fas fa-info-circle text-blue-500 mr-2"></i>
            Thông tin đơn hàng
        </h3>
        <div class="space-y-3">
            <div class="flex justify-between">
                <span class="text-gray-600">Mã đơn hàng:</span>
                <span class="font-medium">#${order.id}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Ngày tạo:</span>
                <span class="font-medium">${order.formattedCreatedAt}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Trạng thái:</span>
                <span>
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
                    </c:choose>
                </span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Tổng tiền:</span>
                <span class="font-bold text-lg text-green-600">
                    <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                </span>
            </div>
        </div>
    </div>

    <!-- Customer Information -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
            <i class="fas fa-user text-green-500 mr-2"></i>
            Thông tin khách hàng
        </h3>
        <div class="space-y-3">
            <div class="flex justify-between">
                <span class="text-gray-600">Tên khách hàng:</span>
                <span class="font-medium">${order.user.fullName}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Email:</span>
                <span class="font-medium">${order.user.email}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Người nhận:</span>
                <span class="font-medium">${order.receiverName}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Số điện thoại:</span>
                <span class="font-medium">${order.receiverPhone}</span>
            </div>
            <div class="pt-2">
                <span class="text-gray-600">Địa chỉ giao hàng:</span>
                <p class="font-medium mt-1">${order.receiverAddress}</p>
            </div>
        </div>
    </div>

    <!-- Payment Information -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
            <i class="fas fa-credit-card text-purple-500 mr-2"></i>
            Thông tin thanh toán
        </h3>
        <div class="space-y-3">
            <div class="flex justify-between">
                <span class="text-gray-600">Phương thức:</span>
                <span>
                    <c:choose>
                        <c:when test="${order.paymentMethod == 'COD'}">
                            <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-orange-100 text-orange-800">
                                <i class="fas fa-money-bill mr-1"></i>
                                Thanh toán khi nhận hàng
                            </span>
                        </c:when>
                        <c:otherwise>
                            <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                <i class="fas fa-credit-card mr-1"></i>
                                Chuyển khoản ngân hàng
                            </span>
                        </c:otherwise>
                    </c:choose>
                </span>
            </div>
            <c:if test="${not empty order.paymentRef}">
                <div class="flex justify-between">
                    <span class="text-gray-600">Mã giao dịch:</span>
                    <span class="font-medium">${order.paymentRef}</span>
                </div>
            </c:if>
            <c:if test="${not empty order.paymentStatus}">
                <div class="flex justify-between">
                    <span class="text-gray-600">Trạng thái thanh toán:</span>
                    <span class="font-medium">
                        <c:choose>
                            <c:when test="${order.paymentStatus == 'PAYMENT_SUCCEED'}">
                                <span class="text-green-600">Thành công</span>
                            </c:when>
                            <c:when test="${order.paymentStatus == 'PAYMENT_FAILED'}">
                                <span class="text-red-600">Thất bại</span>
                            </c:when>
                            <c:otherwise>
                                <span class="text-yellow-600">Chờ xử lý</span>
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </c:if>
        </div>
    </div>
</div>

<!-- Order Items -->
<div class="bg-white rounded-lg shadow-sm overflow-hidden">
    <div class="px-6 py-4 border-b border-gray-200">
        <h3 class="text-lg font-semibold text-gray-800 flex items-center">
            <i class="fas fa-shopping-cart text-indigo-500 mr-2"></i>
            Sản phẩm trong đơn hàng
        </h3>
    </div>
    
    <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Sản phẩm
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Đơn giá
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Số lượng
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Thành tiền
                    </th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <c:forEach var="orderDetail" items="${order.orderDetails}">
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-16 w-16">
                                    <img class="h-16 w-16 rounded-lg object-cover" 
                                         src="/images/product/${orderDetail.product.image}" 
                                         alt="${orderDetail.product.name}">
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium text-gray-900">
                                        ${orderDetail.product.name}
                                    </div>
                                    <div class="text-sm text-gray-500">
                                        ${orderDetail.product.shortDesc}
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">
                                <fmt:formatNumber value="${orderDetail.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">
                                ${orderDetail.quantity}
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-bold text-green-600">
                                <fmt:formatNumber value="${orderDetail.price * orderDetail.quantity}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <!-- Order Summary -->
    <div class="bg-gray-50 px-6 py-4">
        <div class="flex justify-end">
            <div class="w-64">
                <div class="flex justify-between py-2 border-b border-gray-200">
                    <span class="text-gray-600">Tổng số lượng:</span>
                    <span class="font-medium">
                        <c:set var="totalQuantity" value="0" />
                        <c:forEach var="orderDetail" items="${order.orderDetails}">
                            <c:set var="totalQuantity" value="${totalQuantity + orderDetail.quantity}" />
                        </c:forEach>
                        ${totalQuantity} sản phẩm
                    </span>
                </div>
                <div class="flex justify-between py-2">
                    <span class="text-lg font-semibold text-gray-900">Tổng cộng:</span>
                    <span class="text-lg font-bold text-green-600">
                        <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
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
        button.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Đang xử lý...';
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
</script>

<jsp:include page="../layout/footer.jsp" /> 