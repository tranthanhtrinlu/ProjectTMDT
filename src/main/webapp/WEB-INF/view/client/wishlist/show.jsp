<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Danh Sách Yêu Thích - Keyboardshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">
    
    <!-- Meta CSRF -->
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
    
    <!-- jQuery Toast CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css" rel="stylesheet">
    
    <style>
        .wishlist-header {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            color: white;
            padding: 40px 0;
            margin-bottom: 40px;
        }
        
        .wishlist-count {
            font-size: 18px;
            opacity: 0.9;
        }
        
        .empty-wishlist {
            text-align: center;
            padding: 60px 20px;
            color: #6c757d;
        }
        
        .empty-wishlist i {
            font-size: 64px;
            margin-bottom: 20px;
            color: #dee2e6;
        }
        
        .product-card {
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            border: 1px solid #e9ecef !important;
            border-radius: 12px !important;
        }
        
        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.1) !important;
            border-color: #007bff !important;
        }
        
        .remove-wishlist-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: rgba(220, 53, 69, 0.9);
            border: none;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            z-index: 10;
        }
        
        .remove-wishlist-btn:hover {
            background: #dc3545;
            transform: scale(1.1);
        }
    </style>
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

    <!-- Wishlist Header -->
    <div class="wishlist-header">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1 class="mb-3">
                        <i class="fas fa-heart me-3"></i>
                        Danh Sách Yêu Thích
                    </h1>
                    <p class="wishlist-count mb-0">
                        Bạn có <strong>${wishlistCount}</strong> sản phẩm trong danh sách yêu thích
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Wishlist Content -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <c:choose>
                <c:when test="${wishlistCount == 0}">
                    <div class="empty-wishlist">
                        <i class="far fa-heart"></i>
                        <h3>Danh sách yêu thích trống</h3>
                        <p class="mb-4">Bạn chưa có sản phẩm nào trong danh sách yêu thích.</p>
                        <a href="/products" class="btn btn-primary btn-lg">
                            <i class="fas fa-shopping-bag me-2"></i>
                            Mua sắm ngay
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row g-4">
                        <c:forEach var="product" items="${wishlistProducts}">
                            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                                <div class="product-item bg-white border rounded-lg shadow-sm mb-4 product-card">
                                    <!-- Remove from wishlist button -->
                                    <button class="remove-wishlist-btn" data-product-id="${product.id}" title="Xóa khỏi danh sách yêu thích">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    
                                    <div class="product-img position-relative overflow-hidden">
                                        <a href="/product/${product.id}">
                                            <img class="img-fluid w-100" src="/images/product/${product.image}" alt="${product.name}" style="height: 250px; object-fit: cover;" />
                                        </a>
                                        
                                        <!-- Discount Badge -->
                                        <c:if test="${product.discount > 0}">
                                            <div class="position-absolute top-0 start-0 m-2">
                                                <span class="badge bg-danger text-white px-2 py-1 rounded-pill">
                                                    -${product.discount}%
                                                </span>
                                            </div>
                                        </c:if>
                                        
                                        <!-- Stock Status Badge -->
                                        <div class="position-absolute top-0 start-50 m-2">
                                            <c:choose>
                                                <c:when test="${product.quantity > 0}">
                                                    <span class="badge bg-success text-white px-2 py-1 rounded-pill">
                                                        <i class="fa fa-check me-1"></i>Còn hàng
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary text-white px-2 py-1 rounded-pill">
                                                        <i class="fa fa-times me-1"></i>Hết hàng
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    
                                    <div class="p-3">
                                        <!-- Product Name -->
                                        <h6 class="mb-2">
                                            <a href="/product/${product.id}" class="text-decoration-none text-dark fw-bold">
                                                ${product.name}
                                            </a>
                                        </h6>
                                        
                                        <!-- Product Rating -->
                                        <div class="mb-2">
                                            <c:choose>
                                                <c:when test="${product.totalReviews > 0}">
                                                    <div class="d-flex align-items-center">
                                                        <c:forEach var="i" begin="1" end="5">
                                                            <c:choose>
                                                                <c:when test="${i <= product.averageRating}">
                                                                    <span class="text-warning">★</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="text-muted">★</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <span class="ms-2 text-muted small">(${product.totalReviews})</span>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="text-muted small">Chưa có đánh giá</div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        
                                        <!-- Price Section -->
                                        <div class="mb-3">
                                            <c:choose>
                                                <c:when test="${product.discount > 0}">
                                                    <div class="text-muted small text-decoration-line-through">
                                                        <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                    </div>
                                                    <div class="text-danger fw-bold fs-5">
                                                        <fmt:formatNumber type="number" value="${product.discountedPrice}" /> đ
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="text-primary fw-bold fs-5">
                                                        <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        
                                        <!-- Action Buttons -->
                                        <div class="d-flex gap-2">
                                            <c:choose>
                                                <c:when test="${product.quantity > 0}">
                                                    <button class="btn btn-primary btn-sm btnAddToCart flex-fill" data-product-id="${product.id}">
                                                        <i class="fa fa-shopping-bag me-1"></i>
                                                        Thêm vào giỏ
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button class="btn btn-secondary btn-sm disabled flex-fill" disabled>
                                                        <i class="fa fa-times me-1"></i>
                                                        Hết hàng
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <jsp:include page="../layout/footer.jsp" />

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/client/js/main.js"></script>
    
    <!-- jQuery Toast JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
    
    <script>
        $(document).ready(function() {
            // Remove from wishlist
            $('.remove-wishlist-btn').click(function() {
                var productId = $(this).data('product-id');
                var $productCard = $(this).closest('.product-card');
                
                $.ajax({
                    url: '/wishlist/remove/' + productId,
                    type: 'POST',
                    beforeSend: function(xhr) {
                        var token = $("meta[name='_csrf']").attr("content");
                        var header = $("meta[name='_csrf_header']").attr("content");
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(response) {
                        if (response.success) {
                            $productCard.fadeOut(300, function() {
                                $(this).remove();
                                updateWishlistCount();
                            });
                            
                            $.toast({
                                heading: 'Thành công',
                                text: response.message,
                                position: 'top-right',
                                loaderBg: '#ff6849',
                                icon: 'success',
                                hideAfter: 3000,
                                stack: 6
                            });
                        }
                    },
                    error: function(xhr) {
                        var response = xhr.responseJSON;
                        var message = response ? response.message : 'Có lỗi xảy ra';
                        
                        $.toast({
                            heading: 'Lỗi',
                            text: message,
                            position: 'top-right',
                            loaderBg: '#ff6849',
                            icon: 'error',
                            hideAfter: 3000,
                            stack: 6
                        });
                    }
                });
            });
            
            // Add to cart functionality
            $('.btnAddToCart').click(function() {
                var productId = $(this).data('product-id');
                
                $.ajax({
                    url: '/add-product-to-cart/' + productId,
                    type: 'POST',
                    beforeSend: function(xhr) {
                        var token = $("meta[name='_csrf']").attr("content");
                        var header = $("meta[name='_csrf_header']").attr("content");
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(response) {
                        $.toast({
                            heading: 'Thành công',
                            text: 'Sản phẩm đã được thêm vào giỏ hàng!',
                            position: 'top-right',
                            loaderBg: '#ff6849',
                            icon: 'success',
                            hideAfter: 3000,
                            stack: 6
                        });
                    },
                    error: function(xhr) {
                        var response = xhr.responseJSON;
                        var message = response ? response.message : 'Có lỗi xảy ra khi thêm vào giỏ hàng';
                        
                        $.toast({
                            heading: 'Lỗi',
                            text: message,
                            position: 'top-right',
                            loaderBg: '#ff6849',
                            icon: 'error',
                            hideAfter: 3000,
                            stack: 6
                        });
                    }
                });
            });
            
            function updateWishlistCount() {
                var remainingProducts = $('.product-card').length;
                if (remainingProducts === 0) {
                    location.reload(); // Reload to show empty state
                } else {
                    $('.wishlist-count strong').text(remainingProducts);
                }
            }
        });
    </script>
</body>

</html> 