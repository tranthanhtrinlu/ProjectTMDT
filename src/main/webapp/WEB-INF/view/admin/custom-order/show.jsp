<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageTitle" value="Quản lý đơn hàng custom" />
<jsp:include page="../layout/header.jsp" />

<!-- Header Actions -->
<div class="flex justify-between items-center mb-6">
    <div>
        <h1 class="text-2xl font-bold text-gray-900">Quản lý đơn hàng custom</h1>
        <p class="text-gray-600">Quản lý và cập nhật trạng thái đơn hàng custom</p>
    </div>
</div>

<!-- Custom Orders Table -->
<div class="bg-white rounded-lg shadow-sm overflow-hidden">
    <div class="px-6 py-4 border-b border-gray-200">
        <h3 class="text-lg font-semibold text-gray-800">Danh sách đơn hàng custom</h3>
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
                        Bàn phím cơ sở
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Tổng tiền
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Trạng thái
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
                <c:forEach var="customOrder" items="${customOrders}">
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">#C${customOrder.id}</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm">
                                <div class="font-medium text-gray-900">${customOrder.user.fullName}</div>
                                <div class="text-gray-500">${customOrder.user.email}</div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <img class="h-10 w-10 rounded-full object-cover" 
                                         src="/images/product/${customOrder.baseKeyboard.image}" 
                                         alt="${customOrder.baseKeyboard.name}">
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium text-gray-900">${customOrder.baseKeyboard.name}</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">
                                <fmt:formatNumber value="${customOrder.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <c:choose>
                                <c:when test="${customOrder.status == 'PENDING'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                        <i class="fas fa-clock mr-1"></i>
                                        Đang chờ xử lý
                                    </span>
                                </c:when>
                                <c:when test="${customOrder.status == 'PROCESSING'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">
                                        <i class="fas fa-cog mr-1"></i>
                                        Đang thực hiện
                                    </span>
                                </c:when>
                                <c:when test="${customOrder.status == 'READY'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                        <i class="fas fa-check-circle mr-1"></i>
                                        Hoàn thành
                                    </span>
                                </c:when>
                                <c:when test="${customOrder.status == 'SHIPPED'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-purple-100 text-purple-800">
                                        <i class="fas fa-truck mr-1"></i>
                                        Đã giao hàng
                                    </span>
                                </c:when>
                                <c:when test="${customOrder.status == 'CANCELLED'}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">
                                        <i class="fas fa-times-circle mr-1"></i>
                                        Đã hủy
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-gray-100 text-gray-800">
                                        ${customOrder.status}
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            ${customOrder.formattedCreatedAt}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                            <div class="flex space-x-2">
                                <a href="/admin/custom-order/${customOrder.id}" 
                                   class="text-blue-600 hover:text-blue-900" title="Xem chi tiết">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <c:if test="${customOrder.status == 'PENDING'}">
                                    <button onclick="updateCustomOrderStatus(${customOrder.id}, 'PROCESSING')" 
                                            class="text-blue-600 hover:text-blue-900" title="Bắt đầu thực hiện">
                                        <i class="fas fa-play"></i>
                                    </button>
                                </c:if>
                                <c:if test="${customOrder.status == 'PROCESSING'}">
                                    <button onclick="updateCustomOrderStatus(${customOrder.id}, 'READY')" 
                                            class="text-green-600 hover:text-green-900" title="Hoàn thành">
                                        <i class="fas fa-check"></i>
                                    </button>
                                </c:if>
                                <c:if test="${customOrder.status == 'READY'}">
                                    <button onclick="updateCustomOrderStatus(${customOrder.id}, 'SHIPPED')" 
                                            class="text-purple-600 hover:text-purple-900" title="Giao hàng">
                                        <i class="fas fa-truck"></i>
                                    </button>
                                </c:if>
                                <c:if test="${customOrder.status != 'SHIPPED' && customOrder.status != 'CANCELLED'}">
                                    <button onclick="updateCustomOrderStatus(${customOrder.id}, 'CANCELLED')" 
                                            class="text-red-600 hover:text-red-900" title="Hủy đơn hàng">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </c:if>
                                <button onclick="deleteCustomOrder(${customOrder.id})" 
                                        class="text-red-600 hover:text-red-900" title="Xóa đơn hàng">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
function updateCustomOrderStatus(customOrderId, newStatus) {
    console.log('Updating custom order status - customOrderId:', customOrderId, 'newStatus:', newStatus);
    
    const statusNames = {
        'PENDING': 'Đang chờ xử lý',
        'PROCESSING': 'Đang thực hiện',
        'READY': 'Hoàn thành',
        'SHIPPED': 'Đã giao hàng',
        'CANCELLED': 'Đã hủy'
    };
    
    if (confirm('Bạn có chắc chắn muốn chuyển đơn hàng custom sang trạng thái "' + statusNames[newStatus] + '"?')) {
        // Show loading state
        const button = event.target.closest('button');
        const originalHTML = button.innerHTML;
        button.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
        button.disabled = true;
        
        // Prepare form data
        const formData = new FormData();
        formData.append('customOrderId', customOrderId);
        formData.append('status', newStatus);
        
        console.log('Sending data - customOrderId:', customOrderId, 'status:', newStatus);
        
        // Use AJAX with FormData
        fetch('/admin/custom-order/update-status', {
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

function deleteCustomOrder(customOrderId) {
    console.log('Deleting custom order with ID:', customOrderId);
    
    if (confirm('Bạn có chắc chắn muốn xóa đơn hàng custom này? Hành động này không thể hoàn tác!')) {
        // Show loading state
        const button = event.target.closest('button');
        const originalHTML = button.innerHTML;
        button.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
        button.disabled = true;
        
        fetch('/admin/custom-order/delete/' + customOrderId, {
            method: 'POST'
        })
        .then(response => {
            console.log('Response status:', response.status);
            return response.json();
        })
        .then(data => {
            console.log('Response data:', data);
            if (data.success) {
                alert('Xóa đơn hàng custom thành công');
                location.reload();
            } else {
                alert('Có lỗi xảy ra: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi xóa đơn hàng');
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