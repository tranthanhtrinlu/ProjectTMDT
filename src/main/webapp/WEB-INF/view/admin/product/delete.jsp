<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<<<<<<< Updated upstream
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nong Lam - Dự án KeyBoardShop" />
                <meta name="author" content="Nông Lâm" />
                <title>Delete Product - Nong Lam Keyboard</title>
                <link href="/css/styles.css" rel="stylesheet" />
=======
<c:set var="pageTitle" value="Xóa sản phẩm" />
<jsp:include page="../layout/header.jsp" />
>>>>>>> Stashed changes

<!-- Header -->
<div class="mb-6">
    <div class="flex items-center justify-between">
        <div>
            <h1 class="text-2xl font-bold text-gray-900">Xóa sản phẩm</h1>
            <p class="text-gray-600">Xác nhận xóa sản phẩm khỏi hệ thống</p>
        </div>
        <a href="/admin/product" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg flex items-center">
            <i class="fas fa-arrow-left mr-2"></i>
            Quay lại
        </a>
    </div>
</div>

<!-- Delete Confirmation -->
<div class="bg-white rounded-lg shadow-sm p-6">
    <div class="bg-red-50 border border-red-200 rounded-lg p-6 mb-6">
        <div class="flex items-center mb-4">
            <i class="fas fa-exclamation-triangle text-red-500 text-2xl mr-3"></i>
            <h3 class="text-lg font-semibold text-red-800">Cảnh báo</h3>
        </div>
        <p class="text-red-700 mb-2">
            Bạn có chắc chắn muốn xóa sản phẩm này không?
        </p>
        <p class="text-red-600 text-sm">
            <strong>Lưu ý:</strong> Hành động này không thể hoàn tác. Sản phẩm sẽ bị xóa vĩnh viễn khỏi hệ thống.
        </p>
    </div>

    <!-- Product Information Display -->
    <div class="bg-gray-50 rounded-lg p-6 mb-6">
        <h4 class="text-lg font-semibold text-gray-800 mb-4">Thông tin sản phẩm sẽ bị xóa:</h4>
        
        <c:if test="${not empty product}">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Product Image -->
                <div class="flex justify-center">
                    <c:choose>
                        <c:when test="${not empty product.image}">
                            <img src="/images/product/${product.image}" alt="${product.name}" 
                                 class="max-w-xs max-h-48 rounded-lg shadow-md"/>
                        </c:when>
                        <c:otherwise>
                            <div class="flex flex-col items-center justify-center w-48 h-48 bg-gray-200 rounded-lg">
                                <i class="fas fa-image text-4xl text-gray-400 mb-2"></i>
                                <p class="text-gray-500 text-sm">Không có ảnh</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <!-- Product Details -->
                <div class="space-y-3">
                    <div>
                        <span class="text-sm font-medium text-gray-600">ID:</span>
                        <span class="ml-2 text-gray-900 font-semibold">#${product.id}</span>
                    </div>
                    <div>
                        <span class="text-sm font-medium text-gray-600">Tên sản phẩm:</span>
                        <span class="ml-2 text-gray-900 font-semibold">${product.name}</span>
                    </div>
                    <div>
                        <span class="text-sm font-medium text-gray-600">Thương hiệu:</span>
                        <span class="ml-2 text-gray-900">${product.factory}</span>
                    </div>
                    <div>
                        <span class="text-sm font-medium text-gray-600">Giá:</span>
                        <span class="ml-2 text-gray-900 font-semibold">
                            <fmt:formatNumber value="${product.price}" pattern="#,###" /> ₫
                        </span>
                    </div>
                    <div>
                        <span class="text-sm font-medium text-gray-600">Số lượng:</span>
                        <span class="ml-2 text-gray-900">${product.quantity}</span>
                    </div>
                    <div>
                        <span class="text-sm font-medium text-gray-600">Loại:</span>
                        <span class="ml-2 text-gray-900">
                            <c:choose>
                                <c:when test="${not empty product.type}">
                                    ${product.type.getDisplayName()}
                                </c:when>
                                <c:otherwise>
                                    Chưa phân loại
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                    <c:if test="${product.discount > 0}">
                        <div>
                            <span class="text-sm font-medium text-gray-600">Giảm giá:</span>
                            <span class="ml-2 text-gray-900">${product.discount}%</span>
                        </div>
                    </c:if>
                </div>
            </div>
            
            <c:if test="${not empty product.shortDesc}">
                <div class="mt-4 pt-4 border-t">
                    <span class="text-sm font-medium text-gray-600">Mô tả ngắn:</span>
                    <p class="mt-2 text-gray-900 leading-relaxed">${product.shortDesc}</p>
                </div>
            </c:if>
        </c:if>
        
        <c:if test="${empty product}">
            <div class="text-center py-8">
                <i class="fas fa-exclamation-triangle text-4xl text-yellow-500 mb-4"></i>
                <p class="text-gray-600">Không tìm thấy thông tin sản phẩm!</p>
            </div>
        </c:if>
    </div>

    <!-- Delete Form -->
    <form:form method="post" action="/admin/product/delete" modelAttribute="newProduct">
        <form:hidden path="id" value="${id}"/>
        
        <div class="flex items-center justify-end space-x-4">
            <a href="/admin/product" class="bg-gray-500 hover:bg-gray-600 text-white px-6 py-2 rounded-lg flex items-center">
                <i class="fas fa-times mr-2"></i>
                Hủy bỏ
            </a>
            <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-6 py-2 rounded-lg flex items-center"
                    onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không? Hành động này không thể hoàn tác!')">
                <i class="fas fa-trash mr-2"></i>
                Xác nhận xóa
            </button>
        </div>
    </form:form>
</div>

<script>
// Add additional confirmation
document.addEventListener('DOMContentLoaded', function() {
    const deleteForm = document.querySelector('form');
    const deleteButton = deleteForm.querySelector('button[type="submit"]');
    
    deleteButton.addEventListener('click', function(e) {
        e.preventDefault();
        
        // Double confirmation
        const firstConfirm = confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');
        if (firstConfirm) {
            const secondConfirm = confirm('Hành động này không thể hoàn tác. Bạn có thực sự muốn tiếp tục?');
            if (secondConfirm) {
                deleteForm.submit();
            }
        }
    });
});
</script>

<jsp:include page="../layout/footer.jsp" /> 