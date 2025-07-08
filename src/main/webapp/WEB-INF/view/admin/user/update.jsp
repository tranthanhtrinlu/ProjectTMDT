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
                <title>Update User - Nong Lam</title>
                <link href="/css/styles.css" rel="stylesheet" />
=======
<c:set var="pageTitle" value="Chỉnh sửa người dùng" />
<jsp:include page="../layout/header.jsp" />
>>>>>>> Stashed changes

<!-- Header -->
<div class="mb-6">
    <div class="flex items-center justify-between">
        <div>
            <h1 class="text-2xl font-bold text-gray-900">Chỉnh sửa người dùng</h1>
            <p class="text-gray-600">Cập nhật thông tin người dùng trong hệ thống</p>
        </div>
        <a href="/admin/user" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg flex items-center">
            <i class="fas fa-arrow-left mr-2"></i>
            Quay lại
        </a>
    </div>
</div>

<!-- Flash Messages -->
<c:if test="${not empty error}">
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
        <i class="fas fa-exclamation-circle mr-2"></i>
        ${error}
    </div>
</c:if>

<c:if test="${not empty success}">
    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
        <i class="fas fa-check-circle mr-2"></i>
        ${success}
    </div>
</c:if>

<!-- Update User Form -->
<div class="bg-white rounded-lg shadow-sm p-6">
    <form id="updateUserForm" enctype="multipart/form-data" class="space-y-6" data-user-id="${newUser.id}">
        <input type="hidden" name="id" value="${newUser.id}"/>
        
        <!-- Current Avatar Display -->
        <div class="mb-6">
            <label class="block text-sm font-medium text-gray-700 mb-2">
                Ảnh đại diện hiện tại
            </label>
            <div class="flex items-center space-x-4">
                <c:choose>
                    <c:when test="${not empty newUser.avatar}">
                        <img src="/images/avatar/${newUser.avatar}" alt="Current Avatar" 
                             class="w-20 h-20 rounded-full object-cover border-2 border-gray-300"/>
                    </c:when>
                    <c:otherwise>
                        <div class="w-20 h-20 rounded-full bg-gray-300 flex items-center justify-center border-2 border-gray-300">
                            <i class="fas fa-user text-gray-500 text-xl"></i>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div>
                    <p class="text-sm text-gray-600">
                        <c:choose>
                            <c:when test="${not empty newUser.avatar}">
                                ${newUser.avatar}
                            </c:when>
                            <c:otherwise>
                                Chưa có ảnh đại diện
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </div>
        </div>
        
        <!-- Basic Information -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Full Name -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Họ và tên <span class="text-red-500">*</span>
                </label>
                <input type="text" name="fullName" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                       placeholder="Nhập họ và tên"
                       value="${newUser.fullName}"/>
            </div>

            <!-- Email -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Email <span class="text-red-500">*</span>
                </label>
                <input type="email" name="email" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                       placeholder="Nhập địa chỉ email"
                       value="${newUser.email}"/>
            </div>

            <!-- Phone -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Số điện thoại
                </label>
                <input type="tel" name="phone"
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                       placeholder="Nhập số điện thoại"
                       value="${newUser.phone}"/>
            </div>

            <!-- Role -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Vai trò <span class="text-red-500">*</span>
                </label>
                <select name="role" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                    <option value="">-- Chọn vai trò --</option>
                    <option value="USER" ${newUser.role.name == 'USER' ? 'selected' : ''}>Người dùng</option>
                    <option value="ADMIN" ${newUser.role.name == 'ADMIN' ? 'selected' : ''}>Quản trị viên</option>
                </select>
            </div>

            <!-- Status -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Trạng thái tài khoản <span class="text-red-500">*</span>
                </label>
                <select name="enabled" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                    <option value="true" ${newUser.enabled ? 'selected' : ''}>Kích hoạt</option>
                    <option value="false" ${!newUser.enabled ? 'selected' : ''}>Vô hiệu hóa</option>
                </select>
            </div>

            <!-- New Avatar -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Ảnh đại diện mới (tùy chọn)
                </label>
                <input type="file" name="keyboardstoreFile" accept="image/*"
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500"
                       onchange="previewAvatar(this)"/>
                <p class="text-gray-500 text-sm mt-1">Chỉ chấp nhận file ảnh (JPG, PNG, GIF)</p>
                
                <!-- New Avatar Preview -->
                <div id="avatarPreview" class="mt-4 hidden">
                    <img id="preview" src="#" alt="New Avatar Preview" class="w-24 h-24 rounded-full object-cover shadow-md"/>
                </div>
            </div>
        </div>

        <!-- Address -->
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">
                Địa chỉ
            </label>
            <textarea name="address" rows="3"
                      class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                      placeholder="Nhập địa chỉ">${newUser.address}</textarea>
        </div>

        <!-- Password Reset Section -->
        <div class="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
            <h3 class="text-sm font-medium text-yellow-800 mb-2">
                <i class="fas fa-info-circle mr-2"></i>
                Thông tin mật khẩu
            </h3>
            <p class="text-sm text-yellow-700">
                Mật khẩu hiện tại sẽ được giữ nguyên. Để thay đổi mật khẩu, người dùng có thể sử dụng chức năng "Quên mật khẩu" hoặc đăng nhập và thay đổi trong trang cá nhân.
            </p>
        </div>

        <!-- Form Actions -->
        <div class="flex items-center justify-end space-x-4 pt-6 border-t">
            <a href="/admin/user" class="bg-gray-500 hover:bg-gray-600 text-white px-6 py-2 rounded-lg">
                Hủy
            </a>
            <button type="submit" class="bg-primary-500 hover:bg-primary-600 text-white px-6 py-2 rounded-lg flex items-center">
                <i class="fas fa-save mr-2"></i>
                <span id="submitText">Cập nhật người dùng</span>
            </button>
        </div>
    </form>
</div>

<script>
function previewAvatar(input) {
    const preview = document.getElementById('preview');
    const previewContainer = document.getElementById('avatarPreview');
    
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
            preview.src = e.target.result;
            previewContainer.classList.remove('hidden');
        };
        
        reader.readAsDataURL(input.files[0]);
    } else {
        previewContainer.classList.add('hidden');
    }
}

// Form submission with AJAX
document.getElementById('updateUserForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const submitButton = e.target.querySelector('button[type="submit"]');
    const submitText = document.getElementById('submitText');
    const originalText = submitText.textContent;
    
    // Show loading state
    submitButton.disabled = true;
    submitText.textContent = 'Đang cập nhật...';
    
    const formData = new FormData(this);
    let userId = formData.get('id');
    
    // Alternative way to get user ID if first method fails
    if (!userId) {
        userId = this.getAttribute('data-user-id');
    }
    
    // Debug: Check if userId is valid
    console.log('User ID from form:', formData.get('id'));
    console.log('User ID from data attribute:', this.getAttribute('data-user-id'));
    console.log('Final User ID:', userId);
    
    if (!userId) {
        alert('Lỗi: Không tìm thấy ID người dùng!');
        return;
    }
    
    fetch('/admin/user/update/' + userId, {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Cập nhật người dùng thành công!');
            window.location.href = '/admin/user';
        } else {
            alert('Lỗi: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Có lỗi xảy ra khi cập nhật người dùng!');
    })
    .finally(() => {
        // Reset button state
        submitButton.disabled = false;
        submitText.textContent = originalText;
    });
});

// Form validation
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('updateUserForm');
    const requiredFields = form.querySelectorAll('input[required], select[required]');
    
    requiredFields.forEach(field => {
        field.addEventListener('blur', function() {
            if (!this.value.trim()) {
                this.classList.add('border-red-500');
            } else {
                this.classList.remove('border-red-500');
            }
        });
        
        field.addEventListener('input', function() {
            if (this.value.trim()) {
                this.classList.remove('border-red-500');
            }
        });
    });
    
    // Email validation
    const emailField = form.querySelector('input[name="email"]');
    emailField.addEventListener('blur', function() {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (this.value && !emailRegex.test(this.value)) {
            this.classList.add('border-red-500');
            alert('Vui lòng nhập địa chỉ email hợp lệ!');
        }
    });
});
</script>

<jsp:include page="../layout/footer.jsp" /> 