<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới thiệu - KeyboardShop | Bàn phím cơ chất lượng cao</title>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&family=Be+Vietnam+Pro:wght@300;400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&family=Orbitron:wght@400;700;800;900&display=swap" rel="stylesheet">

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

        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 120px 0 80px;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="20" cy="20" r="2" fill="%23ffffff" opacity="0.1"/><circle cx="80" cy="80" r="2" fill="%23ffffff" opacity="0.1"/><circle cx="40" cy="60" r="1" fill="%23ffffff" opacity="0.1"/></svg>');
            animation: float 20s ease-in-out infinite;
        }

        .hero-title {
            font-family: 'Montserrat', sans-serif !important;
            font-weight: 800 !important;
            font-size: 4rem !important;
            line-height: 1.1 !important;
            letter-spacing: -0.02em !important;
            margin-bottom: 1.5rem !important;
        }

        .hero-subtitle {
            font-family: 'Be Vietnam Pro', sans-serif !important;
            font-weight: 400 !important;
            font-size: 1.3rem !important;
            opacity: 0.9 !important;
            max-width: 600px !important;
        }

        .about-section {
            padding: 100px 0;
            background: #f8f9fa;
        }

        .about-card {
            background: white;
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            border: none;
        }

        .about-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .about-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
        }

        .about-icon i {
            color: white;
            font-size: 2rem;
        }

        .stats-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 80px 0;
        }

        .stat-item {
            text-align: center;
            padding: 2rem;
        }

        .stat-number {
            font-family: 'Orbitron', monospace !important;
            font-weight: 900 !important;
            font-size: 3.5rem !important;
            color: #ffd700 !important;
            margin-bottom: 0.5rem !important;
        }

        .stat-label {
            font-family: 'Be Vietnam Pro', sans-serif !important;
            font-weight: 600 !important;
            font-size: 1.1rem !important;
            text-transform: uppercase !important;
            letter-spacing: 1px !important;
        }

        .timeline-section {
            padding: 100px 0;
            background: white;
        }

        .timeline-item {
            position: relative;
            padding: 2rem;
            margin-bottom: 2rem;
            border-left: 4px solid #667eea;
            background: #f8f9fa;
            border-radius: 0 10px 10px 0;
        }

        .timeline-item::before {
            content: '';
            position: absolute;
            left: -12px;
            top: 2rem;
            width: 20px;
            height: 20px;
            background: #667eea;
            border-radius: 50%;
            border: 4px solid white;
        }

        .team-section {
            padding: 100px 0;
            background: #f8f9fa;
        }

        .team-card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            height: 100%;
        }

        .team-card:hover {
            transform: translateY(-10px);
        }

        .team-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin: 0 auto 1.5rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 3rem;
            font-weight: bold;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem !important;
            }
            
            .hero-subtitle {
                font-size: 1.1rem !important;
            }
            
            .stat-number {
                font-size: 2.5rem !important;
            }
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

    <!-- Hero Section Start -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6" data-aos="fade-right">
                    <h1 class="hero-title">Về KeyboardShop</h1>
                    <p class="hero-subtitle">
                        Chúng tôi là đơn vị tiên phong trong lĩnh vực phân phối bàn phím cơ chất lượng cao tại Việt Nam, 
                        mang đến trải nghiệm gõ phím tuyệt vời cho mọi người dùng.
                    </p>
                </div>
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="text-center">
                        <i class="fas fa-keyboard" style="font-size: 8rem; opacity: 0.3;"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- About Section Start -->
    <section class="about-section">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-lg-8 text-center">
                    <h2 class="section-title" data-aos="fade-up">Tại sao chọn KeyboardShop?</h2>
                    <p class="section-subtitle" data-aos="fade-up" data-aos-delay="100">
                        Chúng tôi cam kết mang đến những sản phẩm chất lượng nhất với dịch vụ tối ưu
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
                        <p class="text-muted">Sản phẩm chính hãng từ các thương hiệu uy tín hàng đầu thế giới với chất lượng được kiểm định nghiêm ngặt</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                    <div class="about-card text-center">
                        <div class="about-icon mx-auto">
                            <i class="fas fa-shipping-fast"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Giao hàng nhanh</h5>
                        <p class="text-muted">Giao hàng hỏa tốc trong 2h tại TP.HCM và 24h toàn quốc với đội ngũ giao hàng chuyên nghiệp</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                    <div class="about-card text-center">
                        <div class="about-icon mx-auto">
                            <i class="fas fa-headset"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Hỗ trợ 24/7</h5>
                        <p class="text-muted">Đội ngũ tư vấn nhiệt tình, chuyên nghiệp hỗ trợ khách hàng 24/7 qua nhiều kênh khác nhau</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
                    <div class="about-card text-center">
                        <div class="about-icon mx-auto">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Bảo hành uy tín</h5>
                        <p class="text-muted">Chế độ bảo hành rõ ràng, đổi trả miễn phí trong 30 ngày với quy trình đơn giản, nhanh chóng</p>
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
                        <div class="stat-label">Sản phẩm đa dạng</div>
                    </div>
                </div>
                <div class="col-md-3 col-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="stat-item">
                        <div class="stat-number">50+</div>
                        <div class="stat-label">Thương hiệu uy tín</div>
                    </div>
                </div>
                <div class="col-md-3 col-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="stat-item">
                        <div class="stat-number">5+</div>
                        <div class="stat-label">Năm kinh nghiệm</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Statistics Section End -->

    <!-- Timeline Section Start -->
    <section class="timeline-section">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-lg-8 text-center">
                    <h2 class="section-title" data-aos="fade-up">Hành trình phát triển</h2>
                    <p class="section-subtitle" data-aos="fade-up" data-aos-delay="100">
                        Những cột mốc quan trọng trong quá trình xây dựng và phát triển KeyboardShop
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="timeline-item" data-aos="fade-up">
                        <h5 class="fw-bold text-primary">2019 - Khởi đầu</h5>
                        <p class="mb-0">KeyboardShop được thành lập với mục tiêu mang đến những bàn phím cơ chất lượng cao cho cộng đồng game thủ và dân công nghệ Việt Nam.</p>
                    </div>
                    <div class="timeline-item" data-aos="fade-up" data-aos-delay="100">
                        <h5 class="fw-bold text-primary">2020 - Mở rộng</h5>
                        <p class="mb-0">Mở rộng danh mục sản phẩm với hơn 100 mẫu bàn phím từ các thương hiệu nổi tiếng như Razer, Logitech, Corsair, Ducky...</p>
                    </div>
                    <div class="timeline-item" data-aos="fade-up" data-aos-delay="200">
                        <h5 class="fw-bold text-primary">2021 - Dịch vụ</h5>
                        <p class="mb-0">Triển khai dịch vụ giao hàng nhanh và hỗ trợ khách hàng 24/7, đạt được 1000+ khách hàng hài lòng.</p>
                    </div>
                    <div class="timeline-item" data-aos="fade-up" data-aos-delay="300">
                        <h5 class="fw-bold text-primary">2022 - Công nghệ</h5>
                        <p class="mb-0">Phát triển website thương mại điện tử hiện đại với trải nghiệm mua sắm tối ưu và thanh toán đa dạng.</p>
                    </div>
                    <div class="timeline-item" data-aos="fade-up" data-aos-delay="400">
                        <h5 class="fw-bold text-primary">2023 - Tương lai</h5>
                        <p class="mb-0">Tiếp tục mở rộng thị trường, đưa KeyboardShop trở thành địa chỉ tin cậy hàng đầu về bàn phím cơ tại Việt Nam.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Timeline Section End -->

    <!-- Team Section Start -->
    <section class="team-section">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-lg-8 text-center">
                    <h2 class="section-title" data-aos="fade-up">Đội ngũ của chúng tôi</h2>
                    <p class="section-subtitle" data-aos="fade-up" data-aos-delay="100">
                        Những con người tâm huyết đứng sau sự thành công của KeyboardShop
                    </p>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                    <div class="team-card">
                        <div class="team-avatar">NT</div>
                        <h5 class="fw-bold mb-2">Nguyễn Văn A</h5>
                        <p class="text-muted mb-2">Giám đốc điều hành</p>
                        <p class="small text-muted">Chuyên gia về công nghệ và kinh doanh với hơn 10 năm kinh nghiệm trong lĩnh vực IT.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                    <div class="team-card">
                        <div class="team-avatar">TL</div>
                        <h5 class="fw-bold mb-2">Trần Thị B</h5>
                        <p class="text-muted mb-2">Trưởng phòng kinh doanh</p>
                        <p class="small text-muted">Chuyên gia về marketing và bán hàng với khả năng thấu hiểu nhu cầu khách hàng.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                    <div class="team-card">
                        <div class="team-avatar">PT</div>
                        <h5 class="fw-bold mb-2">Phạm Văn C</h5>
                        <p class="text-muted mb-2">Trưởng phòng kỹ thuật</p>
                        <p class="small text-muted">Kỹ sư phần mềm với chuyên môn về phát triển web và hệ thống thương mại điện tử.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
                    <div class="team-card">
                        <div class="team-avatar">LH</div>
                        <h5 class="fw-bold mb-2">Lê Hoàng D</h5>
                        <p class="text-muted mb-2">Trưởng phòng CSKH</p>
                        <p class="small text-muted">Chuyên gia về chăm sóc khách hàng với phương châm "Khách hàng là thượng đế".</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Team Section End -->

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
    
    <!-- AOS Animation -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <script>
        // Initialize AOS
        AOS.init({
            duration: 1000,
            easing: 'ease-in-out',
            once: true,
            mirror: false
        });
    </script>
</body>

</html> 