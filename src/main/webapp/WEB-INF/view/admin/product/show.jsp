<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageTitle" value="Quản lý sản phẩm" />
<jsp:include page="../layout/header.jsp" />

<<<<<<< Updated upstream
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nong Lam - Dự án KeyBoardShop" />
                <meta name="author" content="Nong Lam" />
                <title>Dashboard - Nong Lam KeyBoard</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>
=======
<!-- Header Actions -->
<div class="flex justify-between items-center mb-6">
    <div>
        <h1 class="text-2xl font-bold text-gray-900">Quản lý sản phẩm</h1>
        <p class="text-gray-600">Quản lý toàn bộ sản phẩm trong cửa hàng</p>
    </div>
    <a href="/admin/product/create" class="bg-primary-500 hover:bg-primary-600 text-white px-4 py-2 rounded-lg flex items-center">
        <i class="fas fa-plus mr-2"></i>
        Thêm sản phẩm
    </a>
</div>
>>>>>>> Stashed changes

<!-- Filters -->
<div class="bg-white rounded-lg shadow-sm p-6 mb-6">
    <div class="grid grid-cols-1 md:grid-cols-5 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Tìm kiếm</label>
            <input type="text" id="searchInput" placeholder="Tên sản phẩm..." 
                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Hãng</label>
            <select id="factoryFilter" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                <option value="">Tất cả hãng</option>
                <option value="Logitech">Logitech</option>
                <option value="Corsair">Corsair</option>
                <option value="Razer">Razer</option>
                <option value="Keychron">Keychron</option>
                <option value="Akko">Akko</option>
                <option value="Leopold">Leopold</option>
            </select>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Trạng thái</label>
            <select id="statusFilter" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                <option value="">Tất cả</option>
                <option value="available">Còn hàng</option>
                <option value="out_of_stock">Hết hàng</option>
            </select>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Hiển thị</label>
            <select id="pageSizeSelect" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                <option value="5" ${pageSize == 5 ? 'selected' : ''}>5 sản phẩm</option>
                <option value="10" ${pageSize == 10 ? 'selected' : ''}>10 sản phẩm</option>
                <option value="20" ${pageSize == 20 ? 'selected' : ''}>20 sản phẩm</option>
                <option value="50" ${pageSize == 50 ? 'selected' : ''}>50 sản phẩm</option>
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

<!-- Products Table -->
<div class="bg-white rounded-lg shadow-sm overflow-hidden">
    <div class="px-6 py-4 border-b border-gray-200 flex justify-between items-center">
        <h3 class="text-lg font-semibold text-gray-800">Danh sách sản phẩm</h3>
        <span class="text-sm text-gray-600">
            Tổng: ${fn:length(products)} sản phẩm
        </span>
    </div>
    
    <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Sản phẩm
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Hãng
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Giá
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Số lượng
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Trạng thái
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Thao tác
                    </th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <c:forEach var="product" items="${products}">
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-12 w-12">
                                    <img class="h-12 w-12 rounded-lg object-cover" 
                                         src="/images/product/${product.image}" 
                                         alt="${product.name}"
                                         onerror="this.src='/images/product/default.jpg'">
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium text-gray-900">
                                        ${product.name}
                                    </div>
                                    <div class="text-sm text-gray-500">
                                        ID: #${product.id}
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">
                                ${product.factory}
                            </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm text-gray-900">
                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                            </div>
                            <c:if test="${product.discount > 0}">
                                <div class="text-xs text-red-500">
                                    Giảm ${product.discount}%
                                </div>
                            </c:if>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="text-sm font-medium ${product.quantity > 0 ? 'text-gray-900' : 'text-red-600'}">
                                ${product.quantity}
                            </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <c:choose>
                                <c:when test="${product.quantity > 0}">
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                        Còn hàng
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">
                                        Hết hàng
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                            <div class="flex space-x-2">
                                <a href="/admin/product/${product.id}" 
                                   class="text-blue-600 hover:text-blue-900" title="Xem chi tiết">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="/admin/product/update/${product.id}" 
                                   class="text-green-600 hover:text-green-900" title="Chỉnh sửa">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <button onclick="deleteProduct(${product.id}, '${product.name}')" 
                                        class="text-red-600 hover:text-red-900" title="Xóa">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <!-- Pagination -->
    <div class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
        <div class="flex-1 flex justify-between sm:hidden">
            <c:if test="${currentPage > 1}">
                <a href="/admin/product?page=${currentPage - 1}&size=${pageSize}" 
                   class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                    Trước
                </a>
            </c:if>
            <c:if test="${currentPage < totalPages}">
                <a href="/admin/product?page=${currentPage + 1}&size=${pageSize}" 
                   class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                    Sau
                </a>
            </c:if>
        </div>
        <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
            <div>
                <p class="text-sm text-gray-700">
                    Hiển thị <span class="font-medium">${pageSize}</span> sản phẩm/trang - 
                    Trang <span class="font-medium">${currentPage}</span> / <span class="font-medium">${totalPages}</span>
                </p>
            </div>
            <c:if test="${totalPages > 1}">
                <div>
                    <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="/admin/product?page=${currentPage - 1}&size=${pageSize}" 
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
                                    <a href="/admin/product?page=${page}&size=${pageSize}" 
                                       class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                                        ${page}
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <c:if test="${currentPage < totalPages}">
                            <a href="/admin/product?page=${currentPage + 1}&size=${pageSize}" 
                               class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </c:if>
                    </nav>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Search functionality
    const searchInput = document.getElementById('searchInput');
    const factoryFilter = document.getElementById('factoryFilter');
    const statusFilter = document.getElementById('statusFilter');
    const pageSizeSelect = document.getElementById('pageSizeSelect');
    const resetButton = document.getElementById('resetFilters');
    
    // Page size change event
    pageSizeSelect.addEventListener('change', function() {
        const newSize = this.value;
        const currentUrl = new URL(window.location.href);
        currentUrl.searchParams.set('size', newSize);
        currentUrl.searchParams.set('page', '1'); // Reset to first page
        window.location.href = currentUrl.toString();
    });
    
    // Reset filters
    resetButton.addEventListener('click', function() {
        searchInput.value = '';
        factoryFilter.value = '';
        statusFilter.value = '';
        filterProducts();
    });
    
    // Filter events
    searchInput.addEventListener('input', filterProducts);
    factoryFilter.addEventListener('change', filterProducts);
    statusFilter.addEventListener('change', filterProducts);
    
    function filterProducts() {
        const searchTerm = searchInput.value.toLowerCase();
        const factoryValue = factoryFilter.value;
        const statusValue = statusFilter.value;
        
        const rows = document.querySelectorAll('tbody tr');
        
        rows.forEach(row => {
            const productName = row.querySelector('.text-gray-900').textContent.toLowerCase();
            const factory = row.querySelector('.bg-blue-100').textContent;
            const quantityElement = row.querySelector('td:nth-child(4) .text-sm');
            const quantity = parseInt(quantityElement.textContent);
            
            let showRow = true;
            
            // Search filter
            if (searchTerm && !productName.includes(searchTerm)) {
                showRow = false;
            }
            
            // Factory filter
            if (factoryValue && factory !== factoryValue) {
                showRow = false;
            }
            
            // Status filter
            if (statusValue) {
                if (statusValue === 'available' && quantity <= 0) {
                    showRow = false;
                } else if (statusValue === 'out_of_stock' && quantity > 0) {
                    showRow = false;
                }
            }
            
            row.style.display = showRow ? '' : 'none';
        });
    }
});

function deleteProduct(productId, productName) {
    if (confirm('Bạn có chắc chắn muốn xóa sản phẩm "' + productName + '"? Hành động này không thể hoàn tác.')) {
        // Redirect to delete confirmation page
        window.location.href = '/admin/product/delete/' + productId;
    }
}
</script>

<jsp:include page="../layout/footer.jsp" /> 