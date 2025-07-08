<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<<<<<<< Updated upstream
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nong Lam - Dự án KeyBoardShop" />
                <meta name="author" content="Nông Lâm" />
                <title>Delete User - Nong Lam</title>
                <link href="/css/styles.css" rel="stylesheet" />
=======
<c:set var="pageTitle" value="Xóa người dùng" />
<jsp:include page="../layout/header.jsp" />
>>>>>>> Stashed changes

<!-- Header -->
<div class="mb-6">
    <div class="flex items-center justify-between">
        <div>
            <h1 class="text-2xl font-bold text-gray-900">Xóa người dùng</h1>
            <p class="text-gray-600">Xác nhận xóa người dùng khỏi hệ thống</p>
        </div>
        <a href="/admin/user" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg flex items-center">
            <i class="fas fa-arrow-left mr-2"></i>
            Quay lại
        </a>
    </div>
</div>

<!-- Warning Alert -->
<div class="bg-red-50 border border-red-200 rounded-lg p-4 mb-6">
    <div class="flex">
        <div class="flex-shrink-0">
            <i class="fas fa-exclamation-triangle text-red-400 text-xl"></i>
        </div>
        <div class="ml-3">
            <h3 class="text-sm font-medium text-red-800">
                Cảnh báo: Hành động không thể hoàn tác
            </h3>
            <div class="mt-2 text-sm text-red-700">
                <p>Việc xóa người dùng sẽ:</p>
                <ul class="list-disc list-inside mt-1">
                    <li>Xóa vĩnh viễn tài khoản người dùng</li>
                    <li>Xóa tất cả dữ liệu liên quan (đơn hàng, đánh giá, v.v.)</li>
                    <li>Không thể khôi phục sau khi thực hiện</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- User Information to Delete -->
<div class="bg-white rounded-lg shadow-sm p-6 mb-6" id="userDeleteInfo">
    <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
        <i class="fas fa-user mr-2 text-red-500"></i>
        Thông tin người dùng sẽ bị xóa
    </h3>
    
    <!-- Loading state -->
    <div id="loadingInfo" class="text-center py-8">
        <i class="fas fa-spinner fa-spin text-2xl text-gray-400"></i>
        <p class="text-gray-500 mt-2">Đang tải thông tin người dùng...</p>
    </div>
    
    <!-- User info will be loaded here -->
    <div id="userInfo" class="hidden">
        <!-- Content will be populated by JavaScript -->
    </div>
</div>

<!-- Confirmation Form -->
<div class="bg-white rounded-lg shadow-sm p-6">
    <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
        <i class="fas fa-check-circle mr-2 text-red-500"></i>
        Xác nhận xóa
    </h3>
    
    <form:form method="post" action="/admin/user/delete" modelAttribute="newUser" class="space-y-6">
        <form:input type="hidden" path="id" value="${id}"/>
        
        <!-- Confirmation Checkbox -->
        <div class="space-y-4">
            <div class="flex items-start">
                <input type="checkbox" id="confirmDelete" required
                       class="mt-1 h-4 w-4 text-red-600 border-gray-300 rounded focus:ring-red-500">
                <label for="confirmDelete" class="ml-2 text-sm text-gray-700">
                    Tôi hiểu rằng việc xóa người dùng này sẽ không thể hoàn tác và tất cả dữ liệu liên quan sẽ bị xóa vĩnh viễn.
                </label>
            </div>
            
            <div class="flex items-start">
                <input type="checkbox" id="confirmBackup" required
                       class="mt-1 h-4 w-4 text-red-600 border-gray-300 rounded focus:ring-red-500">
                <label for="confirmBackup" class="ml-2 text-sm text-gray-700">
                    Tôi đã sao lưu dữ liệu cần thiết (nếu có) trước khi thực hiện xóa.
                </label>
            </div>
        </div>
        
        <!-- Confirmation Text Input -->
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">
                Để xác nhận, vui lòng nhập "XÓA NGƯỜI DÙNG" vào ô bên dưới:
            </label>
            <input type="text" id="confirmText" required
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-red-500 focus:border-red-500" 
                   placeholder="Nhập 'XÓA NGƯỜI DÙNG' để xác nhận"
                   onkeyup="validateConfirmText()"/>
        </div>
        
        <!-- Form Actions -->
        <div class="flex items-center justify-end space-x-4 pt-6 border-t">
            <a href="/admin/user" class="bg-gray-500 hover:bg-gray-600 text-white px-6 py-2 rounded-lg">
                Hủy bỏ
            </a>
            <button type="submit" id="deleteButton" disabled
                    class="bg-red-500 hover:bg-red-600 disabled:bg-gray-300 disabled:cursor-not-allowed text-white px-6 py-2 rounded-lg flex items-center">
                <i class="fas fa-trash mr-2"></i>
                Xóa người dùng
            </button>
        </div>
    </form:form>
</div>

<script>
// Load user information
document.addEventListener('DOMContentLoaded', function() {
    const userId = ${id};
    if (userId) {
        loadUserInfo(userId);
    }
});

function loadUserInfo(userId) {
    fetch('/admin/user/' + userId + '/info')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                displayUserInfo(data.user);
            } else {
                showError('Không thể tải thông tin người dùng: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showError('Có lỗi xảy ra khi tải thông tin người dùng');
        });
}

function displayUserInfo(user) {
    const avatarHtml = user.avatar ? 
        '<img src="/images/avatar/' + user.avatar + '" alt="' + user.fullName + '" class="w-16 h-16 rounded-full object-cover border-2 border-gray-300">' :
        '<div class="w-16 h-16 rounded-full bg-gray-300 flex items-center justify-center border-2 border-gray-300"><i class="fas fa-user text-gray-500"></i></div>';
    
    const roleClass = user.role.name === 'ADMIN' ? 'bg-purple-100 text-purple-800' : 'bg-blue-100 text-blue-800';
    const roleName = user.role.name === 'ADMIN' ? 'Quản trị viên' : 'Người dùng';
    
    const statusClass = user.enabled ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800';
    const statusName = user.enabled ? 'Kích hoạt' : 'Vô hiệu hóa';
    
    const userInfoHtml = 
        '<div class="grid grid-cols-1 md:grid-cols-2 gap-6">' +
            '<div class="flex items-center space-x-4">' +
                avatarHtml +
                '<div>' +
                    '<h4 class="text-lg font-semibold text-gray-900">' + user.fullName + '</h4>' +
                    '<p class="text-gray-600">' + user.email + '</p>' +
                    '<span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium ' + roleClass + '">' +
                        roleName +
                    '</span>' +
                '</div>' +
            '</div>' +
            '<div class="space-y-2">' +
                '<div>' +
                    '<span class="text-sm font-medium text-gray-500">ID:</span>' +
                    '<span class="text-sm text-gray-900">#' + user.id + '</span>' +
                '</div>' +
                '<div>' +
                    '<span class="text-sm font-medium text-gray-500">Số điện thoại:</span>' +
                    '<span class="text-sm text-gray-900">' + (user.phone || 'Chưa cập nhật') + '</span>' +
                '</div>' +
                '<div>' +
                    '<span class="text-sm font-medium text-gray-500">Địa chỉ:</span>' +
                    '<span class="text-sm text-gray-900">' + (user.address || 'Chưa cập nhật') + '</span>' +
                '</div>' +
                '<div>' +
                    '<span class="text-sm font-medium text-gray-500">Trạng thái:</span>' +
                    '<span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium ' + statusClass + '">' +
                        statusName +
                    '</span>' +
                '</div>' +
            '</div>' +
        '</div>';
    
    document.getElementById('loadingInfo').classList.add('hidden');
    document.getElementById('userInfo').innerHTML = userInfoHtml;
    document.getElementById('userInfo').classList.remove('hidden');
}

function showError(message) {
    document.getElementById('loadingInfo').innerHTML = 
        '<div class="text-center py-8">' +
            '<i class="fas fa-exclamation-triangle text-2xl text-red-400"></i>' +
            '<p class="text-red-600 mt-2">' + message + '</p>' +
        '</div>';
}

function validateConfirmText() {
    const confirmText = document.getElementById('confirmText').value;
    const deleteButton = document.getElementById('deleteButton');
    const checkboxes = document.querySelectorAll('input[type="checkbox"]:required');
    
    let allCheckboxesChecked = true;
    checkboxes.forEach(checkbox => {
        if (!checkbox.checked) {
            allCheckboxesChecked = false;
        }
    });
    
    const isTextValid = confirmText === 'XÓA NGƯỜI DÙNG';
    
    deleteButton.disabled = !(allCheckboxesChecked && isTextValid);
    
    // Visual feedback for text input
    const textInput = document.getElementById('confirmText');
    if (confirmText && !isTextValid) {
        textInput.classList.add('border-red-500', 'bg-red-50');
        textInput.classList.remove('border-gray-300');
    } else if (isTextValid) {
        textInput.classList.remove('border-red-500', 'bg-red-50');
        textInput.classList.add('border-green-500', 'bg-green-50');
    } else {
        textInput.classList.remove('border-red-500', 'bg-red-50', 'border-green-500', 'bg-green-50');
        textInput.classList.add('border-gray-300');
    }
}

// Add event listeners for checkboxes
document.addEventListener('DOMContentLoaded', function() {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]:required');
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', validateConfirmText);
    });
});

// Form submission confirmation
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('submit', function(e) {
            if (!confirm('Bạn có chắc chắn muốn xóa người dùng này? Hành động này không thể hoàn tác!')) {
                e.preventDefault();
            }
        });
    }
});
</script>

<jsp:include page="../layout/footer.jsp" /> 