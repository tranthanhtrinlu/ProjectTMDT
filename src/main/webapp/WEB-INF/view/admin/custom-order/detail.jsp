<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageTitle" value="Chi tiết đơn hàng custom #C${customOrder.id}" />
<jsp:include page="../layout/header.jsp" />

<!-- Header with Back Button -->
<div class="flex items-center justify-between mb-6">
    <div class="flex items-center">
        <a href="/admin/custom-order" class="text-gray-600 hover:text-gray-800 mr-4">
            <i class="fas fa-arrow-left text-xl"></i>
        </a>
        <div>
            <h1 class="text-2xl font-bold text-gray-900">Chi tiết đơn hàng custom #C${customOrder.id}</h1>
            <p class="text-gray-600">Thông tin chi tiết về đơn hàng custom</p>
        </div>
    </div>
    <div class="flex space-x-3">
        <c:if test="${customOrder.status == 'PENDING'}">
            <button onclick="updateCustomOrderStatus(${customOrder.id}, 'PROCESSING')" 
                    class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-play mr-2"></i>
                Bắt đầu thực hiện
            </button>
        </c:if>
        <c:if test="${customOrder.status == 'PROCESSING'}">
            <button onclick="updateCustomOrderStatus(${customOrder.id}, 'READY')" 
                    class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-check mr-2"></i>
                Hoàn thành
            </button>
        </c:if>
        <c:if test="${customOrder.status == 'READY'}">
            <button onclick="updateCustomOrderStatus(${customOrder.id}, 'SHIPPED')" 
                    class="bg-purple-500 hover:bg-purple-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-truck mr-2"></i>
                Giao hàng
            </button>
        </c:if>
        <c:if test="${customOrder.status != 'SHIPPED' && customOrder.status != 'CANCELLED'}">
            <button onclick="updateCustomOrderStatus(${customOrder.id}, 'CANCELLED')" 
                    class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-times mr-2"></i>
                Hủy đơn hàng
            </button>
        </c:if>
    </div>
</div>

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
                <span class="font-medium">#C${customOrder.id}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Ngày tạo:</span>
                <span class="font-medium">${customOrder.formattedCreatedAt}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Trạng thái:</span>
                <span>
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
                    </c:choose>
                </span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Tổng tiền:</span>
                <span class="font-bold text-lg text-green-600">
                    <fmt:formatNumber value="${customOrder.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
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
                <span class="font-medium">${customOrder.user.fullName}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Email:</span>
                <span class="font-medium">${customOrder.user.email}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-gray-600">Số điện thoại:</span>
                <span class="font-medium">${customOrder.user.phone}</span>
            </div>
            <div class="pt-2">
                <span class="text-gray-600">Địa chỉ:</span>
                <p class="font-medium mt-1">${customOrder.user.address}</p>
            </div>
        </div>
    </div>

    <!-- Base Keyboard Information -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
            <i class="fas fa-keyboard text-purple-500 mr-2"></i>
            Bàn phím cơ sở
        </h3>
        <div class="space-y-3">
            <div class="flex items-center">
                <div class="flex-shrink-0 h-16 w-16">
                    <img class="h-16 w-16 rounded-lg object-cover" 
                         src="/images/product/${customOrder.baseKeyboard.image}" 
                         alt="${customOrder.baseKeyboard.name}">
                </div>
                <div class="ml-4">
                    <div class="text-sm font-medium text-gray-900">${customOrder.baseKeyboard.name}</div>
                    <div class="text-sm text-gray-500">${customOrder.baseKeyboard.shortDesc}</div>
                    <div class="text-sm font-semibold text-green-600">
                        <fmt:formatNumber value="${customOrder.baseKeyboard.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Customization Details -->
<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
    <!-- Components -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
            <i class="fas fa-cogs text-indigo-500 mr-2"></i>
            Linh kiện đã chọn
        </h3>
        <div class="space-y-4">
            <!-- Keycap -->
            <div class="border-b border-gray-200 pb-3">
                <div class="flex justify-between items-center">
                    <span class="text-gray-600">Keycap:</span>
                    <c:choose>
                        <c:when test="${customOrder.selectedKeycap != null}">
                            <div class="text-right">
                                <div class="font-medium">${customOrder.selectedKeycap.name}</div>
                                <div class="text-sm text-green-600">
                                    <fmt:formatNumber value="${customOrder.selectedKeycap.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <span class="text-gray-400 italic">Không chọn</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <!-- Switch -->
            <div class="border-b border-gray-200 pb-3">
                <div class="flex justify-between items-center">
                    <span class="text-gray-600">Switch:</span>
                    <c:choose>
                        <c:when test="${not empty customOrder.selectedSwitchType}">
                            <span class="font-medium">${customOrder.selectedSwitchType}</span>
                        </c:when>
                        <c:otherwise>
                            <span class="text-gray-400 italic">Không chọn</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <!-- Kit -->
            <div>
                <div class="flex justify-between items-center">
                    <span class="text-gray-600">Kit:</span>
                    <c:choose>
                        <c:when test="${customOrder.selectedKit != null}">
                            <div class="text-right">
                                <div class="font-medium">${customOrder.selectedKit.name}</div>
                                <div class="text-sm text-green-600">
                                    <fmt:formatNumber value="${customOrder.selectedKit.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <span class="text-gray-400 italic">Không chọn</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <!-- Services -->
    <div class="bg-white rounded-lg shadow-sm p-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
            <i class="fas fa-tools text-orange-500 mr-2"></i>
            Dịch vụ đã chọn
        </h3>
        <div class="space-y-3">
            <div class="flex justify-between items-center">
                <span class="text-gray-600">Lubing service:</span>
                <c:choose>
                    <c:when test="${customOrder.lubingService}">
                        <span class="text-green-600 font-medium">
                            <i class="fas fa-check mr-1"></i>
                            Có (75,000₫)
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="text-gray-400">
                            <i class="fas fa-times mr-1"></i>
                            Không
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="flex justify-between items-center">
                <span class="text-gray-600">Stabilizer tuning:</span>
                <c:choose>
                    <c:when test="${customOrder.stabilizerTuning}">
                        <span class="text-green-600 font-medium">
                            <i class="fas fa-check mr-1"></i>
                            Có (40,000₫)
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="text-gray-400">
                            <i class="fas fa-times mr-1"></i>
                            Không
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="flex justify-between items-center">
                <span class="text-gray-600">Keycap customization:</span>
                <c:choose>
                    <c:when test="${customOrder.keycapCustomization}">
                        <span class="text-green-600 font-medium">
                            <i class="fas fa-check mr-1"></i>
                            Có (150,000₫)
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="text-gray-400">
                            <i class="fas fa-times mr-1"></i>
                            Không
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="flex justify-between items-center">
                <span class="text-gray-600">Cable customization:</span>
                <c:choose>
                    <c:when test="${customOrder.cableCustomization}">
                        <span class="text-green-600 font-medium">
                            <i class="fas fa-check mr-1"></i>
                            Có (225,000₫)
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="text-gray-400">
                            <i class="fas fa-times mr-1"></i>
                            Không
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="flex justify-between items-center">
                <span class="text-gray-600">Case modding:</span>
                <c:choose>
                    <c:when test="${customOrder.caseModding}">
                        <span class="text-green-600 font-medium">
                            <i class="fas fa-check mr-1"></i>
                            Có (350,000₫)
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="text-gray-400">
                            <i class="fas fa-times mr-1"></i>
                            Không
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<!-- Custom Notes -->
<c:if test="${not empty customOrder.customNotes}">
    <div class="bg-white rounded-lg shadow-sm p-6 mb-8">
        <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
            <i class="fas fa-sticky-note text-yellow-500 mr-2"></i>
            Ghi chú đặc biệt
        </h3>
        <div class="bg-gray-50 rounded-lg p-4">
            <p class="text-gray-700 whitespace-pre-wrap">${customOrder.customNotes}</p>
        </div>
    </div>
</c:if>

<!-- Order Summary -->
<div class="bg-white rounded-lg shadow-sm overflow-hidden">
    <div class="px-6 py-4 border-b border-gray-200">
        <h3 class="text-lg font-semibold text-gray-800 flex items-center">
            <i class="fas fa-calculator text-indigo-500 mr-2"></i>
            Tổng kết đơn hàng
        </h3>
    </div>
    
    <div class="p-6">
        <div class="space-y-3">
            <div class="flex justify-between">
                <span class="text-gray-600">Bàn phím cơ sở:</span>
                <span class="font-medium">
                    <fmt:formatNumber value="${customOrder.baseKeyboard.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                </span>
            </div>
            
            <c:if test="${customOrder.selectedKeycap != null}">
                <div class="flex justify-between">
                    <span class="text-gray-600">Keycap:</span>
                    <span class="font-medium">
                        <fmt:formatNumber value="${customOrder.selectedKeycap.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                    </span>
                </div>
            </c:if>
            
            <c:if test="${customOrder.selectedKit != null}">
                <div class="flex justify-between">
                    <span class="text-gray-600">Kit:</span>
                    <span class="font-medium">
                        <fmt:formatNumber value="${customOrder.selectedKit.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                    </span>
                </div>
            </c:if>
            
            <c:if test="${customOrder.lubingService}">
                <div class="flex justify-between">
                    <span class="text-gray-600">Lubing service:</span>
                    <span class="font-medium">75,000₫</span>
                </div>
            </c:if>
            
            <c:if test="${customOrder.stabilizerTuning}">
                <div class="flex justify-between">
                    <span class="text-gray-600">Stabilizer tuning:</span>
                    <span class="font-medium">40,000₫</span>
                </div>
            </c:if>
            
            <c:if test="${customOrder.keycapCustomization}">
                <div class="flex justify-between">
                    <span class="text-gray-600">Keycap customization:</span>
                    <span class="font-medium">150,000₫</span>
                </div>
            </c:if>
            
            <c:if test="${customOrder.cableCustomization}">
                <div class="flex justify-between">
                    <span class="text-gray-600">Cable customization:</span>
                    <span class="font-medium">225,000₫</span>
                </div>
            </c:if>
            
            <c:if test="${customOrder.caseModding}">
                <div class="flex justify-between">
                    <span class="text-gray-600">Case modding:</span>
                    <span class="font-medium">350,000₫</span>
                </div>
            </c:if>
            
            <div class="border-t border-gray-200 pt-3">
                <div class="flex justify-between">
                    <span class="text-lg font-semibold text-gray-900">Tổng cộng:</span>
                    <span class="text-lg font-bold text-green-600">
                        <fmt:formatNumber value="${customOrder.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                    </span>
                </div>
            </div>
        </div>
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
        button.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Đang xử lý...';
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
</script>

<jsp:include page="../layout/footer.jsp" />