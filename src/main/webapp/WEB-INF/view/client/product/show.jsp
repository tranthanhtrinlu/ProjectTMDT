<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<<<<<<< Updated upstream
                <head>
                    <meta charset="utf-8">
                    <title> Sản Phẩm - KeyBoardShop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">
=======
<head>
    <meta charset="utf-8">
    <title>Sản Phẩm - Keyboardshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
>>>>>>> Stashed changes

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
        .page-link.disabled {
            color: var(--bs-pagination-disabled-color);
            pointer-events: none;
            background-color: var(--bs-pagination-disabled-bg);
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
        
        .product-image-container {
            position: relative;
            overflow: hidden;
            border-radius: 12px 12px 0 0;
        }
        
        .product-image-container img {
            transition: transform 0.3s ease;
        }
        
        .product-card:hover .product-image-container img {
            transform: scale(1.05);
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
            font-size: 10px !important;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            padding: 6px 12px !important;
            min-width: 80px;
            border-radius: 20px !important;
        }
        
        .cart-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
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
        
        .discount-badge {
            font-size: 11px !important;
            font-weight: 700;
            background: linear-gradient(45deg, #dc3545, #e74c3c) !important;
            border: none !important;
            box-shadow: 0 2px 4px rgba(220, 53, 69, 0.3);
        }
        
        .stock-badge {
            font-size: 10px !important;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .product-name a:hover {
            color: #007bff !important;
            transition: color 0.3s ease;
        }
        
        .price-section {
            min-height: 80px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .rating-section .fa-star {
            font-size: 12px;
        }
        
        .btn-outline-primary:hover {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }
        
        @media (max-width: 768px) {
            .product-card {
                margin-bottom: 20px;
            }
            
            .col-lg-3.col-md-6.col-sm-12 {
                padding: 0 10px;
            }
        }
        
        .pagination-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
        
        /* Force horizontal pagination */
        .pagination {
            margin-bottom: 0 !important;
            display: flex !important;
            flex-direction: row !important;
            list-style: none !important;
            padding-left: 0 !important;
            flex-wrap: nowrap !important;
            align-items: center !important;
        }
        
        .pagination .page-item {
            display: inline-block !important;
            margin: 0 2px !important;
            float: none !important;
        }
        
        .pagination .page-link {
            color: #007bff !important;
            border: 1px solid #dee2e6 !important;
            padding: 0.5rem 0.75rem !important;
            border-radius: 0.375rem !important;
            transition: all 0.3s ease !important;
            text-decoration: none !important;
            display: block !important;
            white-space: nowrap !important;
        }
        
        .pagination .page-link:hover {
            color: #0056b3 !important;
            background-color: #e9ecef !important;
            border-color: #adb5bd !important;
            text-decoration: none !important;
        }
        
        .pagination .page-item.active .page-link {
            background-color: #007bff !important;
            border-color: #007bff !important;
            color: white !important;
        }
        
        .pagination .page-item.disabled .page-link {
            color: #6c757d !important;
            pointer-events: none !important;
            background-color: #fff !important;
            border-color: #dee2e6 !important;
        }
        
        /* Product Type Tabs Styling */
        .product-type-tabs {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .product-type-tabs .nav-pills {
            gap: 10px;
        }
        
        .product-type-tabs .nav-link {
            border-radius: 25px !important;
            padding: 12px 20px !important;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            color: #6c757d;
            background-color: #f8f9fa;
        }
        
        .product-type-tabs .nav-link:hover {
            background-color: #e9ecef;
            color: #495057;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }
        
        .product-type-tabs .nav-link.active {
            background: linear-gradient(45deg, #007bff, #0056b3) !important;
            color: white !important;
            border-color: #007bff;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
        }
        
        .product-type-tabs .nav-link i {
            font-size: 16px;
        }
        
        @media (max-width: 768px) {
            .product-type-tabs .nav-pills {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .product-type-tabs .nav-link {
                padding: 8px 12px !important;
                font-size: 12px;
                margin-bottom: 5px;
            }
        }
        
        /* Price Range Input Styling */
        .price-range-container {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 15px;
            border: 1px solid #e9ecef;
        }
        
        .price-range-container .form-control {
            border-radius: 8px;
            border: 1px solid #dee2e6;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .price-range-container .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        
        .price-range-container .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 5px;
        }
        
        .price-display {
            text-align: center;
            font-size: 12px;
            color: #6c757d;
        }
        
        .price-display i {
            color: #007bff;
        }
        
        /* Remove old slider styles */
        .price-slider-container,
        .price-slider,
        .price-range-labels {
            display: none;
        }
        
        /* Wishlist Button Styling */
        .wishlist-btn {
            width: 35px !important;
            height: 35px !important;
            border-radius: 50% !important;
            padding: 0 !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            background: rgba(255, 255, 255, 0.9) !important;
            border: 2px solid #fff !important;
            transition: all 0.3s ease !important;
            z-index: 15 !important;
        }
        
        .wishlist-btn:hover {
            background: #fff !important;
            transform: scale(1.1) !important;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2) !important;
        }
        
        .wishlist-btn.active {
            background: #dc3545 !important;
            border-color: #dc3545 !important;
        }
        
        .wishlist-btn.active .wishlist-icon {
            color: #fff !important;
        }
        
        .wishlist-icon {
            font-size: 14px !important;
            color: #6c757d !important;
            transition: all 0.3s ease !important;
        }
        
        .wishlist-btn:hover .wishlist-icon {
            color: #dc3545 !important;
        }
        
        .wishlist-btn.active .wishlist-icon {
            color: #fff !important;
        }
        
        /* Update cart button overlay for multiple buttons */
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
    </style>
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

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
                            <li class="breadcrumb-item active" aria-current="page">Danh Sách Sản Phẩm</li>
                        </ol>
                    </nav>
                </div>

                <!-- Product Type Tabs -->
                <div class="col-12">
                    <div class="product-type-tabs mb-4">
                        <ul class="nav nav-pills nav-fill" id="productTypeTabs" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${empty param.type ? 'active' : ''}" 
                                   href="/products" 
                                   role="tab">
                                    <i class="fas fa-th-large me-2"></i>Tất cả
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${param.type == 'KEYBOARD' ? 'active' : ''}" 
                                   href="/products?type=KEYBOARD" 
                                   role="tab">
                                    <i class="fas fa-keyboard me-2"></i>Bàn phím
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${param.type == 'KIT' ? 'active' : ''}" 
                                   href="/products?type=KIT" 
                                   role="tab">
                                    <i class="fas fa-puzzle-piece me-2"></i>KIT
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${param.type == 'KEYCAP' ? 'active' : ''}" 
                                   href="/products?type=KEYCAP" 
                                   role="tab">
                                    <i class="fas fa-square me-2"></i>Keycap
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${param.type == 'MOUSE' ? 'active' : ''}" 
                                   href="/products?type=MOUSE" 
                                   role="tab">
                                    <i class="fas fa-mouse me-2"></i>Chuột
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${param.type == 'MOUSEPAD' ? 'active' : ''}" 
                                   href="/products?type=MOUSEPAD" 
                                   role="tab">
                                    <i class="fas fa-mouse-pointer me-2"></i>Lót chuột
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${param.type == 'SWITCH' ? 'active' : ''}" 
                                   href="/products?type=SWITCH" 
                                   role="tab">
                                    <i class="fas fa-toggle-on me-2"></i>Switch
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${param.type == 'OTHER' ? 'active' : ''}" 
                                   href="/products?type=OTHER" 
                                   role="tab">
                                    <i class="fas fa-ellipsis-h me-2"></i>Khác
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="row g-4 fruite">
                    <div class="col-12 col-md-4">
                        <div class="row g-4">
                            <div class="col-12" id="factoryFilter">
                                <div class="mb-2"><b>Hãng sản xuất</b></div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-1" value="Razer">
                                    <label class="form-check-label" for="factory-1">Razer</label>
                                </div>
<<<<<<< Updated upstream

                                <div class="row g-4 fruite">
                                    <div class="col-12 col-md-4">
                                        <div class="row g-4">
                                            <div class="col-12" id="factoryFilter">
                                                <div class="mb-2"><b>Hãng sản xuất</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-1"
                                                        value="DUCKY">
                                                    <label class="form-check-label" for="factory-1">Ducky</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-2"
                                                        value="FILCO">
                                                    <label class="form-check-label" for="factory-2">Filco</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-3"
                                                        value="RAZER">
                                                    <label class="form-check-label" for="factory-3">Razer</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-4"
                                                        value="LOGITECH">
                                                    <label class="form-check-label" for="factory-4">Logitech</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-5"
                                                        value="AKKO">
                                                    <label class="form-check-label" for="factory-5">Akko</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-6"
                                                        value="FUHLEN">
                                                    <label class="form-check-label" for="factory-6">Fuhlen</label>
                                                </div>

                                            </div>
                                            <div class="col-12" id="targetFilter">
                                                <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-1"
                                                        value="GAMING">
                                                    <label class="form-check-label" for="target-1">Gaming</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-2"
                                                        value="SINHVIEN-VANPHONG">
                                                    <label class="form-check-label" for="target-2">Sinh viên - văn
                                                        phòng</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-3"
                                                        value="THIET-KE-DO-HOA">
                                                    <label class="form-check-label" for="target-3">Thiết kế đồ
                                                        họa</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-4"
                                                        value="MONG-NHE">
                                                    <label class="form-check-label" for="target-4">Mỏng nhẹ</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-5"
                                                        value="DOANH-NHAN">
                                                    <label class="form-check-label" for="target-5">Doanh nhân</label>
                                                </div>


                                            </div>
                                            <div class="col-12" id="priceFilter">
                                                <div class="mb-2"><b>Mức giá</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-2"
                                                        value="duoi-10-trieu">
                                                    <label class="form-check-label" for="price-2">Dưới 10 triệu</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-3"
                                                        value="10-15-trieu">
                                                    <label class="form-check-label" for="price-3">Từ 10 - 15
                                                        triệu</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-4"
                                                        value="15-20-trieu">
                                                    <label class="form-check-label" for="price-4">Từ 15 - 20
                                                        triệu</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-5"
                                                        value="tren-20-trieu">
                                                    <label class="form-check-label" for="price-5">Trên 20 triệu</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-2"><b>Sắp xếp</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-1"
                                                        value="gia-tang-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-2"
                                                        value="gia-giam-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-3" checked
                                                        value="gia-nothing" name="radio-sort">
                                                    <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                                </div>

                                            </div>
                                            <div class="col-12">
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4"
                                                    id="btnFilter">
                                                    Lọc Sản Phẩm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-8 text-center">
                                        <div class="row g-4">
                                            <c:if test="${totalPages ==  0}">
                                                <div>Không tìm thấy sản phẩm</div>
                                            </c:if>
                                            <c:forEach var="product" items="${products}">
                                                <div class="col-md-6 col-lg-4">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/images/product/${product.image}"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">KeyBoard
                                                        </div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4 style="font-size: 15px;">
                                                                <a href="/product/${product.id}">
                                                                    ${product.name}
                                                                </a>

                                                            </h4>
                                                            <p style="font-size: 13px;">
                                                                ${product.shortDesc}</p>
                                                            <div
                                                                class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                                                <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                    class="text-dark  fw-bold mb-3">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" />
                                                                    đ
                                                                </p>
                                                                <form action="/add-product-to-cart/${product.id}"
                                                                    method="post">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                        value="${_csrf.token}" />

                                                                    <button
                                                                        class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>


                                            <c:if test="${totalPages > 0}">
                                                <div class="pagination d-flex justify-content-center mt-5">
                                                    <li class="page-item">
                                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/products?page=${currentPage - 1}${queryString}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                                href="/products?page=${loop.index + 1}${queryString}">
                                                                ${loop.index + 1}
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/products?page=${currentPage + 1}${queryString}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>

                                                </div>
                                            </c:if>
                                        </div>
=======
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-2" value="AULA">
                                    <label class="form-check-label" for="factory-2">AULA</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-3" value="Leobog">
                                    <label class="form-check-label" for="factory-3">Leobog</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-4" value="DareU">
                                    <label class="form-check-label" for="factory-4">DareU</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-5" value="E-Dra">
                                    <label class="form-check-label" for="factory-5">E-Dra</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-6" value="AKKO">
                                    <label class="form-check-label" for="factory-6">AKKO</label>
                                </div>
                            </div>
                            
                            <div class="col-12" id="targetFilter">
                                <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="target-1" value="Văn phòng">
                                    <label class="form-check-label" for="target-1">Văn phòng</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="target-2" value="Sinh viên">
                                    <label class="form-check-label" for="target-2">Sinh viên</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="target-3" value="Cơ bản">
                                    <label class="form-check-label" for="target-3">Cơ bản</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="target-4" value="Gaming">
                                    <label class="form-check-label" for="target-4">Gaming</label>
                                </div>
                            </div>
                            
                            <div class="col-12" id="priceFilter">
                                <div class="mb-2"><b>Mức giá</b></div>
                                <div class="price-range-container">
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="priceMin" class="form-label small text-muted">Từ (VNĐ)</label>
                                            <input type="number" id="priceMin" class="form-control" 
                                                   placeholder="100.000" min="0" step="1000">
                                        </div>
                                        <div class="col-6">
                                            <label for="priceMax" class="form-label small text-muted">Đến (VNĐ)</label>
                                            <input type="number" id="priceMax" class="form-control" 
                                                   placeholder="10.000.000" min="0" step="1000">
                                        </div>
                                    </div>
                                    <div class="price-display mt-2">
                                        <small class="text-muted">
                                            <i class="fas fa-info-circle me-1"></i>
                                            Để trống để không giới hạn giá
                                        </small>
>>>>>>> Stashed changes
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-12">
                                <div class="mb-2"><b>Sắp xếp</b></div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="sort-1" value="gia-tang-dan" name="radio-sort">
                                    <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="sort-2" value="gia-giam-dan" name="radio-sort">
                                    <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="sort-3" checked value="gia-nothing" name="radio-sort">
                                    <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                </div>
                            </div>
                            
                            <div class="col-12">
                                <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4" id="btnFilter">
                                    Lọc Sản Phẩm
                                </button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-12 col-md-8 text-center">
                        <div class="row g-4">
                            <c:if test="${totalPages == 0}">
                                <div>Không tìm thấy sản phẩm</div>
                            </c:if>
                            <c:forEach var="product" items="${products}">
                                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                                    <div class="product-item bg-white border rounded-lg shadow-sm mb-4 product-card">
                                        <div class="product-img position-relative overflow-hidden product-image-container">
                                            <a href="/product/${product.id}">
                                                <img class="img-fluid w-100" src="/images/product/${product.image}" alt="${product.name}" style="height: 250px; object-fit: cover;" />
                                            </a>
                                            
                                            <!-- Discount Badge -->
                                            <c:if test="${product.discount > 0}">
                                                <div class="position-absolute top-0 start-0 m-2">
                                                    <span class="badge bg-danger text-white px-2 py-1 rounded-pill discount-badge">
                                                        -${product.discount}%
                                                    </span>
                                                </div>
                                            </c:if>
                                            
                                            <!-- Stock Status Badge -->
                                            <div class="position-absolute top-0 end-0 m-2">
                                                <c:choose>
                                                    <c:when test="${product.quantity > 0}">
                                                        <span class="badge bg-success text-white px-2 py-1 rounded-pill stock-badge">
                                                            <i class="fa fa-check me-1"></i>Còn hàng
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary text-white px-2 py-1 rounded-pill stock-badge">
                                                            <i class="fa fa-times me-1"></i>Hết hàng
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            
                                            <!-- Cart Button Overlay -->
                                            <div class="cart-btn-overlay">
                                                <div class="d-flex gap-2">
                                                    <!-- Wishlist Button -->
                                                    <button class="btn btn-outline-light wishlist-btn" 
                                                            data-product-id="${product.id}" 
                                                            title="Thêm vào danh sách yêu thích">
                                                        <i class="far fa-heart wishlist-icon"></i>
                                                    </button>
                                                    
                                                    <!-- Cart Button -->
                                                    <c:choose>
                                                        <c:when test="${product.quantity > 0}">
                                                            <button class="btn btn-primary cart-btn btnAddToCart" data-product-id="${product.id}" style="font-size: 10px;">
                                                                <i class="fa fa-shopping-bag me-1"></i>
                                                                Thêm
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="btn btn-secondary cart-btn disabled" disabled style="font-size: 10px;">
                                                                <i class="fa fa-times me-1"></i>
                                                                Hết
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="p-3">
                                            <!-- Product Name -->
                                            <h6 class="product-name mb-2">
                                                <a href="/product/${product.id}" class="text-decoration-none text-dark fw-bold">
                                                    ${product.name}
                                                </a>
                                            </h6>
                                            
                                            <!-- Product Rating -->
                                            <div class="product-rating-info">
                                                <c:choose>
                                                    <c:when test="${product.totalReviews > 0}">
                                                        <div class="rating-display">
                                                            <c:forEach var="i" begin="1" end="5">
                                                                <c:choose>
                                                                    <c:when test="${i <= product.averageRating}">
                                                                        <span class="star">★</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="star empty">★</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </div>
                                                        <span class="rating-value">${product.averageRating}</span>
                                                        <span class="review-count">(${product.totalReviews})</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="rating-display">
                                                            <c:forEach var="i" begin="1" end="5">
                                                                <span class="star empty">★</span>
                                                            </c:forEach>
                                                        </div>

                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            
                                            <!-- Product Short Description -->
                                            <p class="text-muted small mb-3" style="height: 40px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
                                                ${product.shortDesc}
                                            </p>
                                            
                                            <!-- Price Section -->
                                            <div class="price-section">
                                                <c:choose>
                                                    <c:when test="${product.discount > 0}">
                                                        <!-- Original Price (Crossed out) -->
                                                        <div class="text-muted small text-decoration-line-through mb-1">
                                                            Giá gốc: <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                        </div>
                                                        <!-- Discounted Price -->
                                                        <div class="text-danger fw-bold fs-5 mb-1">
                                                            <fmt:formatNumber type="number" value="${product.discountedPrice}" /> đ
                                                        </div>
                                                        <!-- Savings Amount -->
                                                        <div class="text-success small">
                                                            Tiết kiệm: <fmt:formatNumber type="number" value="${product.discountAmount}" /> đ
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- Regular Price -->
                                                        <div class="text-primary fw-bold fs-5 mb-1">
                                                            <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                        </div>
                                                        <div class="text-muted small">
                                                            Giá tốt nhất
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            
                                            <!-- Action Button -->

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <!-- Pagination -->
                        <c:if test="${totalPages > 1}">
                            <div class="row mt-5">
                                <div class="col-12">
                                    <div class="pagination-wrapper">
                                        <nav aria-label="Phân trang sản phẩm">
                                            <ul class="pagination mb-3" style="display: flex !important; flex-direction: row !important; list-style: none !important; padding-left: 0 !important; margin-bottom: 0 !important;">
                                                <!-- Previous Button -->
                                                <c:if test="${currentPage > 1}">
                                                    <li class="page-item" style="display: inline-block !important; margin: 0 2px !important;">
                                                        <c:choose>
                                                            <c:when test="${not empty queryString and queryString != ''}">
                                                                <a class="page-link" href="?${queryString}&page=${currentPage - 1}" aria-label="Trang trước" style="display: block !important; text-decoration: none !important;">
                                                                    <span aria-hidden="true">&laquo; Trước</span>
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a class="page-link" href="?page=${currentPage - 1}" aria-label="Trang trước" style="display: block !important; text-decoration: none !important;">
                                                                    <span aria-hidden="true">&laquo; Trước</span>
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </c:if>
                                                
                                                <!-- Page Numbers -->
                                                <c:forEach begin="1" end="${totalPages}" var="pageNum">
                                                    <c:choose>
                                                        <c:when test="${pageNum == currentPage}">
                                                            <li class="page-item active" style="display: inline-block !important; margin: 0 2px !important;">
                                                                <span class="page-link" style="display: block !important;">${pageNum}</span>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li class="page-item" style="display: inline-block !important; margin: 0 2px !important;">
                                                                <c:choose>
                                                                    <c:when test="${not empty queryString and queryString != ''}">
                                                                        <a class="page-link" href="?${queryString}&page=${pageNum}" style="display: block !important; text-decoration: none !important;">${pageNum}</a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a class="page-link" href="?page=${pageNum}" style="display: block !important; text-decoration: none !important;">${pageNum}</a>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                
                                                <!-- Next Button -->
                                                <c:if test="${currentPage < totalPages}">
                                                    <li class="page-item" style="display: inline-block !important; margin: 0 2px !important;">
                                                        <c:choose>
                                                            <c:when test="${not empty queryString and queryString != ''}">
                                                                <a class="page-link" href="?${queryString}&page=${currentPage + 1}" aria-label="Trang sau" style="display: block !important; text-decoration: none !important;">
                                                                    <span aria-hidden="true">Sau &raquo;</span>
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a class="page-link" href="?page=${currentPage + 1}" aria-label="Trang sau" style="display: block !important; text-decoration: none !important;">
                                                                    <span aria-hidden="true">Sau &raquo;</span>
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </nav>
                                    </div>
                                    
                                    <!-- Page Info -->
                                    <div class="text-center">
                                        <small class="text-muted">
                                            Trang ${currentPage} / ${totalPages}
                                            <c:if test="${totalPages > 0}">
                                                | Hiển thị ${(currentPage-1)*12 + 1} - ${currentPage*12 > totalPages*12 ? totalPages*12 : currentPage*12} sản phẩm
                                            </c:if>
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Single Product End -->

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
            // Price input validation
            $('#priceMin, #priceMax').on('input', function() {
                var value = $(this).val();
                if (value < 0) {
                    $(this).val(0);
                }
            });
            
            // Filter functionality
            $('#btnFilter').click(function() {
                var factories = [];
                var targets = [];
                var priceMin = $('#priceMin').val();
                var priceMax = $('#priceMax').val();
                var sort = $('input[name="radio-sort"]:checked').val();
                
                $('#factoryFilter input:checked').each(function() {
                    factories.push($(this).val());
                });
                
                $('#targetFilter input:checked').each(function() {
                    targets.push($(this).val());
                });
                
                var params = new URLSearchParams();
                if (factories.length > 0) params.append('factories', factories.join(','));
                if (targets.length > 0) params.append('targets', targets.join(','));
                if (priceMin && priceMin.trim() !== '') params.append('priceMin', priceMin.trim());
                if (priceMax && priceMax.trim() !== '') params.append('priceMax', priceMax.trim());
                if (sort) params.append('sort', sort);
                
                // Giữ lại parameter type nếu có
                var urlParams = new URLSearchParams(window.location.search);
                var type = urlParams.get('type');
                if (type) params.append('type', type);
                
                window.location.href = '/products?' + params.toString();
            });
            
            // Auto-check filters based on URL parameters
            var urlParams = new URLSearchParams(window.location.search);
            
            // Check factories
            var factories = urlParams.get('factories');
            if (factories) {
                var factoryArray = factories.split(',');
                factoryArray.forEach(function(factory) {
                    $('input[value="' + factory + '"]').prop('checked', true);
                });
            }
            
            // Check targets
            var targets = urlParams.get('targets');
            if (targets) {
                var targetArray = targets.split(',');
                targetArray.forEach(function(target) {
                    $('input[value="' + target + '"]').prop('checked', true);
                });
            }
            
            // Set price range
            var priceMinParam = urlParams.get('priceMin');
            var priceMaxParam = urlParams.get('priceMax');
            if (priceMinParam) {
                $('#priceMin').val(priceMinParam);
            }
            if (priceMaxParam) {
                $('#priceMax').val(priceMaxParam);
            }
            
            // Check sort
            var sort = urlParams.get('sort');
            if (sort) {
                $('input[value="' + sort + '"]').prop('checked', true);
            }
            
            // Wishlist functionality
            $('.wishlist-btn').click(function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                var productId = $(this).data('product-id');
                var $btn = $(this);
                var $icon = $btn.find('.wishlist-icon');
                
                $.ajax({
                    url: '/wishlist/toggle/' + productId,
                    type: 'POST',
                    beforeSend: function(xhr) {
                        var token = $("meta[name='_csrf']").attr("content");
                        var header = $("meta[name='_csrf_header']").attr("content");
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(response) {
                        if (response.success) {
                            if (response.inWishlist) {
                                $btn.addClass('active');
                                $icon.removeClass('far').addClass('fas');
                            } else {
                                $btn.removeClass('active');
                                $icon.removeClass('fas').addClass('far');
                            }
                            
                            // Show toast notification
                            $.toast({
                                heading: 'Thành công',
                                text: response.message,
                                position: 'top-right',
                                loaderBg: '#ff6849',
                                icon: 'success',
                                hideAfter: 3000,
                                stack: 6
                            });
                        } else {
                            $.toast({
                                heading: 'Lỗi',
                                text: response.message,
                                position: 'top-right',
                                loaderBg: '#ff6849',
                                icon: 'error',
                                hideAfter: 3000,
                                stack: 6
                            });
                        }
                    },
                    error: function(xhr) {
                        var response = xhr.responseJSON;
                        var message = response ? response.message : 'Có lỗi xảy ra khi thực hiện chức năng này';
                        
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
        });
    </script>
</body>

</html> 