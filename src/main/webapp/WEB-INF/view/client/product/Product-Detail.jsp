<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} - KeyBoard Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        .product-image {
            max-height: 500px;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .product-info {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .price {
            font-size: 2.5rem;
            font-weight: bold;
            color: #e74c3c;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .stock-info {
            background: linear-gradient(45deg, #28a745, #20c997);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            display: inline-block;
            margin: 0.5rem 0;
        }

        .sold-info {
            background: linear-gradient(45deg, #17a2b8, #6f42c1);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            display: inline-block;
            margin: 0.5rem 0;
        }

        .add-to-cart-btn {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            border: none;
            padding: 1rem 2rem;
            font-size: 1.2rem;
            border-radius: 25px;
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(238, 90, 36, 0.4);
        }

        .add-to-cart-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(238, 90, 36, 0.6);
            background: linear-gradient(45deg, #ee5a24, #ff6b6b);
        }

        .quantity-selector {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin: 1rem 0;
        }

        .quantity-btn {
            background: #007bff;
            color: white;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .quantity-btn:hover {
            background: #0056b3;
            transform: scale(1.1);
        }

        .quantity-input {
            width: 80px;
            text-align: center;
            border: 2px solid #dee2e6;
            border-radius: 10px;
            padding: 0.5rem;
        }

        .product-specs {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-top: 2rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .spec-item {
            display: flex;
            justify-content: space-between;
            padding: 0.75rem 0;
            border-bottom: 1px solid #eee;
        }

        .spec-item:last-child {
            border-bottom: none;
        }

        .spec-label {
            font-weight: bold;
            color: #495057;
        }

        .spec-value {
            color: #6c757d;
        }

        .product-description {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-top: 2rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .breadcrumb {
            background: transparent;
            padding: 1rem 0;
        }

        .breadcrumb-item a {
            color: #007bff;
            text-decoration: none;
        }

        .breadcrumb-item.active {
            color: #6c757d;
        }

        .alert-success {
            background: linear-gradient(45deg, #28a745, #20c997);
            border: none;
            color: white;
            border-radius: 15px;
        }

        .related-products {
            margin-top: 3rem;
        }

        .product-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .product-card img {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="fas fa-keyboard"></i> KeyBoard Store
        </a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="${pageContext.request.contextPath}/cart">
                <i class="fas fa-shopping-cart"></i> Giỏ hàng
                <c:if test="${not empty sessionScope.cartItemCount}">
                    <span class="badge bg-danger">${sessionScope.cartItemCount}</span>
                </c:if>
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>
            <li class="breadcrumb-item active">${product.name}</li>
        </ol>
    </nav>

    <!-- Alert Messages -->
    <c:if test="${not empty sessionScope.message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle"></i> ${sessionScope.message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <c:remove var="message" scope="session"/>
    </c:if>

    <c:if test="${not empty sessionScope.error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle"></i> ${sessionScope.error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <c:remove var="error" scope="session"/>
    </c:if>

    <!-- Product Detail -->
    <div class="row">
        <div class="col-md-6">
            <img src="${pageContext.request.contextPath}${product.image}"
                 class="img-fluid product-image w-100"
                 alt="${product.name}"
                 onerror="this.src='${pageContext.request.contextPath}/images/no-image.jpg'">
        </div>

        <div class="col-md-6">
            <div class="product-info">
                <h1 class="display-5 fw-bold mb-3">${product.name}</h1>

                <div class="price mb-3">
                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$"/>
                </div>

                <div class="mb-3">
                        <span class="stock-info">
                            <i class="fas fa-box"></i> Còn lại: ${product.quantity} sản phẩm
                        </span>
                    <span class="sold-info ms-2">
                            <i class="fas fa-fire"></i> Đã bán: ${product.sold}
                        </span>
                </div>

                <p class="lead mb-4">${product.shortDesc}</p>

                <!-- Add to Cart Form -->
                <form action="${pageContext.request.contextPath}/cart/add" method="post" id="addToCartForm">
                    <input type="hidden" name="productId" value="${product.id}">

                    <div class="quantity-selector">
                        <label class="fw-bold">Số lượng:</label>
                        <button type="button" class="quantity-btn" onclick="decreaseQuantity()">
                            <i class="fas fa-minus"></i>
                        </button>
                        <input type="number" class="form-control quantity-input"
                               name="quantity" id="quantity" value="1"
                               min="1" max="${product.quantity}">
                        <button type="button" class="quantity-btn" onclick="increaseQuantity()">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>

                    <c:choose>
                        <c:when test="${product.quantity > 0}">
                            <button type="submit" class="btn add-to-cart-btn w-100 mt-3">
                                <i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-secondary w-100 mt-3" disabled>
                                <i class="fas fa-times"></i> Hết hàng
                            </button>
                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </div>
    </div>

    <!-- Product Specifications -->
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="product-specs">
                <h3 class="mb-3"><i class="fas fa-cogs"></i> Thông số kỹ thuật</h3>
                <div class="spec-item">
                    <span class="spec-label">Nhà sản xuất:</span>
                    <span class="spec-value">${product.factory}</span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Đối tượng sử dụng:</span>
                    <span class="spec-value">${product.target}</span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Giá:</span>
                    <span class="spec-value">
                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$"/>
                        </span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Tình trạng:</span>
                    <span class="spec-value">
                            <c:choose>
                                <c:when test="${product.quantity > 0}">
                                    <span class="text-success">Còn hàng</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-danger">Hết hàng</span>
                                </c:otherwise>
                            </c:choose>
                        </span>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="product-description">
                <h3 class="mb-3"><i class="fas fa-info-circle"></i> Mô tả chi tiết</h3>
                <div style="white-space: pre-line; line-height: 1.6;">
                    ${product.detailDesc}
                </div>
            </div>
        </div>
    </div>

    <!-- Related Products -->
    <div class="related-products">
        <h3 class="mb-4"><i class="fas fa-star"></i> Sản phẩm liên quan</h3>
        <div class="row">
            <c:forEach items="${relatedProducts}" var="relatedProduct" begin="0" end="3">
                <div class="col-md-3 mb-4">
                    <div class="card product-card">
                        <img src="${pageContext.request.contextPath}${relatedProduct.image}"
                             class="card-img-top" alt="${relatedProduct.name}"
                             onerror="this.src='${pageContext.request.contextPath}/images/no-image.jpg'">
                        <div class="card-body">
                            <h6 class="card-title">${relatedProduct.name}</h6>
                            <p class="card-text text-primary fw-bold">
                                <fmt:formatNumber value="${relatedProduct.price}" type="currency" currencySymbol="$"/>
                            </p>
                            <a href="${pageContext.request.contextPath}/products/${relatedProduct.id}"
                               class="btn btn-outline-primary btn-sm">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-light mt-5 py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h5><i class="fas fa-keyboard"></i> KeyBoard Store</h5>
                <p>Chuyên cung cấp bàn phím cơ và phụ kiện chất lượng cao</p>
            </div>
            <div class="col-md-6 text-end">
                <p>&copy; 2024 KeyBoard Store. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    function increaseQuantity() {
        const quantityInput = document.getElementById('quantity');
        const currentValue = parseInt(quantityInput.value);
        const maxQuantity = parseInt(quantityInput.max);

        if (currentValue < maxQuantity) {
            quantityInput.value = currentValue + 1;
        }
    }

    function decreaseQuantity() {
        const quantityInput = document.getElementById('quantity');
        const currentValue = parseInt(quantityInput.value);

        if (currentValue > 1) {
            quantityInput.value = currentValue - 1;
        }
    }

    // Form validation
    document.getElementById('addToCartForm').addEventListener('submit', function(e) {
        const quantity = parseInt(document.getElementById('quantity').value);
        const maxQuantity = parseInt(document.getElementById('quantity').max);

        if (quantity <= 0 || quantity > maxQuantity) {
            e.preventDefault();
            alert('Số lượng không hợp lệ!');
        }
    });

    // Auto-hide alerts
    setTimeout(function() {
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(function(alert) {
            if (alert.classList.contains('show')) {
                alert.classList.remove('show');
                setTimeout(() => alert.remove(), 150);
            }
        });
    }, 5000);
</script>
</body>
</html>