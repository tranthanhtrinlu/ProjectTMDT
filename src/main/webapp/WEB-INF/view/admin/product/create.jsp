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
                <title>Create Product - Nông Lam Keyboard</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>
=======
<c:set var="pageTitle" value="Thêm sản phẩm mới" />
<jsp:include page="../layout/header.jsp" />
>>>>>>> Stashed changes

<!-- Header -->
<div class="mb-6">
    <div class="flex items-center justify-between">
        <div>
            <h1 class="text-2xl font-bold text-gray-900">Thêm sản phẩm mới</h1>
            <p class="text-gray-600">Thêm sản phẩm mới vào cửa hàng</p>
        </div>
        <a href="/admin/product" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg flex items-center">
            <i class="fas fa-arrow-left mr-2"></i>
            Quay lại
        </a>
    </div>
</div>

<!-- Create Product Form -->
<div class="bg-white rounded-lg shadow-sm p-6">
    <form:form method="post" action="/admin/product/create" modelAttribute="newProduct" enctype="multipart/form-data" class="space-y-6">
        
        <!-- Basic Information -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Product Name -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Tên sản phẩm <span class="text-red-500">*</span>
                </label>
                <form:input path="name" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                           placeholder="Nhập tên sản phẩm"/>
                <form:errors path="name" cssClass="text-red-500 text-sm mt-1 block"/>
            </div>

<<<<<<< Updated upstream
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Factory:</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="APPLE">Apple (MacBook)</form:option>
                                                        <form:option value="ASUS">Asus</form:option>
                                                        <form:option value="LENOVO">Lenovo</form:option>
                                                        <form:option value="DELL">Dell</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="ACER">Acer</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Target:</label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="GAMING">Gaming</form:option>
                                                        <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng
                                                        </form:option>
                                                        <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                        </form:option>
                                                        <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                        <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Image:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="hoidanitFile" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                        id="avatarPreview" />
                                                </div>
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Create</button>
                                                </div>
                                            </form:form>
=======
            <!-- Factory -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Thương hiệu <span class="text-red-500">*</span>
                </label>
                <form:input path="factory" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                           placeholder="Nhập thương hiệu"/>
                <form:errors path="factory" cssClass="text-red-500 text-sm mt-1 block"/>
            </div>
>>>>>>> Stashed changes

            <!-- Price -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Giá (VNĐ) <span class="text-red-500">*</span>
                </label>
                <form:input path="price" type="number" min="0" step="1000" 
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                           placeholder="Nhập giá sản phẩm"/>
                <form:errors path="price" cssClass="text-red-500 text-sm mt-1 block"/>
            </div>

            <!-- Quantity -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Số lượng <span class="text-red-500">*</span>
                </label>
                <form:input path="quantity" type="number" min="0" 
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                           placeholder="Nhập số lượng"/>
                <form:errors path="quantity" cssClass="text-red-500 text-sm mt-1 block"/>
            </div>

            <!-- Product Type -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Loại sản phẩm <span class="text-red-500">*</span>
                </label>
                <form:select path="type" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                    <option value="">-- Chọn loại sản phẩm --</option>
                    <c:forEach var="type" items="${productTypes}">
                        <form:option value="${type}">${type.getDisplayName()}</form:option>
                    </c:forEach>
                </form:select>
                <form:errors path="type" cssClass="text-red-500 text-sm mt-1 block"/>
            </div>

            <!-- Target -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Đối tượng sử dụng
                </label>
                <form:input path="target" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                           placeholder="Ví dụ: Gaming, Văn phòng, Học tập"/>
                <form:errors path="target" cssClass="text-red-500 text-sm mt-1 block"/>
            </div>

            <!-- Discount -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Giảm giá (%)
                </label>
                <form:input path="discount" type="number" min="0" max="100" 
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                           placeholder="0"/>
                <form:errors path="discount" cssClass="text-red-500 text-sm mt-1 block"/>
                <p class="text-gray-500 text-sm mt-1">Nhập từ 0 đến 100</p>
            </div>

            <!-- Product Image -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Hình ảnh sản phẩm <span class="text-red-500">*</span>
                </label>
                <input type="file" name="keyboardstoreFile" accept="image/*" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500"
                       onchange="previewImage(this)"/>
                <p class="text-gray-500 text-sm mt-1">Chỉ chấp nhận file ảnh (JPG, PNG, GIF)</p>
                
                <!-- Image Preview -->
                <div id="imagePreview" class="mt-4 hidden">
                    <img id="preview" src="#" alt="Preview" class="max-w-xs max-h-48 rounded-lg shadow-md"/>
                </div>
            </div>
        </div>

        <!-- Descriptions -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Short Description -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Mô tả ngắn
                </label>
                <form:textarea path="shortDesc" rows="4" 
                              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                              placeholder="Nhập mô tả ngắn về sản phẩm"/>
                <form:errors path="shortDesc" cssClass="text-red-500 text-sm mt-1 block"/>
            </div>

            <!-- Detail Description -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Mô tả chi tiết
                </label>
                <form:textarea path="detailDesc" rows="4" 
                              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500" 
                              placeholder="Nhập mô tả chi tiết về sản phẩm"/>
                <form:errors path="detailDesc" cssClass="text-red-500 text-sm mt-1 block"/>
            </div>
        </div>

        <!-- Form Actions -->
        <div class="flex items-center justify-end space-x-4 pt-6 border-t">
            <a href="/admin/product" class="bg-gray-500 hover:bg-gray-600 text-white px-6 py-2 rounded-lg">
                Hủy
            </a>
            <button type="submit" class="bg-primary-500 hover:bg-primary-600 text-white px-6 py-2 rounded-lg flex items-center">
                <i class="fas fa-save mr-2"></i>
                Thêm sản phẩm
            </button>
        </div>
    </form:form>
</div>

<script>
function previewImage(input) {
    const preview = document.getElementById('preview');
    const previewContainer = document.getElementById('imagePreview');
    
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

// Form validation
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    const requiredFields = form.querySelectorAll('input[required], select[required]');
    
    form.addEventListener('submit', function(e) {
        let hasErrors = false;
        
        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                field.classList.add('border-red-500');
                hasErrors = true;
            } else {
                field.classList.remove('border-red-500');
            }
        });
        
        if (hasErrors) {
            e.preventDefault();
            alert('Vui lòng điền đầy đủ các trường bắt buộc!');
        }
    });
});
</script>

<jsp:include page="../layout/footer.jsp" /> 