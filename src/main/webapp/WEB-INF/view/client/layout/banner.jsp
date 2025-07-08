<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Hero Start -->
        <div class="container-fluid hero-header" style="margin-top: 80px;">
            <div class="container py-5">
<<<<<<< Updated upstream
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">100% Sản Phẩm Chính Hãng</h4>
                        <h1 class="mb-5 display-3 text-primary">Hàng cao cấp<br /> Rẻ vô địch</h1>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="/client/img/1.jpg"
                                        class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Logitech</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="/client/img/2.jpg" class="img-fluid w-100 h-100 rounded"
                                        alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Akko</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="/client/img/3.jpg" class="img-fluid w-100 h-100 rounded"
                                        alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Fulhen</a>
                                </div>
=======
                <div class="row g-5 align-items-center" style="min-height: calc(100vh - 80px);">
                    <div class="col-md-12 col-lg-7" data-aos="fade-right">
                        <div class="hero-content" style="position: relative; z-index: 10;">
                            <h4 class="mb-4 text-white hero-subtitle">
                                <i class="fas fa-star text-warning me-2"></i>
                                100% Sản Phẩm Chính Hãng
                            </h4>
                            <h1 class="mb-4 display-3 text-white hero-title">
                                Bàn Phím Cơ<br /> 
                                <span class="text-gradient">Chất Lượng Cao</span>
                            </h1>
                            <p class="mb-5 text-white hero-description" style="font-family: 'Inter', sans-serif; font-weight: 400; font-size: 1.2rem; line-height: 1.6;">
                                Khám phá bộ sưu tập bàn phím cơ cao cấp với công nghệ hiện đại, 
                                thiết kế đẹp mắt và giá cả hợp lý. Trải nghiệm gõ hoàn hảo cho game thủ và dân văn phòng.
                            </p>
                            <div class="hero-buttons d-flex flex-wrap gap-3">
                                <a href="/products" class="btn btn-hero-primary">
                                    <i class="fas fa-shopping-bag me-2"></i>Mua Ngay
                                </a>
                                <a href="#featured-products" class="btn btn-hero-secondary">
                                    <i class="fas fa-arrow-down me-2"></i>Khám Phá
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5" data-aos="fade-left">
                        <div class="hero-carousel-wrapper" style="position: relative; z-index: 10;">
                            <div id="carouselId" class="carousel slide position-relative modern-carousel" data-bs-ride="carousel" data-bs-interval="4000">
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselId" data-bs-slide-to="0" class="active"></button>
                                    <button type="button" data-bs-target="#carouselId" data-bs-slide-to="1"></button>
                                    <button type="button" data-bs-target="#carouselId" data-bs-slide-to="2"></button>
                                </div>
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <div class="carousel-content">
                                            <img src="/client/img/banphimco.jpg"
                                                class="img-fluid w-100 carousel-image" alt="Bàn phím cơ">
                                            <div class="carousel-overlay">
                                                <a href="/products?category=mechanical" class="btn carousel-btn">
                                                    <i class="fas fa-keyboard me-2"></i>Bàn phím cơ
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="carousel-content">
                                            <img src="/client/img/dungcubanphimco.jpg" 
                                                class="img-fluid w-100 carousel-image" alt="Dụng cụ bàn phím">
                                            <div class="carousel-overlay">
                                                <a href="/products?category=accessories" class="btn carousel-btn">
                                                    <i class="fas fa-tools me-2"></i>Dụng cụ bàn phím
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="carousel-content">
                                            <img src="/client/img/keycapbanphim.webp" 
                                                class="img-fluid w-100 carousel-image" alt="Keycap">
                                            <div class="carousel-overlay">
                                                <a href="/products?category=keycaps" class="btn carousel-btn">
                                                    <i class="fas fa-th me-2"></i>Keycap chất lượng
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="carousel-control-prev modern-carousel-control" type="button" data-bs-target="#carouselId"
                                    data-bs-slide="prev">
                                    <i class="fas fa-chevron-left"></i>
                                </button>
                                <button class="carousel-control-next modern-carousel-control" type="button" data-bs-target="#carouselId"
                                    data-bs-slide="next">
                                    <i class="fas fa-chevron-right"></i>
                                </button>
>>>>>>> Stashed changes
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Floating elements for decoration -->
            <div class="floating-elements">
                <div class="floating-icon floating-icon-1">
                    <i class="fas fa-keyboard"></i>
                </div>
                <div class="floating-icon floating-icon-2">
                    <i class="fas fa-gamepad"></i>
                </div>
                <div class="floating-icon floating-icon-3">
                    <i class="fas fa-laptop"></i>
                </div>
            </div>
        </div>
        
        <style>
        /* Hero Section Enhanced Styles */
        .hero-header {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.9), rgba(118, 75, 162, 0.9)), url(/client/img/hero-img.png);
            background-attachment: fixed;
            background-size: cover;
            background-position: center;
            position: relative;
            overflow: hidden;
            padding: 2rem 0;
        }
        
        .hero-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent 30%, rgba(255, 255, 255, 0.1) 50%, transparent 70%);
            animation: shimmer 3s infinite;
            z-index: 1;
        }
        
        @keyframes shimmer {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }
        
        .hero-content {
            position: relative;
            z-index: 10;
        }
        
        .hero-subtitle {
            font-size: 1.3rem;
            font-weight: 600;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            animation: fadeInUp 1s ease-out 0.2s both;
        }
        
        .hero-title {
            line-height: 1.1;
            margin-bottom: 2rem;
            font-size: 4rem;
            font-weight: 800;
            color: white;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.5);
            animation: fadeInUp 1s ease-out;
        }
        
        .text-gradient {
            background: linear-gradient(45deg, #ffd700, #ffaa00);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .hero-description {
            font-size: 1.2rem;
            line-height: 1.6;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            animation: fadeInUp 1s ease-out 0.4s both;
        }
        
        .hero-buttons {
            margin-top: 2rem;
            animation: fadeInUp 1s ease-out 0.6s both;
        }
        
        .btn-hero-primary {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            border: none;
            padding: 15px 30px;
            font-weight: 700;
            font-size: 1.1rem;
            border-radius: 50px;
            color: white;
            text-decoration: none;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
            display: inline-block;
        }
        
        .btn-hero-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(255, 107, 107, 0.6);
            color: white;
        }
        
        .btn-hero-secondary {
            background: transparent;
            border: 2px solid white;
            padding: 15px 30px;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 50px;
            color: white;
            text-decoration: none;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            display: inline-block;
        }
        
        .btn-hero-secondary:hover {
            background: white;
            color: #667eea;
            transform: translateY(-2px);
        }
        
        /* Modern Carousel Styles */
        .hero-carousel-wrapper {
            position: relative;
            z-index: 10;
            animation: fadeInUp 1s ease-out 0.8s both;
        }
        
        .modern-carousel {
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }
        
        .carousel-content {
            position: relative;
            height: 400px;
            overflow: hidden;
        }
        
        .carousel-image {
            height: 100%;
            object-fit: cover;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }
        
        .carousel-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.2));
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }
        
        .carousel-item:hover .carousel-overlay {
            opacity: 1;
        }
        
        .carousel-item:hover .carousel-image {
            transform: scale(1.1);
        }
        
        .carousel-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 15px 30px;
            font-weight: 600;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        .carousel-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
            color: white;
        }
        
        .modern-carousel-control {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.9);
            border: none;
            color: #667eea;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }
        
        .modern-carousel-control:hover {
            background: white;
            color: #667eea;
            transform: translateY(-50%) scale(1.1);
        }
        
        .carousel-control-prev.modern-carousel-control {
            left: 20px;
        }
        
        .carousel-control-next.modern-carousel-control {
            right: 20px;
        }
        
        .carousel-indicators {
            bottom: 20px;
            z-index: 10;
        }
        
        .carousel-indicators button {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            border: 2px solid white;
            background: transparent;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            margin: 0 5px;
        }
        
        .carousel-indicators button.active {
            background: white;
            transform: scale(1.2);
        }
        
        /* Floating Elements */
        .floating-elements {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            pointer-events: none;
            z-index: 1;
        }
        
        .floating-icon {
            position: absolute;
            color: rgba(255, 255, 255, 0.1);
            font-size: 3rem;
            animation: float 6s ease-in-out infinite;
        }
        
        .floating-icon-1 {
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }
        
        .floating-icon-2 {
            top: 60%;
            right: 15%;
            animation-delay: 2s;
        }
        
        .floating-icon-3 {
            bottom: 20%;
            left: 20%;
            animation-delay: 4s;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-description {
                font-size: 1rem;
            }
            
            .hero-buttons {
                flex-direction: column;
                gap: 1rem;
            }
            
            .btn-hero-primary,
            .btn-hero-secondary {
                width: 100%;
                text-align: center;
            }
            
            .carousel-content {
                height: 300px;
            }
            
            .floating-icon {
                display: none;
            }
            
            .hero-header {
                margin-top: 60px;
                padding: 1rem 0;
            }
        }
        
        @media (max-width: 992px) {
            .hero-title {
                font-size: 3rem;
            }
        }
        </style>
        <!-- Hero End -->