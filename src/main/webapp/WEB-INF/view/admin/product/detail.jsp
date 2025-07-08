<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<<<<<<< Updated upstream
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nong Lam - Dự án KeyBoardShop" />
                <meta name="author" content="Nong Lam" />
                <title>Detail Product - Nong Lam KeyBoard</title>
                <link href="/css/styles.css" rel="stylesheet" />
=======
<c:set var="pageTitle" value="Chi tiết sản phẩm" />
<jsp:include page="../layout/header.jsp" />
>>>>>>> Stashed changes

<!-- Header -->
<div class="mb-6">
    <div class="flex items-center justify-between">
        <div>
            <h1 class="text-2xl font-bold text-gray-900">Chi tiết sản phẩm</h1>
            <p class="text-gray-600">Xem thông tin chi tiết sản phẩm</p>
        </div>
        <div class="flex space-x-3">
            <a href="/admin/product/update/${product.id}" class="bg-primary-500 hover:bg-primary-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-edit mr-2"></i>
                Chỉnh sửa
            </a>
            <a href="/admin/product" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-arrow-left mr-2"></i>
                Quay lại
            </a>
        </div>
    </div>
</div>

<!-- Product Detail -->
<div class="bg-white rounded-lg shadow-sm p-6">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
        
        <!-- Product Image -->
        <div>
            <div class="bg-gray-50 rounded-lg p-6 text-center">
                <c:choose>
                    <c:when test="${not empty product.image}">
                        <img src="/images/product/${product.image}" alt="${product.name}" 
                             class="max-w-full max-h-96 mx-auto rounded-lg shadow-md"/>
                    </c:when>
                    <c:otherwise>
                        <div class="flex flex-col items-center justify-center h-64">
                            <i class="fas fa-image text-6xl text-gray-300 mb-4"></i>
                            <p class="text-gray-500">Không có hình ảnh</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Product Information -->
        <div class="space-y-6">
            
            <!-- Basic Info -->
            <div>
                <h2 class="text-2xl font-bold text-gray-900 mb-4">${product.name}</h2>
                
                <div class="space-y-4">
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <span class="text-sm font-medium text-gray-600">ID:</span>
                            <p class="text-gray-900 font-semibold">#${product.id}</p>
                        </div>
                        <div>
                            <span class="text-sm font-medium text-gray-600">Thương hiệu:</span>
                            <p class="text-gray-900 font-semibold">${product.factory}</p>
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <span class="text-sm font-medium text-gray-600">Giá bán:</span>
                            <p class="text-2xl font-bold text-primary-600">
                                <fmt:formatNumber value="${product.price}" pattern="#,###" /> ₫
                            </p>
                        </div>
                        <div>
                            <span class="text-sm font-medium text-gray-600">Số lượng:</span>
                            <p class="text-gray-900 font-semibold">
                                ${product.quantity}
                                <c:choose>
                                    <c:when test="${product.quantity == 0}">
                                        <span class="ml-2 inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                            Hết hàng
                                        </span>
                                    </c:when>
                                    <c:when test="${product.quantity <= 10}">
                                        <span class="ml-2 inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">
                                            Sắp hết
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="ml-2 inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                            Còn hàng
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <span class="text-sm font-medium text-gray-600">Loại sản phẩm:</span>
                            <p class="text-gray-900 font-semibold">
                                <c:choose>
                                    <c:when test="${not empty product.type}">
                                        ${product.type.getDisplayName()}
                                    </c:when>
                                    <c:otherwise>
                                        Chưa phân loại
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <div>
                            <span class="text-sm font-medium text-gray-600">Đối tượng:</span>
                            <p class="text-gray-900 font-semibold">
                                <c:choose>
                                    <c:when test="${not empty product.target}">
                                        ${product.target}
                                    </c:when>
                                    <c:otherwise>
                                        Chưa xác định
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>

                    <c:if test="${product.discount > 0}">
                        <div>
                            <span class="text-sm font-medium text-gray-600">Giảm giá:</span>
                            <p class="text-gray-900 font-semibold">
                                ${product.discount}%
                                <span class="ml-2 inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                    Đang giảm giá
                                </span>
                            </p>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- Descriptions -->
            <div class="border-t pt-6">
                <h3 class="text-lg font-semibold text-gray-900 mb-4">Mô tả sản phẩm</h3>
                
                <c:if test="${not empty product.shortDesc}">
                    <div class="mb-4">
                        <h4 class="text-sm font-medium text-gray-600 mb-2">Mô tả ngắn:</h4>
                        <p class="text-gray-900 leading-relaxed">${product.shortDesc}</p>
                    </div>
                </c:if>
                
                <c:if test="${not empty product.detailDesc}">
                    <div>
                        <h4 class="text-sm font-medium text-gray-600 mb-2">Mô tả chi tiết:</h4>
                        <p class="text-gray-900 leading-relaxed">${product.detailDesc}</p>
                    </div>
                </c:if>
                
                <c:if test="${empty product.shortDesc && empty product.detailDesc}">
                    <p class="text-gray-500 italic">Chưa có mô tả cho sản phẩm này.</p>
                </c:if>
            </div>

            <!-- Action Buttons -->
            <div class="border-t pt-6">
                <div class="flex space-x-3">
                    <a href="/admin/product/update/${product.id}" class="bg-primary-500 hover:bg-primary-600 text-white px-4 py-2 rounded-lg flex items-center">
                        <i class="fas fa-edit mr-2"></i>
                        Chỉnh sửa
                    </a>
                    <a href="/admin/product/delete/${product.id}" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg flex items-center">
                        <i class="fas fa-trash mr-2"></i>
                        Xóa
                    </a>
                    <a href="/product/${product.id}" target="_blank" class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded-lg flex items-center">
                        <i class="fas fa-external-link-alt mr-2"></i>
                        Xem trên website
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Additional Information -->
<div class="bg-white rounded-lg shadow-sm p-6 mt-6">
    <h3 class="text-lg font-semibold text-gray-900 mb-4">Thông tin bổ sung</h3>
    
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="bg-gray-50 rounded-lg p-4">
            <h4 class="text-sm font-medium text-gray-600 mb-2">Trạng thái bán hàng</h4>
            <c:choose>
                <c:when test="${product.quantity > 0}">
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                        <i class="fas fa-check-circle mr-1"></i>
                        Đang bán
                    </span>
                </c:when>
                <c:otherwise>
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-red-100 text-red-800">
                        <i class="fas fa-times-circle mr-1"></i>
                        Hết hàng
                    </span>
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="bg-gray-50 rounded-lg p-4">
            <h4 class="text-sm font-medium text-gray-600 mb-2">Giá sau giảm</h4>
            <c:choose>
                <c:when test="${product.discount > 0}">
                    <p class="text-lg font-bold text-red-600">
                        <fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="#,###" /> ₫
                    </p>
                </c:when>
                <c:otherwise>
                    <p class="text-lg font-bold text-gray-900">
                        <fmt:formatNumber value="${product.price}" pattern="#,###" /> ₫
                    </p>
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="bg-gray-50 rounded-lg p-4">
            <h4 class="text-sm font-medium text-gray-600 mb-2">Tình trạng kho</h4>
            <c:choose>
                <c:when test="${product.quantity >= 50}">
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                        <i class="fas fa-warehouse mr-1"></i>
                        Dồi dào
                    </span>
                </c:when>
                <c:when test="${product.quantity >= 10}">
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-yellow-100 text-yellow-800">
                        <i class="fas fa-exclamation-triangle mr-1"></i>
                        Bình thường
                    </span>
                </c:when>
                <c:when test="${product.quantity > 0}">
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-orange-100 text-orange-800">
                        <i class="fas fa-low-vision mr-1"></i>
                        Sắp hết
                    </span>
                </c:when>
                <c:otherwise>
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-red-100 text-red-800">
                        <i class="fas fa-ban mr-1"></i>
                        Hết hàng
                    </span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" /> 