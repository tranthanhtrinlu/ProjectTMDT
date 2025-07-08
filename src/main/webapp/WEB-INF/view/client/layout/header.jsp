<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Navbar start -->
<<<<<<< Updated upstream
        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="/">KeyBoardShop</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="/show">Sản phẩm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/cart">Giỏ hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/custom">Tùy Chỉnh Bàn Phím</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/about-us">Giới Thiệu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/support">Hỗ Trợ</a>
                                </li>

                                <!-- Kiểm tra đăng nhập để hiển thị liên kết profile -->
                                <c:if test="${not empty sessionScope.id}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="fas fa-user"></i> Tài khoản
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li><a class="dropdown-item" href="/profile/edit">Thay đổi thông tin</a></li>
                                            <li><a class="dropdown-item" href="/profile/change-password">Đổi mật khẩu</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <!-- Hiển thị đăng nhập/đăng ký nếu chưa đăng nhập -->
                                <c:if test="${empty sessionScope.id}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="/login">Đăng nhập</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/register">Đăng ký</a>
                                    </li>
                                </c:if>
                            </ul>
=======
        <div class="fixed-top w-100" style="z-index: 1000;">
            <nav class="navbar navbar-expand-xl w-100" style="padding: 1rem 0; margin: 0;">
                <div class="container-fluid">
                    <div class="container">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <a href="/" class="navbar-brand d-flex align-items-center">
<%--                                <!-- Option 1: Custom SVG Logo (Current) -->--%>
<%--                                <div class="logo-container me-3">--%>
<%--                                    <svg width="50" height="50" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                        <defs>--%>
<%--                                            <linearGradient id="logoGradient" x1="0%" y1="0%" x2="100%" y2="100%">--%>
<%--                                                <stop offset="0%" style="stop-color:#00d4ff;stop-opacity:1" />--%>
<%--                                                <stop offset="50%" style="stop-color:#5b85ff;stop-opacity:1" />--%>
<%--                                                <stop offset="100%" style="stop-color:#a855f7;stop-opacity:1" />--%>
<%--                                            </linearGradient>--%>
<%--                                            <filter id="glow">--%>
<%--                                                <feGaussianBlur stdDeviation="2" result="coloredBlur"/>--%>
<%--                                                <feMerge> --%>
<%--                                                    <feMergeNode in="coloredBlur"/>--%>
<%--                                                    <feMergeNode in="SourceGraphic"/>--%>
<%--                                                </feMerge>--%>
<%--                                            </filter>--%>
<%--                                        </defs>--%>
<%--                                        --%>
<%--                                        <!-- Keyboard Base -->--%>
<%--                                        <rect x="10" y="35" width="80" height="45" rx="8" ry="8" --%>
<%--                                              fill="url(#logoGradient)" stroke="rgba(255,255,255,0.3)" stroke-width="2" filter="url(#glow)"/>--%>
<%--                                        --%>
<%--                                        <!-- Keys Row 1 -->--%>
<%--                                        <rect x="15" y="40" width="8" height="8" rx="2" fill="rgba(255,255,255,0.9)"/>--%>
<%--                                        <rect x="26" y="40" width="8" height="8" rx="2" fill="rgba(255,255,255,0.9)"/>--%>
<%--                                        <rect x="37" y="40" width="8" height="8" rx="2" fill="rgba(255,255,255,0.9)"/>--%>
<%--                                        <rect x="48" y="40" width="8" height="8" rx="2" fill="rgba(255,255,255,0.9)"/>--%>
<%--                                        <rect x="59" y="40" width="8" height="8" rx="2" fill="rgba(255,255,255,0.9)"/>--%>
<%--                                        <rect x="70" y="40" width="8" height="8" rx="2" fill="rgba(255,255,255,0.9)"/>--%>
<%--                                        <rect x="81" y="40" width="6" height="8" rx="2" fill="rgba(255,255,255,0.9)"/>--%>
<%--                                        --%>
<%--                                        <!-- Keys Row 2 -->--%>
<%--                                        <rect x="15" y="51" width="10" height="8" rx="2" fill="rgba(255,255,255,0.8)"/>--%>
<%--                                        <rect x="28" y="51" width="8" height="8" rx="2" fill="rgba(255,255,255,0.8)"/>--%>
<%--                                        <rect x="39" y="51" width="8" height="8" rx="2" fill="rgba(255,255,255,0.8)"/>--%>
<%--                                        <rect x="50" y="51" width="8" height="8" rx="2" fill="rgba(255,255,255,0.8)"/>--%>
<%--                                        <rect x="61" y="51" width="8" height="8" rx="2" fill="rgba(255,255,255,0.8)"/>--%>
<%--                                        <rect x="72" y="51" width="8" height="8" rx="2" fill="rgba(255,255,255,0.8)"/>--%>
<%--                                        <rect x="83" y="51" width="4" height="8" rx="2" fill="rgba(255,255,255,0.8)"/>--%>
<%--                                        --%>
<%--                                        <!-- Keys Row 3 (Spacebar) -->--%>
<%--                                        <rect x="15" y="62" width="12" height="8" rx="2" fill="rgba(255,255,255,0.7)"/>--%>
<%--                                        <rect x="30" y="62" width="40" height="8" rx="2" fill="rgba(255,255,255,0.9)"/>--%>
<%--                                        <rect x="73" y="62" width="14" height="8" rx="2" fill="rgba(255,255,255,0.7)"/>--%>
<%--                                        --%>
<%--                                        <!-- Decorative Elements -->--%>
<%--                                        <circle cx="50" cy="20" r="8" fill="url(#logoGradient)" opacity="0.8" filter="url(#glow)"/>--%>
<%--                                        <circle cx="50" cy="20" r="4" fill="rgba(255,255,255,0.9)"/>--%>
<%--                                        --%>
<%--                                        <!-- Connecting Lines -->--%>
<%--                                        <path d="M50 28 L50 35" stroke="rgba(255,255,255,0.6)" stroke-width="2" stroke-linecap="round"/>--%>
<%--                                        <path d="M45 30 L55 30" stroke="rgba(255,255,255,0.4)" stroke-width="1" stroke-linecap="round"/>--%>
<%--                                    </svg>--%>
<%--                                </div>--%>
                                
                                <!-- Option 2: Image Logo (Uncomment to use) -->

                                <div class="logo-container me-3">
                                    <img src="/client/img/logokeyz.png"
                                         alt="CustomKeyz Logo"
                                         width="85"
                                         height="85"
                                         class="logo-img">
                                </div>

                                
                                <h1 class="text-white display-6 mb-0">CustomKeyz</h1>
                            </a>
                            
                            <button class="navbar-toggler py-2 px-3 d-xl-none" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarCollapse" style="border: 2px solid white; border-radius: 10px;">
                                <span class="fa fa-bars" style="color: white;"></span>
                            </button>
                            
                            <div class="collapse navbar-collapse" id="navbarCollapse">
                                <div class="navbar-nav mx-auto">
                                    <a href="/" class="nav-item nav-link active">
                                        <i class="fas fa-home me-2"></i>Trang Chủ
                                    </a>
                                    <a href="/products" class="nav-item nav-link">
                                        <i class="fas fa-shopping-bag me-2"></i>Sản Phẩm
                                    </a>
                                    <a href="/about" class="nav-item nav-link">
                                        <i class="fas fa-info-circle me-2"></i>Giới Thiệu
                                    </a>
                                    <a href="/contact" class="nav-item nav-link">
                                        <i class="fas fa-phone me-2"></i>Liên Hệ
                                    </a>
                                </div>
                                
                                <div class="d-flex align-items-center">
                                    <c:if test="${not empty pageContext.request.userPrincipal}">
                                        <a href="/cart" class="position-relative me-4 cart-icon">
                                            <i class="fa fa-shopping-bag fa-2x"></i>
                                            <span
                                                class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-white px-1"
                                                style="top: -8px; left: 18px; height: 22px; min-width: 22px; font-size: 0.8rem; font-weight: bold;" id="sumCart">
                                                ${sessionScope.sum}
                                            </span>
                                        </a>
                                        <div class="dropdown">
                                            <a href="#" class="dropdown user-menu" role="button" id="dropdownMenuLink"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fas fa-user-circle fa-2x" style="color: white;"></i>
                                            </a>

                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
                                                <li class="d-flex align-items-center flex-column user-info">
                                                    <div class="user-avatar-wrapper">
                                                        <img class="user-avatar"
                                                            src="/images/avatar/${sessionScope.avatar}" 
                                                            alt="User Avatar" />
                                                    </div>
                                                    <div class="text-center my-3 user-name">
                                                        <strong><c:out value="${sessionScope.fullName}" /></strong>
                                                    </div>
                                                </li>

                                                <li><a class="dropdown-item" href="/profile">
                                                    <i class="fas fa-user-cog me-2"></i>Quản lý tài khoản
                                                </a></li>

                                                <li><a class="dropdown-item" href="/order-history">
                                                    <i class="fas fa-history me-2"></i>Lịch sử mua hàng
                                                </a></li>
                                                <li><a class="dropdown-item" href="/custom/orders">
                                                    <i class="fas fa-cogs me-2 text-warning"></i>Đơn hàng custom
                                                </a></li>
                                                <li><a class="dropdown-item" href="/wishlist">
                                                    <i class="fas fa-heart me-2 text-danger"></i>Danh sách yêu thích
                                                </a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li>
                                                    <form method="post" action="/logout">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button class="dropdown-item logout-btn">
                                                            <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                                                        </button>
                                                    </form>
                                                </li>
                                            </ul>
                                        </div>
                                    </c:if>
                                    <c:if test="${empty pageContext.request.userPrincipal}">
                                        <a href="/login" class="login-btn">
                                            <i class="fas fa-sign-in-alt me-2"></i>Đăng nhập
                                        </a>
                                    </c:if>
                                </div>
                            </div>
>>>>>>> Stashed changes
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        
        <style>
        /* Logo Styling */
        .logo-container {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            border-radius: 50%;
            background: radial-gradient(circle, rgba(0, 212, 255, 0.1) 0%, transparent 70%);
        }
        
        .logo-container svg {
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            filter: drop-shadow(0 2px 8px rgba(0, 212, 255, 0.3));
        }
        
        .navbar-brand:hover .logo-container {
            transform: scale(1.05);
        }
        
        .navbar-brand:hover .logo-container svg {
            filter: drop-shadow(0 4px 15px rgba(0, 212, 255, 0.5));
        }
        
        /* Logo Animation */
        @keyframes logoFloat {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-3px); }
        }
        
        .logo-container {
            animation: logoFloat 3s ease-in-out infinite;
        }
        
        /* Logo Glow Effect */
        .logo-container::before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            background: radial-gradient(circle, rgba(0, 212, 255, 0.2) 0%, transparent 70%);
            border-radius: 50%;
            opacity: 0;
            transition: all 0.3s ease;
            z-index: -1;
        }
        
        .navbar-brand:hover .logo-container::before {
            opacity: 1;
            transform: scale(1.2);
        }
        
        /* Responsive Logo */
        @media (max-width: 768px) {
            .logo-container svg {
                width: 40px;
                height: 40px;
            }
            .logo-img {
                width: 65px !important;
                height: 65px !important;
            }
        }
        
        @media (max-width: 576px) {
            .logo-container svg {
                width: 35px;
                height: 35px;
            }
            .logo-img {
                width: 55px !important;
                height: 55px !important;
            }
        }
        
        /* Fixed Header Styles */
        .fixed-top {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
            padding: 0 !important;
            margin: 0 !important;
        }
        
        .navbar {
            background: transparent !important;
            border: none !important;
        }
        
        .navbar-brand h1 {
            background: linear-gradient(45deg, #fff, #f8f9fa);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 800;
            font-size: 2.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            margin: 0;
        }
        
        .navbar-nav .nav-link {
            color: white !important;
            font-weight: 600;
            margin: 0 10px;
            padding: 10px 20px !important;
            border-radius: 50px;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            position: relative;
            overflow: hidden;
        }
        
        .navbar-nav .nav-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }
        
        .navbar-nav .nav-link:hover::before {
            left: 100%;
        }
        
        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            background: rgba(255, 255, 255, 0.2);
            color: white !important;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        /* User Menu Styling */
        .dropdown-menu {
            background: white;
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            margin-top: 10px;
            min-width: 280px;
        }
        
        .dropdown-menu::before {
            content: '';
            position: absolute;
            top: -8px;
            right: 20px;
            width: 16px;
            height: 16px;
            background: white;
            transform: rotate(45deg);
            border-radius: 3px;
        }
        
        .dropdown-item {
            padding: 10px 15px;
            border-radius: 10px;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            font-weight: 500;
        }
        
        .dropdown-item:hover {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            transform: translateX(5px);
        }
        
        /* Cart Icon Styling */
        .fa-shopping-bag {
            color: white;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }
        
        .fa-shopping-bag:hover {
            transform: scale(1.1);
            color: #f8f9fa;
        }
        
        .position-absolute.bg-secondary {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%) !important;
            border: 2px solid white;
            font-weight: bold;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        
        .user-avatar-wrapper {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 4px solid;
            border-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%) 1;
            padding: 4px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin-bottom: 1rem;
        }
        
        .user-avatar {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .user-info {
            padding: 1rem 0;
        }
        
        .user-name {
            color: #333;
            font-size: 1.1rem;
        }
        
        .login-btn {
            color: white !important;
            text-decoration: none;
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 50px;
            background: rgba(255, 255, 255, 0.2);
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            border: 2px solid rgba(255, 255, 255, 0.3);
        }
        
        .login-btn:hover {
            background: white;
            color: #667eea !important;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .logout-btn {
            border: none;
            background: none;
            width: 100%;
            text-align: left;
        }
        
        .cart-icon {
            position: relative;
        }
        
        .cart-icon::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            opacity: 0;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }
        
        .cart-icon:hover::after {
            opacity: 1;
            transform: translate(-50%, -50%) scale(1.2);
        }

        /* Mobile menu styling */
        @media (max-width: 1199px) {
            .navbar-collapse {
                background: rgba(102, 126, 234, 0.95);
                border-radius: 15px;
                margin-top: 1rem;
                padding: 1rem;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                z-index: 1000;
            }
        
            .navbar-nav {
                margin-bottom: 1rem;
            }
        
            .navbar-nav .nav-link {
                margin: 0.5rem 0;
                display: block;
            }
        }
        
        /* Ensure full width */
        body {
            margin: 0;
            padding: 0;
        }
        
        .container-fluid {
            padding: 0;
            margin: 0;
            max-width: 100%;
            width: 100%;
        }
        
        /* Logo Image Option */
        .logo-img {
            object-fit: contain;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            filter: drop-shadow(0 3px 12px rgba(0, 212, 255, 0.5));
        }
        
        .navbar-brand:hover .logo-img {
            transform: scale(1.08);
            filter: drop-shadow(0 5px 18px rgba(0, 212, 255, 0.7));
        }
        
        /* Logo Container Enhanced */
        .logo-container {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }
        </style>
        <!-- Navbar End -->