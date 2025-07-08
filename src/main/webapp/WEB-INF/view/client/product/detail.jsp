<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> ${product.name} - KeyBoardShop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">

<<<<<<< Updated upstream
                    <meta name="_csrf" content="${_csrf.token}" />
                    <!-- default header name is X-CSRF-TOKEN -->
                    <meta name="_csrf_header" content="${_csrf.headerName}" />
=======
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css" rel="stylesheet">
    <style>
        .star-rating input[type="radio"] { display: none; }
        .star-rating label { cursor: pointer; color: #ccc; font-size: 1.5em; }
        .star-rating input:checked ~ label, .star-rating label:hover, .star-rating label:hover ~ label { color: #f5c518; }
        
        /* Enhanced star rating styles */
        .star-rating {
            direction: rtl;
            display: inline-flex;
            flex-direction: row-reverse;
            justify-content: flex-end;
        }
        
        .star-rating input[type="radio"] {
            display: none;
        }
        
        .star-rating label {
            cursor: pointer;
            color: #ddd;
            font-size: 1.8em;
            padding: 0 2px;
            transition: color 0.2s ease-in-out;
        }
        
        .star-rating label:hover,
        .star-rating label:hover ~ label,
        .star-rating input:checked ~ label {
            color: #ffc107;
        }
        
        /* Display stars (read-only) */
        .rating-display {
            display: inline-flex;
            color: #ffc107;
            font-size: 1.1em;
        }
        
        .rating-display .star {
            margin-right: 2px;
        }
        
        .rating-display .star.empty {
            color: #ddd;
        }
        
        /* Rating overview */
        .rating-overview {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .rating-summary {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .rating-average {
            font-size: 3rem;
            font-weight: bold;
            color: #ffc107;
            margin-bottom: 5px;
        }
        
        .rating-bars .rating-bar {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }
        
        .rating-bar .star-label {
            min-width: 60px;
            font-size: 0.9em;
            color: #666;
        }
        
        .rating-bar .progress {
            flex: 1;
            height: 8px;
            margin: 0 10px;
            background-color: #e9ecef;
        }
        
        .rating-bar .progress-bar {
            background-color: #ffc107;
        }
        
        .rating-bar .count {
            min-width: 40px;
            text-align: right;
            font-size: 0.9em;
            color: #666;
        }
        
        /* Review cards */
        .review-card {
            border: 1px solid #e9ecef;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            background: white;
            transition: box-shadow 0.2s ease;
        }
        
        .review-card:hover {
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            flex-wrap: wrap;
        }
        
        .reviewer-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .reviewer-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(45deg, #007bff, #6610f2);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }
        
        .review-meta {
            text-align: right;
            font-size: 0.9em;
            color: #666;
        }
        
        .review-content {
            line-height: 1.6;
            color: #333;
        }
        
        @media (max-width: 768px) {
            .review-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .review-meta {
                text-align: left;
                margin-top: 10px;
            }
        }
        
        .status-badge {
            font-size: 12px !important;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
        }
        
        .status-badge:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }
        
        .status-badge.in-stock {
            background: linear-gradient(45deg, #28a745, #20c997) !important;
            border: 1px solid #1e7e34;
        }
        
        .status-badge.out-of-stock {
            background: linear-gradient(45deg, #dc3545, #e74c3c) !important;
            border: 1px solid #c82333;
        }
        
        .discount-badge {
            font-size: 13px !important;
            font-weight: 700;
            background: linear-gradient(45deg, #dc3545, #e74c3c) !important;
            border: 1px solid #c82333;
            box-shadow: 0 2px 4px rgba(220, 53, 69, 0.3);
        }
        
        .product-card {
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        
        .product-image-container {
            position: relative;
            overflow: hidden;
        }
        
        .cart-btn-overlay {
            position: absolute;
            bottom: 10px;
            right: 10px;
            z-index: 10;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .product-card:hover .cart-btn-overlay {
            opacity: 1;
        }
        
        .cart-btn {
            font-size: 12px !important;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            padding: 8px 16px !important;
            min-width: 100px;
        }
        
        .cart-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            border-color: #007bff;
        }
        
        .cart-btn:active {
            transform: translateY(0);
        }
        
        .cart-btn.disabled {
            opacity: 0.6;
            cursor: not-allowed;
        }
        
        .cart-btn.disabled:hover {
            transform: none;
            box-shadow: none;
        }
    </style>
</head>
>>>>>>> Stashed changes


                    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                        rel="stylesheet">
                </head>

                <body>

<<<<<<< Updated upstream
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />
=======
<!-- Flash Messages -->
<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-top: 80px; margin-bottom: 0;">
        <i class="fas fa-check-circle me-2"></i>
        ${successMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
</c:if>

<c:if test="${not empty errorMessage}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="margin-top: 80px; margin-bottom: 0;">
        <i class="fas fa-exclamation-triangle me-2"></i>
        ${errorMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
</c:if>

<!-- Single Product Start -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="row g-4 mb-5">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chi Tiết Sản Phẩm</li>
                    </ol>
                </nav>
            </div>
            <div class="col-lg-8 col-xl-9">
                <div class="row g-4">
                    <div class="col-lg-6">
                        <div class="border rounded product-card">
                            <a href="#">
                                <img src="/images/product/${product.image}" class="img-fluid rounded product-image-container" alt="Image">
                                <div class="cart-btn-overlay">
                                    <c:choose>
                                        <c:when test="${product.quantity > 0}">
                                            <button data-product-id="${product.id}" class="btnAddToCartDetail btn btn-primary cart-btn" style="font-size: 12px;">
                                                <i class="fa fa-shopping-bag me-1"></i> Thêm
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn btn-secondary cart-btn disabled" disabled style="font-size: 12px;">
                                                <i class="fa fa-times me-1"></i> Hết
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h4 class="fw-bold mb-3">${product.name}</h4>
                        <p class="mb-3">${product.factory}</p>
                        
                        <!-- Price section -->
                        <c:choose>
                            <c:when test="${product.discount > 0}">
                                <div class="price-section mb-3">
                                    <div class="text-muted small text-decoration-line-through mb-1">
                                        Giá gốc: <fmt:formatNumber type="number" value="${product.price}" /> đ
                                    </div>
                                    <h4 class="fw-bold text-danger mb-2">
                                        <fmt:formatNumber type="number" value="${product.discountedPrice}" /> đ
                                    </h4>
                                    <div class="d-flex align-items-center mb-2">
                                        <span class="badge bg-danger me-2 px-3 py-2">
                                            Giảm ${product.discount}%
                                        </span>
                                        <small class="text-success fw-bold">
                                            Tiết kiệm: <fmt:formatNumber type="number" value="${product.discountAmount}" /> đ
                                        </small>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="price-section mb-3">
                                    <h4 class="fw-bold text-primary mb-2">
                                        <fmt:formatNumber type="number" value="${product.price}" /> đ
                                    </h4>
                                    <div class="text-muted small">
                                        Giá tốt nhất thị trường
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- Hiển thị trạng thái còn hàng/hết hàng -->
                        <div class="mb-3">
                            <c:choose>
                                <c:when test="${product.quantity > 0}">
                                    <span class="badge status-badge in-stock">
                                        <i class="fa fa-check me-1"></i>Còn hàng (${product.quantity} sản phẩm)
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge status-badge out-of-stock">
                                        <i class="fa fa-times me-1"></i>Hết hàng
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        
                        <!-- Product Rating -->
                        <div class="d-flex align-items-center mb-4">
                            <c:choose>
                                <c:when test="${not empty totalReviews and totalReviews > 0}">
                                    <div class="rating-display me-2">
                                        <c:forEach var="i" begin="1" end="5">
                                            <c:choose>
                                                <c:when test="${i <= averageRating}">
                                                    <span class="star">★</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="star empty">★</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                    <span class="text-warning fw-bold me-2">${empty averageRating ? '0.0' : averageRating}</span>
                                    <span class="text-muted">(${totalReviews} đánh giá)</span>
                                </c:when>
                                <c:otherwise>
                                    <div class="rating-display me-2">
                                        <c:forEach var="i" begin="1" end="5">
                                            <span class="star empty">★</span>
                                        </c:forEach>
                                    </div>
                                    <span class="text-muted">Chưa có đánh giá</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <p class="mb-4">${product.shortDesc}</p>

                        <c:choose>
                            <c:when test="${product.quantity > 0}">
                                <div class="input-group quantity mb-5" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm text-center border-0" value="1" data-cart-detail-index="0">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input class="form-control d-none" type="text" value="${product.id}" name="id" />
                                <input class="form-control d-none" type="text" name="quantity" id="cartDetails0.quantity" value="1" />
                            </c:when>
                            <c:otherwise>
                                <div class="mb-5">
                                    <div class="alert alert-warning" role="alert">
                                        <i class="fa fa-exclamation-triangle me-2"></i>
                                        Sản phẩm hiện tại đã hết hàng. Vui lòng quay lại sau!
                                    </div>
                                </div>
                                <button class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-muted cart-btn disabled" disabled style="font-size: 14px;">
                                    <i class="fa fa-times me-2"></i> Hết hàng
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-lg-12">
                        <nav>
                            <div class="nav nav-tabs mb-3">
                                <button class="nav-link active border-white border-bottom-0" type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about" aria-controls="nav-about" aria-selected="true">Description</button>
                            </div>
                        </nav>
                        <div class="tab-content mb-5">
                            <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                <p>${product.detailDesc}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-xl-3">
                <div class="row g-4 fruite">
                    <div class="col-lg-12">

                    </div>
                </div>
            </div>
        </div>
>>>>>>> Stashed changes

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Chi Tiết Sản Phẩm
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                                <div class="col-lg-8 col-xl-9">
                                    <div class="row g-4">
                                        <div class="col-lg-6">
                                            <div class="border rounded">
                                                <a href="#">
                                                    <img src="/images/product/${product.image}"
                                                        class="img-fluid rounded" alt="Image">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <h4 class="fw-bold mb-3"> ${product.name}</h4>
                                            <p class="mb-3">${product.factory}</p>
                                            <h5 class="fw-bold mb-3">
                                                <fmt:formatNumber type="number" value="${product.price}" /> đ

                                            </h5>
                                            <div class="d-flex mb-4">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p class="mb-4">
                                                ${product.shortDesc}
                                            </p>

                                            <div class="input-group quantity mb-5" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text"
                                                    class="form-control form-control-sm text-center border-0" value="1"
                                                    data-cart-detail-index="0">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <!-- <form action="/add-product-from-view-detail" method="post"
                                                modelAttribute="product"> -->
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <input class="form-control d-none" type="text" value="${product.id}"
                                                name="id" />

                                            <input class="form-control d-none" type="text" name="quantity"
                                                id="cartDetails0.quantity" value="1" />
                                            <button data-product-id="${product.id}"
                                                class="btnAddToCartDetail btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i>
                                                Add to cart
                                            </button>
                                            <!-- </form> -->

                                        </div>
                                        <div class="col-lg-12">
                                            <nav>
                                                <div class="nav nav-tabs mb-3">
                                                    <button class="nav-link active border-white border-bottom-0"
                                                        type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                        data-bs-target="#nav-about" aria-controls="nav-about"
                                                        aria-selected="true">Description</button>
                                                </div>
                                            </nav>
                                            <div class="tab-content mb-5">
                                                <div class="tab-pane active" id="nav-about" role="tabpanel"
                                                    aria-labelledby="nav-about-tab">
                                                    <p>
                                                        ${product.detailDesc}
                                                    </p>

                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-xl-3">
                                    <div class="row g-4 fruite">
                                        <div class="col-lg-12">

                                            <div class="mb-4">
                                                <h4>Categories</h4>
                                                <ul class="list-unstyled fruite-categorie">
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Filco</a>
                                                            <span>(3)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Razer</a>
                                                            <span>(5)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Logitech</a>
                                                            <span>(2)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Akko</a>
                                                            <span>(8)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Fuhlen</a>
                                                            <span>(5)</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Single Product End -->

                    <jsp:include page="../layout/footer.jsp" />

<<<<<<< Updated upstream
=======
        <!-- Đánh giá -->
        <div class="col-12 mt-4">
            <h3>Đánh giá sản phẩm</h3>
            
            <!-- Simple Rating Display -->
            <div class="mb-4">
                <c:choose>
                    <c:when test="${not empty totalReviews and totalReviews > 0}">
                        <p><strong>Điểm trung bình:</strong> ${averageRating}/5.0 (${totalReviews} đánh giá)</p>
                    </c:when>
                    <c:otherwise>
                        <p class="text-muted">Chưa có đánh giá nào</p>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <!-- Review Form -->
            <c:choose>
                <c:when test="${canReview}">
                    <div class="card mb-4 review-form">
                        <div class="card-header">
                            <h5 class="mb-0">Viết đánh giá của bạn</h5>
                        </div>
                        <div class="card-body">
                            <form:form modelAttribute="review" action="/product/${product.id}/review" method="post">
                                <form:errors path="rating" cssClass="text-danger d-block mb-2"/>
                                <form:errors path="comment" cssClass="text-danger d-block mb-2"/>
                                
                                <div class="mb-3">
                                    <label class="form-label">Chọn số sao:</label>
                                    <div class="star-rating">
                                        <form:radiobutton path="rating" value="5" id="star5"/><label for="star5"></label>
                                        <form:radiobutton path="rating" value="4" id="star4"/><label for="star4"></label>
                                        <form:radiobutton path="rating" value="3" id="star3"/><label for="star3"></label>
                                        <form:radiobutton path="rating" value="2" id="star2"/><label for="star2"></label>
                                        <form:radiobutton path="rating" value="1" id="star1"/><label for="star1"></label>
                                    </div>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Nội dung đánh giá:</label>
                                    <form:textarea path="comment" class="form-control" rows="4" placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm..." required="true"/>
                                </div>
                                
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-star me-2"></i>Gửi đánh giá
                                </button>
                            </form:form>
                        </div>
                    </div>
                </c:when>
                <c:when test="${empty pageContext.request.userPrincipal}">
                    <div class="alert alert-info">
                        <i class="fas fa-info-circle me-2"></i>
                        <strong>Bạn cần đăng nhập để đánh giá sản phẩm.</strong>
                        <a href="/login" class="btn btn-primary btn-sm ms-2">
                            <i class="fas fa-sign-in-alt me-1"></i>Đăng nhập
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-warning">
                        <i class="fas fa-shopping-cart me-2"></i>
                        <strong>Bạn cần mua và nhận hàng thành công để có thể đánh giá sản phẩm này.</strong>
                        <br>
                        <small class="text-muted">Điều này đảm bảo tính chính xác và trung thực của các đánh giá.</small>
                    </div>
                </c:otherwise>
            </c:choose>
            
            <!-- Reviews List -->
            <div id="reviews">
                <c:if test="${not empty reviews}">
                    <c:forEach var="review" items="${reviews}">
                        <div class="review-item">
                            <div class="review-header">
                                <div>
                                    <h6 class="fw-bold mb-1">${review.user.fullName}</h6>
                                    <div class="review-rating">
                                        <c:forEach var="i" begin="1" end="5">
                                            <c:choose>
                                                <c:when test="${i <= review.rating}">
                                                    <span>★</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color: #ddd;">★</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <span class="ms-2">${review.rating}/5</span>
                                    </div>
                                </div>
                                <div class="review-date">${review.formattedCreatedAt}</div>
                            </div>
                            <div class="review-content">${review.comment}</div>
                        </div>
                    </c:forEach>
                </c:if>
                
                <c:if test="${empty reviews}">
                    <div class="text-center py-4">
                        <c:choose>
                            <c:when test="${canReview}">
                                <p class="text-muted">Chưa có đánh giá nào. Hãy là người đầu tiên!</p>
                            </c:when>
                            <c:when test="${empty pageContext.request.userPrincipal}">
                                <p class="text-muted">Chưa có đánh giá nào. <a href="/login">Đăng nhập</a> để có thể đánh giá sau khi mua hàng!</p>
                            </c:when>
                            <c:otherwise>
                                <p class="text-muted">Chưa có đánh giá nào. Mua hàng thành công để có thể đánh giá sản phẩm.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!-- Single Product End -->
>>>>>>> Stashed changes

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

<<<<<<< Updated upstream
                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
=======
<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
<script>
    $(document).ready(function() {
        $("#commentForm").submit(function(e) {
            e.preventDefault();
            
            var formData = {
                content: $("#commentForm textarea[name='content']").val(),
                "${_csrf.parameterName}": "${_csrf.token}"
            };
            
            $.ajax({
                url: "/product/${product.id}/comment-ajax",
                type: "POST",
                data: formData,
                success: function(response) {
                    if (response.success) {
                        // Tạo HTML cho comment mới
                        var commentHtml = '<div class="card mb-2">' +
                            '<div class="card-body">' +
                            '<p><strong>' + (response.comment.user.fullName || 'Người dùng') + '</strong> (' + 
                            new Date().toLocaleString("vi-VN") + '): ' + response.comment.content + '</p>' +
                            '</div>' +
                            '</div>';
                        
                        $("#comments").prepend(commentHtml);
                        $("#commentForm")[0].reset();
                        
                        $.toast({
                            heading: 'Thành công',
                            text: response.message,
                            showHideTransition: 'fade',
                            icon: 'success'
                        });
                    } else {
                        $.toast({
                            heading: 'Lỗi',
                            text: response.message,
                            showHideTransition: 'fade',
                            icon: 'error'
                        });
                    }
                },
                error: function(xhr) {
                    var errorMessage = 'Có lỗi xảy ra khi gửi bình luận.';
                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        errorMessage = xhr.responseJSON.message;
                    }
                    
                    $.toast({
                        heading: 'Lỗi',
                        text: errorMessage,
                        showHideTransition: 'fade',
                        icon: 'error'
                    });
                }
            });
        });
    });
</script>
</body>
>>>>>>> Stashed changes

                </body>

                </html>