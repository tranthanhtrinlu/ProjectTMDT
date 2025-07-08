<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
<<<<<<< Updated upstream
                <title>Trang chủ - KeyBoardShop</title>
=======
                <title>Trang chủ - KeyboardShop | Bàn phím cơ chất lượng cao</title>
>>>>>>> Stashed changes

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&family=Be+Vietnam+Pro:wght@300;400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&family=Orbitron:wght@400;700;800;900&display=swap"
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

                <meta name="_csrf" content="${_csrf.token}" />
                <!-- default header name is X-CSRF-TOKEN -->
                <meta name="_csrf_header" content="${_csrf.headerName}" />

                <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                    rel="stylesheet">

                <!-- AOS Animation Library -->
                <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

                <style>
                body {
                    font-family: 'Be Vietnam Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                    font-weight: 400;
                    line-height: 1.6;
                    color: #333;
                    -webkit-font-smoothing: antialiased;
                    -moz-osx-font-smoothing: grayscale;
                }
                
                /* Enhanced Typography for Vietnamese & Tech Theme */
                h1, h2, h3, h4, h5, h6 {
                    font-family: 'Montserrat', sans-serif;
                    font-weight: 700;
                    line-height: 1.3;
                    letter-spacing: -0.01em;
                }
                
                .hero-title {
                    font-family: 'Montserrat', sans-serif !important;
                    font-weight: 800 !important;
                    font-size: 5rem !important;
                    line-height: 1.1 !important;
                    letter-spacing: -0.02em !important;
                    text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.5) !important;
                    word-spacing: 0.1em !important;
                }
                
                .hero-subtitle {
                    font-family: 'Be Vietnam Pro', sans-serif !important;
                    font-weight: 600 !important;
                    font-size: 1.5rem !important;
                    letter-spacing: 1px !important;
                    text-transform: uppercase !important;
                    word-spacing: 0.2em !important;
                }
                
                .text-gradient {
                    background: linear-gradient(45deg, #00d4ff, #5b85ff, #a855f7) !important;
                    -webkit-background-clip: text !important;
                    -webkit-text-fill-color: transparent !important;
                    background-clip: text !important;
                    font-weight: 900 !important;
                    letter-spacing: -0.01em !important;
                }
                
                .products-header h1 {
                    font-family: 'Montserrat', sans-serif !important;
                    font-weight: 800 !important;
                    font-size: 4.5rem !important;
                    letter-spacing: -0.01em !important;
                    margin-bottom: 1.5rem !important;
                    position: relative !important;
                    word-spacing: 0.1em !important;
                }
                
                .products-header h1::after {
                    content: '';
                    position: absolute;
                    bottom: -10px;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 100px;
                    height: 4px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    border-radius: 2px;
                }
                
                .section-title {
                    font-family: 'Montserrat', sans-serif !important;
                    font-weight: 700 !important;
                    font-size: 3.5rem !important;
                    color: #333 !important;
                    letter-spacing: -0.01em !important;
                    margin-bottom: 1.5rem !important;
                    word-spacing: 0.1em !important;
                }
                
                .section-subtitle {
                    font-family: 'Be Vietnam Pro', sans-serif !important;
                    font-weight: 400 !important;
                    font-size: 1.3rem !important;
                    color: #666 !important;
                    line-height: 1.7 !important;
                    max-width: 650px;
                    margin: 0 auto;
                    word-spacing: 0.05em !important;
                }
                
                .product-name a {
                    font-family: 'Be Vietnam Pro', sans-serif !important;
                    font-weight: 700 !important;
                    font-size: 1.15rem !important;
                    color: #333 !important;
                    text-decoration: none !important;
                    transition: all 0.3s ease !important;
                    line-height: 1.4 !important;
                    display: block !important;
                    word-spacing: 0.05em !important;
                }
                
                .product-name a:hover {
                    color: #667eea !important;
                    text-shadow: 0 2px 4px rgba(102, 126, 234, 0.2) !important;
                }
                
                .product-price {
                    font-family: 'Montserrat', sans-serif !important;
                    font-weight: 800 !important;
                    font-size: 1.5rem !important;
                    color: #e74c3c !important;
                    letter-spacing: 0.5px !important;
                }
                
                .about-card h5 {
                    font-family: 'Nunito', sans-serif !important;
                    font-weight: 700 !important;
                    font-size: 1.3rem !important;
                    color: #333 !important;
                    margin-bottom: 1rem !important;
                }
                
                .stat-number {
                    font-family: 'Orbitron', monospace !important;
                    font-weight: 900 !important;
                    font-size: 4rem !important;
                    color: #00d4ff !important;
                    line-height: 1 !important;
                    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3) !important;
                    letter-spacing: 0.05em !important;
                }
                
                .stat-label {
                    font-family: 'Be Vietnam Pro', sans-serif !important;
                    font-weight: 600 !important;
                    font-size: 1.15rem !important;
                    text-transform: uppercase !important;
                    letter-spacing: 1px !important;
                    color: rgba(255, 255, 255, 0.9) !important;
                    word-spacing: 0.1em !important;
                }
                
                /* Button Typography */
                .btn-hero-primary,
                .btn-hero-secondary,
                .view-all-btn,
                .btnAddToCartHomepage {
                    font-family: 'Be Vietnam Pro', sans-serif !important;
                    font-weight: 700 !important;
                    text-transform: uppercase !important;
                    letter-spacing: 1px !important;
                    word-spacing: 0.1em !important;
                }
                
                /* Navbar Typography */
                .navbar-brand h1 {
                    font-family: 'Orbitron', monospace !important;
                    font-weight: 800 !important;
                    font-size: 2.8rem !important;
                    letter-spacing: 0.05em !important;
                    text-transform: uppercase !important;
                }
                
                .navbar-nav .nav-link {
                    font-family: 'Be Vietnam Pro', sans-serif !important;
                    font-weight: 600 !important;
                    font-size: 1.05rem !important;
                    letter-spacing: 0.5px !important;
                    word-spacing: 0.1em !important;
                }
                
                /* Responsive Typography */
                @media (max-width: 768px) {
                    .hero-title {
                        font-size: 3.5rem !important;
                    }
                    
                    .hero-subtitle {
                        font-size: 1.2rem !important;
                    }
                    
                    .products-header h1 {
                        font-size: 3rem !important;
                    }
                    
                    .section-title {
                        font-size: 2.5rem !important;
                    }
                    
                    .stat-number {
                        font-size: 2.8rem !important;
                    }
                    
                    .navbar-brand h1 {
                        font-size: 2rem !important;
                    }
                    
                    .newsletter-section h2 {
                        font-size: 2.2rem !important;
                    }
                }
                
                @media (max-width: 992px) {
                    .hero-title {
                        font-size: 4rem !important;
                    }
                    
                    .products-header h1 {
                        font-size: 3.5rem !important;
                    }
                    
                    .section-title {
                        font-size: 3rem !important;
                    }
                }
                
                /* Special Vietnamese Text Optimization */
                .vietnamese-optimized {
                    font-feature-settings: "kern" 1, "liga" 1;
                    text-rendering: optimizeLegibility;
                }
                
                /* About Section */
                .about-section {
                    background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                    padding: 100px 0;
                    position: relative;
                    overflow: hidden;
                }
                
                .about-section::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="20" cy="20" r="2" fill="%23667eea" opacity="0.1"/><circle cx="80" cy="80" r="2" fill="%23764ba2" opacity="0.1"/><circle cx="40" cy="60" r="1" fill="%23667eea" opacity="0.1"/></svg>');
                    animation: float 20s ease-in-out infinite;
                }
                
                .about-card {
                    background: white;
                    border-radius: 20px;
                    padding: 3rem;
                    box-shadow: var(--card-shadow);
                    transition: var(--transition);
                    border: none;
                    height: 100%;
                }
                
                .about-card:hover {
                    transform: translateY(-10px);
                    box-shadow: var(--card-shadow-hover);
                }
                
                .about-icon {
                    width: 80px;
                    height: 80px;
                    background: var(--primary-gradient);
                    border-radius: 20px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin-bottom: 1.5rem;
                    position: relative;
                    overflow: hidden;
                }
                
                .about-icon::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: -100%;
                    width: 100%;
                    height: 100%;
                    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
                    transition: var(--transition);
                }
                
                .about-card:hover .about-icon::before {
                    left: 100%;
                }
                
                .about-icon i {
                    color: white;
                    font-size: 2rem;
                }
                
                /* Statistics Section */
                .stats-section {
                    background: var(--primary-gradient);
                    color: white;
                    padding: 80px 0;
                    position: relative;
                }
                
                .stats-section::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><polygon points="0,0 100,0 80,100 0,100" fill="%23764ba2" opacity="0.1"/></svg>');
                }
                
                .stat-item {
                    text-align: center;
                    padding: 2rem;
                }
                
                .stat-number {
                    font-size: 3rem;
                    font-weight: 800;
                    margin-bottom: 0.5rem;
                    color: #ffd700;
                }
                
                .stat-label {
                    font-size: 1.1rem;
                    font-weight: 500;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                }
                
                /* Newsletter Section */
                .newsletter-section {
                    background: linear-gradient(135deg, #232526 0%, #414345 100%);
                    color: white;
                    padding: 80px 0;
                    position: relative;
                }
                
                .newsletter-form {
                    max-width: 500px;
                    margin: 0 auto;
                    display: flex;
                    gap: 1rem;
                    margin-top: 2rem;
                }
                
                .newsletter-input {
                    flex: 1;
                    padding: 15px 20px;
                    border: none;
                    border-radius: 50px;
                    font-size: 1rem;
                    outline: none;
                    background: rgba(255, 255, 255, 0.9);
                }
                
                .newsletter-btn {
                    padding: 15px 30px;
                    background: var(--secondary-gradient);
                    border: none;
                    border-radius: 50px;
                    color: white;
                    font-weight: 600;
                    cursor: pointer;
                    transition: var(--transition);
                }
                
                .newsletter-btn:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 5px 15px rgba(240, 147, 251, 0.4);
                }
                
                /* Enhanced Product Section */
                .products-section {
                    padding: 100px 0;
                    background: white;
                }
                
                .products-header {
                    text-align: center;
                    margin-bottom: 4rem;
                }
                
                .products-header h1 {
                    font-size: 3.5rem;
                    font-weight: 800;
                    background: var(--primary-gradient);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    margin-bottom: 1rem;
                }
                
                .products-header p {
                    font-size: 1.2rem;
                    color: #666;
                    max-width: 600px;
                    margin: 0 auto;
                    line-height: 1.6;
                }
                
                .view-all-btn {
                    background: var(--primary-gradient);
                    border: none;
                    padding: 15px 40px;
                    border-radius: 50px;
                    color: white;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    transition: var(--transition);
                    text-decoration: none;
                    display: inline-block;
                    margin-top: 3rem;
                }
                
                .view-all-btn:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
                    color: white;
                }
                
                /* Scroll Animation */
                .animate-fade-up {
                    opacity: 0;
                    transform: translateY(50px);
                    transition: all 0.6s ease-out;
                }
                
                .animate-fade-up.animated {
                    opacity: 1;
                    transform: translateY(0);
                }
                
                @media (max-width: 768px) {
                    .newsletter-form {
                        flex-direction: column;
                    }
                    
                    .products-header h1 {
                        font-size: 2.5rem;
                    }
                    
                    .stat-number {
                        font-size: 2rem;
                    }
                }

                .status-badge {
                    font-size: 10px !important;
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
                    font-size: 11px !important;
                    font-weight: 700;
                    background: linear-gradient(45deg, #dc3545, #e74c3c) !important;
                    border: none !important;
                    box-shadow: 0 2px 4px rgba(220, 53, 69, 0.3);
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
                </style>

            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
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

                <jsp:include page="../layout/banner.jsp" />

                <!-- About Section Start -->
                <section class="about-section" id="about">
                    <div class="container">
                        <div class="row justify-content-center mb-5">
                            <div class="col-lg-8 text-center">
                                <h2 class="section-title" data-aos="fade-up">Tại sao chọn KeyboardShop?</h2>
                                <p class="section-subtitle" data-aos="fade-up" data-aos-delay="100">
                                    Chúng tôi mang đến trải nghiệm mua sắm bàn phím cơ tuyệt vời với chất lượng hàng đầu
                                </p>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                                <div class="about-card text-center">
                                    <div class="about-icon mx-auto">
                                        <i class="fas fa-award"></i>
                                    </div>
                                    <h5 class="fw-bold mb-3">Chất lượng cao</h5>
                                    <p class="text-muted">Sản phẩm chính hãng từ các thương hiệu uy tín hàng đầu thế giới</p>
                                </div>
                            </div>
<<<<<<< Updated upstream
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="product" items="${products}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${product.image}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Key Board</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4 style="font-size: 15px;">
                                                                    <a href="/product/${product.id}">
                                                                        ${product.name}
                                                                    </a>

                                                                </h4>
                                                                <p style="font-size: 13px;">${product.shortDesc}</p>
                                                                <div
                                                                    class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                                                    <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                        class="text-dark  fw-bold mb-3">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.price}" /> đ
                                                                    </p>
                                                                    <!-- <form action="/add-product-to-cart/${product.id}"
                                                                        method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" /> -->

                                                                    <button data-product-id="${product.id}"
                                                                        class="btnAddToCartHomepage mx-auto btn border border-secondary rounded-pill px-3 text-primary">
                                                                        <i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart
                                                                    </button>
                                                                    <!-- </form> -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
=======
                            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                                <div class="about-card text-center">
                                    <div class="about-icon mx-auto">
                                        <i class="fas fa-shipping-fast"></i>
>>>>>>> Stashed changes
                                    </div>
                                    <h5 class="fw-bold mb-3">Giao hàng nhanh</h5>
                                    <p class="text-muted">Giao hàng hỏa tốc trong 2h tại TP.HCM và 24h toàn quốc</p>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                                <div class="about-card text-center">
                                    <div class="about-icon mx-auto">
                                        <i class="fas fa-headset"></i>
                                    </div>
                                    <h5 class="fw-bold mb-3">Hỗ trợ 24/7</h5>
                                    <p class="text-muted">Đội ngũ tư vấn nhiệt tình, chuyên nghiệp hỗ trợ khách hàng 24/7</p>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
                                <div class="about-card text-center">
                                    <div class="about-icon mx-auto">
                                        <i class="fas fa-shield-alt"></i>
                                    </div>
                                    <h5 class="fw-bold mb-3">Bảo hành uy tín</h5>
                                    <p class="text-muted">Chế độ bảo hành rõ ràng, đổi trả miễn phí trong 30 ngày</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- About Section End -->

                <!-- Statistics Section Start -->
                <section class="stats-section">
                    <div class="container">
                        <div class="row text-center">
                            <div class="col-md-3 col-6" data-aos="fade-up">
                                <div class="stat-item">
                                    <div class="stat-number">1000+</div>
                                    <div class="stat-label">Khách hàng hài lòng</div>
                                </div>
                            </div>
                            <div class="col-md-3 col-6" data-aos="fade-up" data-aos-delay="100">
                                <div class="stat-item">
                                    <div class="stat-number">500+</div>
                                    <div class="stat-label">Sản phẩm</div>
                                </div>
                            </div>
                            <div class="col-md-3 col-6" data-aos="fade-up" data-aos-delay="200">
                                <div class="stat-item">
                                    <div class="stat-number">50+</div>
                                    <div class="stat-label">Thương hiệu</div>
                                </div>
                            </div>
                            <div class="col-md-3 col-6" data-aos="fade-up" data-aos-delay="300">
                                <div class="stat-item">
                                    <div class="stat-number">24/7</div>
                                    <div class="stat-label">Hỗ trợ khách hàng</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Statistics Section End -->

                <!-- Products Section Start-->
                <section class="products-section" id="featured-products">
                    <div class="container">
                        <!-- Sản phẩm bán chạy nhất -->
                        <div class="products-header" data-aos="fade-up">
                            <h1>Sản phẩm bán chạy nhất</h1>
                            <p>Những sản phẩm được khách hàng yêu thích và mua nhiều nhất tại KeyboardShop</p>
                        </div>
                        
                        <div class="row g-4 mb-5">
                            <c:forEach var="product" items="${bestSellingProducts}" varStatus="status">
                                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                                    <div class="product-item bg-white border rounded-lg shadow-sm mb-4 product-card">
                                        
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
                                            
                                            <!-- Best Seller Badge -->
                                            <div class="position-absolute top-0 end-0 m-2">
                                                <span class="badge bg-warning text-dark px-2 py-1 rounded-pill">
                                                    <i class="fas fa-fire me-1"></i>Bán chạy
                                                </span>
                                            </div>
                                            
                                            <!-- Stock Status Badge -->
                                            <c:choose>
                                                <c:when test="${product.quantity <= 0}">
                                                    <div class="position-absolute top-50 start-50 translate-middle">
                                                        <span class="badge bg-secondary text-white px-3 py-2 rounded-pill">
                                                            <i class="fas fa-times me-1"></i>Hết hàng
                                                        </span>
                                                    </div>
                                                </c:when>
                                                <c:when test="${product.quantity <= 5}">
                                                    <div class="position-absolute bottom-0 start-0 m-2">
                                                        <span class="badge bg-warning text-dark px-2 py-1 rounded-pill">
                                                            <i class="fas fa-exclamation-triangle me-1"></i>Sắp hết
                                                        </span>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            
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
                                                        <div class="d-flex align-items-center mb-2">
                                                            <div class="rating-stars me-2">
                                                                <c:forEach var="i" begin="1" end="5">
                                                                    <c:choose>
                                                                        <c:when test="${i <= product.averageRating}">
                                                                            <i class="fas fa-star text-warning"></i>
                                                                        </c:when>
                                                                        <c:when test="${i - 0.5 <= product.averageRating}">
                                                                            <i class="fas fa-star-half-alt text-warning"></i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="far fa-star text-muted"></i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </div>
                                                            <small class="text-muted">
                                                                <span class="fw-bold text-warning">${product.averageRating}</span>
                                                                (${product.totalReviews} đánh giá)
                                                            </small>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="rating-placeholder mb-2">
                                                            <small class="text-muted">Chưa có đánh giá</small>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            
                                            <!-- Product Price -->
                                            <div class="product-price mb-3">
                                                <c:choose>
                                                    <c:when test="${product.discount > 0}">
                                                        <div class="d-flex align-items-center gap-2">
                                                            <span class="current-price fw-bold text-primary">
                                                                <fmt:formatNumber value="${product.discountedPrice}" type="number" pattern="#,###" />đ
                                                            </span>
                                                            <span class="original-price text-muted text-decoration-line-through">
                                                                <fmt:formatNumber value="${product.price}" type="number" pattern="#,###" />đ
                                                            </span>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="current-price fw-bold text-primary">
                                                            <fmt:formatNumber value="${product.price}" type="number" pattern="#,###" />đ
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            
                                            <!-- Action Button -->
                                            <div class="d-grid">
                                                <c:choose>
                                                    <c:when test="${product.quantity > 0}">
                                                        <a href="/product/${product.id}" class="btn btn-outline-primary btn-sm">
                                                            <i class="fa fa-eye me-1"></i>Xem chi tiết
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-outline-secondary btn-sm" disabled>
                                                            <i class="fa fa-times me-1"></i>Hết hàng
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <!-- Sản phẩm mới nhất -->
                        <div class="products-header" data-aos="fade-up">
                            <h1>Sản phẩm mới nhất</h1>
                            <p>Những sản phẩm mới nhất vừa được cập nhật tại KeyboardShop</p>
                        </div>
                        
                        <div class="row g-4">
                            <c:forEach var="product" items="${newestProducts}" varStatus="status">
                                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                                    <div class="product-item bg-white border rounded-lg shadow-sm mb-4 product-card">
                                        
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
                                            
                                            <!-- New Badge -->
                                            <div class="position-absolute top-0 end-0 m-2">
                                                <span class="badge bg-success text-white px-2 py-1 rounded-pill">
                                                    <i class="fas fa-star me-1"></i>Mới
                                                </span>
                                            </div>
                                            
                                            <!-- Stock Status Badge -->
                                            <c:choose>
                                                <c:when test="${product.quantity <= 0}">
                                                    <div class="position-absolute top-50 start-50 translate-middle">
                                                        <span class="badge bg-secondary text-white px-3 py-2 rounded-pill">
                                                            <i class="fas fa-times me-1"></i>Hết hàng
                                                        </span>
                                                    </div>
                                                </c:when>
                                                <c:when test="${product.quantity <= 5}">
                                                    <div class="position-absolute bottom-0 start-0 m-2">
                                                        <span class="badge bg-warning text-dark px-2 py-1 rounded-pill">
                                                            <i class="fas fa-exclamation-triangle me-1"></i>Sắp hết
                                                        </span>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            
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
                                                        <div class="d-flex align-items-center mb-2">
                                                            <div class="rating-stars me-2">
                                                                <c:forEach var="i" begin="1" end="5">
                                                                    <c:choose>
                                                                        <c:when test="${i <= product.averageRating}">
                                                                            <i class="fas fa-star text-warning"></i>
                                                                        </c:when>
                                                                        <c:when test="${i - 0.5 <= product.averageRating}">
                                                                            <i class="fas fa-star-half-alt text-warning"></i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="far fa-star text-muted"></i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </div>
                                                            <small class="text-muted">
                                                                <span class="fw-bold text-warning">${product.averageRating}</span>
                                                                (${product.totalReviews} đánh giá)
                                                            </small>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="rating-placeholder mb-2">
                                                            <small class="text-muted">Chưa có đánh giá</small>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            
                                            <!-- Product Price -->
                                            <div class="product-price mb-3">
                                                <c:choose>
                                                    <c:when test="${product.discount > 0}">
                                                        <div class="d-flex align-items-center gap-2">
                                                            <span class="current-price fw-bold text-primary">
                                                                <fmt:formatNumber value="${product.discountedPrice}" type="number" pattern="#,###" />đ
                                                            </span>
                                                            <span class="original-price text-muted text-decoration-line-through">
                                                                <fmt:formatNumber value="${product.price}" type="number" pattern="#,###" />đ
                                                            </span>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="current-price fw-bold text-primary">
                                                            <fmt:formatNumber value="${product.price}" type="number" pattern="#,###" />đ
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            
                                            <!-- Action Button -->
                                            <div class="d-grid">
                                                <c:choose>
                                                    <c:when test="${product.quantity > 0}">
                                                        <a href="/product/${product.id}" class="btn btn-outline-primary btn-sm">
                                                            <i class="fa fa-eye me-1"></i>Xem chi tiết
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-outline-secondary btn-sm" disabled>
                                                            <i class="fa fa-times me-1"></i>Hết hàng
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <div class="text-center" data-aos="fade-up">
                            <a href="/products" class="view-all-btn">
                                <i class="fas fa-arrow-right me-2"></i>Xem tất cả sản phẩm
                            </a>
                        </div>
                    </div>
                </section>
                <!-- Products Section End-->

                <jsp:include page="../layout/feature.jsp" />

                <!-- Newsletter Section Start -->
                <section class="newsletter-section">
                    <div class="container text-center">
                        <div class="row justify-content-center">
                            <div class="col-lg-8" data-aos="fade-up">
                                <h2 class="mb-4">Đăng ký nhận tin khuyến mãi</h2>
                                <p class="mb-4">Nhận thông tin về sản phẩm mới và các chương trình khuyến mãi hấp dẫn</p>
                                <form class="newsletter-form">
                                    <input type="email" class="newsletter-input" placeholder="Nhập email của bạn...">
                                    <button type="submit" class="newsletter-btn">
                                        <i class="fas fa-paper-plane me-2"></i>Đăng ký
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Newsletter Section End -->

                <jsp:include page="../layout/footer.jsp" />

                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top">
                    <i class="fa fa-arrow-up"></i>
                </a>

                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
                
                <!-- AOS Animation -->
                <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                
                <script>
                    // Initialize AOS
                    AOS.init({
                        duration: 800,
                        once: true,
                        offset: 100
                    });

                    // Scroll animations
                    $(window).on('scroll', function() {
                        $('.animate-fade-up').each(function() {
                            var elementTop = $(this).offset().top;
                            var elementBottom = elementTop + $(this).outerHeight();
                            var viewportTop = $(window).scrollTop();
                            var viewportBottom = viewportTop + $(window).height();

                            if (elementBottom > viewportTop && elementTop < viewportBottom) {
                                $(this).addClass('animated');
                            }
                        });
                    });

                    // Counter animation
                    function animateCounters() {
                        $('.stat-number').each(function() {
                            var $this = $(this);
                            var countTo = $this.attr('data-count') || $this.text().replace(/[^0-9]/g, '');
                            
                            $({ countNum: 0 }).animate({
                                countNum: countTo
                            }, {
                                duration: 2000,
                                easing: 'swing',
                                step: function() {
                                    $this.text(Math.floor(this.countNum) + '+');
                                },
                                complete: function() {
                                    $this.text(this.countNum + '+');
                                }
                            });
                        });
                    }

                    // Newsletter form
                    $('.newsletter-form').on('submit', function(e) {
                        e.preventDefault();
                        var email = $('.newsletter-input').val();
                        if (email) {
                            $.toast({
                                heading: 'Thành công!',
                                text: 'Cảm ơn bạn đã đăng ký nhận tin khuyến mãi!',
                                icon: 'success',
                                position: 'top-right'
                            });
                            $('.newsletter-input').val('');
                        }
                    });

                    // Trigger counter animation when stats section is visible
                    $(window).on('scroll', function() {
                        var statsSection = $('.stats-section');
                        if (statsSection.length) {
                            var elementTop = statsSection.offset().top;
                            var elementBottom = elementTop + statsSection.outerHeight();
                            var viewportTop = $(window).scrollTop();
                            var viewportBottom = viewportTop + $(window).height();

                            if (elementBottom > viewportTop && elementTop < viewportBottom && !statsSection.hasClass('animated')) {
                                statsSection.addClass('animated');
                                animateCounters();
                            }
                        }
                    });
                </script>
            </body>

            </html>