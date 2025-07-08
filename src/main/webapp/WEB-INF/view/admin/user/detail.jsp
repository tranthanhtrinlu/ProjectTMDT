<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<<<<<<< Updated upstream
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nong Lam - Dự án KeyBoardShop" />
                <meta name="author" content="Nông Lâm" />
                <title>Detail User - Nong Lam</title>
                <link href="/css/styles.css" rel="stylesheet" />
=======
<c:set var="pageTitle" value="Chi tiết người dùng" />
<jsp:include page="../layout/header.jsp" />
>>>>>>> Stashed changes

<!-- Header -->
<div class="mb-6">
    <div class="flex items-center justify-between">
        <div>
            <h1 class="text-2xl font-bold text-gray-900">Chi tiết người dùng</h1>
            <p class="text-gray-600">Thông tin chi tiết về người dùng trong hệ thống</p>
        </div>
        <div class="flex space-x-3">
            <a href="/admin/user/update/${user.id}" class="bg-primary-500 hover:bg-primary-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-edit mr-2"></i>
                Chỉnh sửa
            </a>
            <a href="/admin/user" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-arrow-left mr-2"></i>
                Quay lại
            </a>
        </div>
    </div>
</div>

<!-- User Information -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
    
    <!-- User Profile Card -->
    <div class="lg:col-span-1">
        <div class="bg-white rounded-lg shadow-sm p-6">
            <div class="text-center">
                <!-- Avatar -->
                <div class="mx-auto w-32 h-32 mb-4">
                    <c:choose>
                        <c:when test="${not empty user.avatar}">
                            <img class="w-32 h-32 rounded-full object-cover border-4 border-primary-500" 
                                 src="/images/avatar/${user.avatar}" 
                                 alt="${user.fullName}">
                        </c:when>
                        <c:otherwise>
                            <div class="w-32 h-32 rounded-full bg-gray-300 flex items-center justify-center border-4 border-primary-500">
                                <i class="fas fa-user text-4xl text-gray-500"></i>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <!-- Basic Info -->
                <h2 class="text-xl font-bold text-gray-800">${user.fullName}</h2>
                <p class="text-gray-600 mb-2">${user.email}</p>
                
                <!-- Status Badge -->
                <c:choose>
                    <c:when test="${user.enabled}">
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                            <i class="fas fa-check-circle mr-1"></i>
                            Kích hoạt
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-red-100 text-red-800">
                            <i class="fas fa-times-circle mr-1"></i>
                            Vô hiệu hóa
                        </span>
                    </c:otherwise>
                </c:choose>
                
                <!-- Role Badge -->
                <div class="mt-2">
                    <c:choose>
                        <c:when test="${user.role.name == 'ADMIN'}">
                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-purple-100 text-purple-800">
                                <i class="fas fa-shield-alt mr-1"></i>
                                Quản trị viên
                            </span>
                        </c:when>
                        <c:otherwise>
                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800">
                                <i class="fas fa-user mr-1"></i>
                                Người dùng
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <!-- Quick Actions -->
            <div class="mt-6 space-y-3">
                <a href="/admin/user/update/${user.id}" 
                   class="w-full bg-primary-500 hover:bg-primary-600 text-white px-4 py-2 rounded-lg flex items-center justify-center">
                    <i class="fas fa-edit mr-2"></i>
                    Chỉnh sửa thông tin
                </a>
                <c:if test="${user.enabled}">
                    <button onclick="toggleUserStatus(false)" data-user-id="${user.id}" data-enabled="false"
                            class="w-full bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg flex items-center justify-center">
                        <i class="fas fa-ban mr-2"></i>
                        Vô hiệu hóa tài khoản
                    </button>
                </c:if>
                <c:if test="${!user.enabled}">
                    <button onclick="toggleUserStatus(true)" data-user-id="${user.id}" data-enabled="true"
                            class="w-full bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded-lg flex items-center justify-center">
                        <i class="fas fa-check mr-2"></i>
                        Kích hoạt tài khoản
                    </button>
                </c:if>
            </div>
        </div>
    </div>
    
    <!-- Detailed Information -->
    <div class="lg:col-span-2 space-y-6">
        
        <!-- Personal Information -->
        <div class="bg-white rounded-lg shadow-sm p-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
                <i class="fas fa-user mr-2 text-primary-500"></i>
                Thông tin cá nhân
            </h3>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-500">ID người dùng</label>
                    <p class="text-lg text-gray-900">#${user.id}</p>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-500">Họ và tên</label>
                    <p class="text-lg text-gray-900">${user.fullName}</p>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-500">Email</label>
                    <p class="text-lg text-gray-900">${user.email}</p>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-500">Số điện thoại</label>
                    <p class="text-lg text-gray-900">
                        <c:choose>
                            <c:when test="${not empty user.phone}">${user.phone}</c:when>
                            <c:otherwise><span class="text-gray-400">Chưa cập nhật</span></c:otherwise>
                        </c:choose>
                    </p>
                </div>
                
                <div class="md:col-span-2">
                    <label class="block text-sm font-medium text-gray-500">Địa chỉ</label>
                    <p class="text-lg text-gray-900">
                        <c:choose>
                            <c:when test="${not empty user.address}">${user.address}</c:when>
                            <c:otherwise><span class="text-gray-400">Chưa cập nhật</span></c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </div>
        </div>
        
        <!-- Account Information -->
        <div class="bg-white rounded-lg shadow-sm p-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
                <i class="fas fa-cog mr-2 text-primary-500"></i>
                Thông tin tài khoản
            </h3>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-500">Vai trò</label>
                    <p class="text-lg text-gray-900">
                        <c:choose>
                            <c:when test="${user.role.name == 'ADMIN'}">
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-purple-100 text-purple-800">
                                    <i class="fas fa-shield-alt mr-1"></i>
                                    Quản trị viên
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800">
                                    <i class="fas fa-user mr-1"></i>
                                    Người dùng
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-500">Trạng thái</label>
                    <p class="text-lg text-gray-900">
                        <c:choose>
                            <c:when test="${user.enabled}">
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                                    <i class="fas fa-check-circle mr-1"></i>
                                    Kích hoạt
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-red-100 text-red-800">
                                    <i class="fas fa-times-circle mr-1"></i>
                                    Vô hiệu hóa
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-500">Ảnh đại diện</label>
                    <p class="text-lg text-gray-900">
                        <c:choose>
                            <c:when test="${not empty user.avatar}">
                                <span class="text-green-600">
                                    <i class="fas fa-check mr-1"></i>
                                    ${user.avatar}
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="text-gray-400">
                                    <i class="fas fa-times mr-1"></i>
                                    Chưa có
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-500">Ngày tạo</label>
                    <p class="text-lg text-gray-900">
                        <span class="text-gray-400">Không có thông tin</span>
                    </p>
                </div>
            </div>
        </div>
        
        <!-- Activity Summary -->
        <div class="bg-white rounded-lg shadow-sm p-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
                <i class="fas fa-chart-line mr-2 text-primary-500"></i>
                Tổng quan hoạt động
            </h3>
            
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="text-center p-4 bg-blue-50 rounded-lg">
                    <div class="text-2xl font-bold text-blue-600">0</div>
                    <div class="text-sm text-blue-800">Đơn hàng</div>
                </div>
                
                <div class="text-center p-4 bg-green-50 rounded-lg">
                    <div class="text-2xl font-bold text-green-600">0</div>
                    <div class="text-sm text-green-800">Đánh giá</div>
                </div>
                
                <div class="text-center p-4 bg-yellow-50 rounded-lg">
                    <div class="text-2xl font-bold text-yellow-600">0</div>
                    <div class="text-sm text-yellow-800">Sản phẩm yêu thích</div>
                </div>
            </div>
            
            <div class="mt-4 text-center">
                <p class="text-sm text-gray-500">
                    <i class="fas fa-info-circle mr-1"></i>
                    Thống kê chi tiết sẽ được cập nhật trong phiên bản tiếp theo
                </p>
            </div>
        </div>
    </div>
</div>

<script>
// Hardcode userId from JSP to avoid any issues
const USER_ID = '${user.id}';
console.log('=== Script loaded ===');
console.log('Hardcoded USER_ID from JSP:', USER_ID);

function toggleUserStatus(enabled) {
    console.log('=== toggleUserStatus called ===');
    console.log('enabled:', enabled);
    console.log('USER_ID constant:', USER_ID);
    
    // Use the hardcoded USER_ID first
    let userId = USER_ID;
    
    // If JSP didn't work (returns literal string), parse from URL
    if (!userId || userId === '${user.id}' || userId === 'null' || userId === '') {
        console.log('JSP USER_ID failed, parsing from URL');
        const urlParts = window.location.pathname.split('/');
        for (let i = 0; i < urlParts.length; i++) {
            if (urlParts[i] === 'user' && i + 1 < urlParts.length) {
                userId = urlParts[i + 1];
                break;
            }
        }
        console.log('Parsed userId from URL:', userId);
    }
    
    console.log('Final userId to use:', userId);
    
    if (!userId || userId === 'null' || userId === '') {
        alert('Lỗi: Không tìm thấy ID người dùng!');
        return;
    }
    
    const action = enabled ? 'kích hoạt' : 'vô hiệu hóa';
    
    if (confirm('Bạn có chắc chắn muốn ' + action + ' tài khoản này?')) {
        const button = event.target.closest('button');
        const originalHTML = button.innerHTML;
        button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
        button.disabled = true;
        
        // Build URL with explicit string concatenation
        const url = '/admin/user/' + userId + '/toggle-status';
        console.log('Making request to URL:', url);
        
        fetch(url, {
            method: 'POST'
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
                location.reload();
            } else {
                alert('Lỗi: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi thay đổi trạng thái');
        })
        .finally(() => {
            button.innerHTML = originalHTML;
            button.disabled = false;
        });
    }
}

// Simple page load setup
document.addEventListener('DOMContentLoaded', function() {
    console.log('=== Page loaded ===');
    console.log('Current URL:', window.location.pathname);
    console.log('USER_ID set to:', USER_ID);
});
</script>

<jsp:include page="../layout/footer.jsp" /> 