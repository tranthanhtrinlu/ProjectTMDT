<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ - KeyboardShop | Bàn phím cơ chất lượng cao</title>

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

        .contact-section {
            padding: 100px 0;
            background: #f8f9fa;
        }

        .contact-card {
            background: white;
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            border: none;
        }

        .contact-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .contact-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
        }

        .contact-icon i {
            color: white;
            font-size: 2rem;
        }

        .form-section {
            padding: 100px 0;
            background: white;
        }

        .contact-form {
            background: #f8f9fa;
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 15px 20px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }

        .btn-contact {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 15px 30px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }

        .btn-contact:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }

        .map-section {
            padding: 100px 0;
            background: #f8f9fa;
        }

        .map-container {
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .faq-section {
            padding: 100px 0;
            background: white;
        }

        .faq-item {
            background: #f8f9fa;
            border-radius: 15px;
            margin-bottom: 1rem;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .faq-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .faq-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .faq-header:hover {
            background: linear-gradient(135deg, #5a6fd8 0%, #6a4190 100%);
        }

        .faq-body {
            padding: 1.5rem;
            display: none;
        }

        .faq-body.show {
            display: block;
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

    <!-- Hero Section Start -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6" data-aos="fade-right">
                    <h1 class="hero-title">Liên hệ với chúng tôi</h1>
                    <p class="hero-subtitle">
                        Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn. Hãy liên hệ với chúng tôi để được tư vấn 
                        và giải đáp mọi thắc mắc về sản phẩm bàn phím cơ.
                    </p>
                </div>
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="text-center">
                        <i class="fas fa-headset" style="font-size: 8rem; opacity: 0.3;"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Contact Info Section Start -->
    <section class="contact-section">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-lg-8 text-center">
                    <h2 class="section-title" data-aos="fade-up">Thông tin liên hệ</h2>
                    <p class="section-subtitle" data-aos="fade-up" data-aos-delay="100">
                        Chúng tôi có nhiều kênh liên lạc để phục vụ bạn tốt nhất
                    </p>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                    <div class="contact-card text-center">
                        <div class="contact-icon mx-auto">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Địa chỉ</h5>
                        <p class="text-muted mb-0">
                            123 Đường ABC, Quận 1<br>
                            TP. Hồ Chí Minh, Việt Nam
                        </p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                    <div class="contact-card text-center">
                        <div class="contact-icon mx-auto">
                            <i class="fas fa-phone"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Điện thoại</h5>
                        <p class="text-muted mb-0">
                            <a href="tel:19001234" class="text-decoration-none">1900 1234</a><br>
                            <a href="tel:0901234567" class="text-decoration-none">090 123 4567</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                    <div class="contact-card text-center">
                        <div class="contact-icon mx-auto">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Email</h5>
                        <p class="text-muted mb-0">
                            <a href="mailto:info@keyboardshop.vn" class="text-decoration-none">info@keyboardshop.vn</a><br>
                            <a href="mailto:support@keyboardshop.vn" class="text-decoration-none">support@keyboardshop.vn</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
                    <div class="contact-card text-center">
                        <div class="contact-icon mx-auto">
                            <i class="fas fa-clock"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Giờ làm việc</h5>
                        <p class="text-muted mb-0">
                            Thứ 2 - Thứ 6: 8:00 - 18:00<br>
                            Thứ 7: 8:00 - 12:00<br>
                            Chủ nhật: Nghỉ
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Info Section End -->

    <!-- Contact Form Section Start -->
    <section class="form-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-form" data-aos="fade-up">
                        <div class="text-center mb-5">
                            <h2 class="section-title">Gửi tin nhắn cho chúng tôi</h2>
                            <p class="section-subtitle">
                                Hãy để lại thông tin và tin nhắn của bạn, chúng tôi sẽ phản hồi trong thời gian sớm nhất
                            </p>
                        </div>
                        <form id="contactForm" action="/contact" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="name" class="form-label">Họ và tên *</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Email *</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="tel" class="form-control" id="phone" name="phone">
                                </div>
                                <div class="col-md-6">
                                    <label for="subject" class="form-label">Chủ đề *</label>
                                    <select class="form-control" id="subject" name="subject" required>
                                        <option value="">Chọn chủ đề</option>
                                        <option value="tư-vấn-sản-phẩm">Tư vấn sản phẩm</option>
                                        <option value="hỗ-trợ-kỹ-thuật">Hỗ trợ kỹ thuật</option>
                                        <option value="khiếu-nại">Khiếu nại</option>
                                        <option value="hợp-tác">Hợp tác</option>
                                        <option value="khác">Khác</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <label for="message" class="form-label">Nội dung tin nhắn *</label>
                                    <textarea class="form-control" id="message" name="message" rows="5" required placeholder="Hãy mô tả chi tiết vấn đề của bạn..."></textarea>
                                </div>
                                <div class="col-12 text-center">
                                    <button type="submit" class="btn btn-contact text-white">
                                        <i class="fas fa-paper-plane me-2"></i>
                                        Gửi tin nhắn
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Form Section End -->

    <!-- Map Section Start -->
    <section class="map-section">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-lg-8 text-center">
                    <h2 class="section-title" data-aos="fade-up">Vị trí của chúng tôi</h2>
                    <p class="section-subtitle" data-aos="fade-up" data-aos-delay="100">
                        Ghé thăm showroom của chúng tôi để trải nghiệm trực tiếp các sản phẩm bàn phím cơ
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="map-container" data-aos="fade-up">
                        <iframe 
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.424098981303!2d106.6983153!3d10.7769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDQ2JzM2LjgiTiAxMDbCsDQxJzU3LjQiRQ!5e0!3m2!1svi!2s!4v1234567890"
                            width="100%" 
                            height="450" 
                            style="border:0;" 
                            allowfullscreen="" 
                            loading="lazy" 
                            referrerpolicy="no-referrer-when-downgrade">
                        </iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Map Section End -->

    <!-- FAQ Section Start -->
    <section class="faq-section">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-lg-8 text-center">
                    <h2 class="section-title" data-aos="fade-up">Câu hỏi thường gặp</h2>
                    <p class="section-subtitle" data-aos="fade-up" data-aos-delay="100">
                        Những câu hỏi phổ biến mà khách hàng thường hỏi chúng tôi
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="faq-item" data-aos="fade-up">
                        <div class="faq-header" onclick="toggleFAQ(this)">
                            <h5 class="mb-0 d-flex justify-content-between align-items-center">
                                Làm thế nào để chọn bàn phím cơ phù hợp?
                                <i class="fas fa-chevron-down"></i>
                            </h5>
                        </div>
                        <div class="faq-body">
                            <p class="mb-0">
                                Việc chọn bàn phím cơ phù hợp phụ thuộc vào nhiều yếu tố như loại switch, kích thước, 
                                mục đích sử dụng (gaming, văn phòng, lập trình). Chúng tôi có đội ngũ tư vấn chuyên nghiệp 
                                sẽ giúp bạn chọn sản phẩm phù hợp nhất.
                            </p>
                        </div>
                    </div>
                    
                    <div class="faq-item" data-aos="fade-up" data-aos-delay="100">
                        <div class="faq-header" onclick="toggleFAQ(this)">
                            <h5 class="mb-0 d-flex justify-content-between align-items-center">
                                Chính sách bảo hành như thế nào?
                                <i class="fas fa-chevron-down"></i>
                            </h5>
                        </div>
                        <div class="faq-body">
                            <p class="mb-0">
                                Chúng tôi cung cấp chính sách bảo hành chính hãng từ 12-24 tháng tùy theo sản phẩm. 
                                Trong thời gian bảo hành, chúng tôi sẽ sửa chữa hoặc thay thế miễn phí nếu có lỗi từ nhà sản xuất.
                            </p>
                        </div>
                    </div>
                    
                    <div class="faq-item" data-aos="fade-up" data-aos-delay="200">
                        <div class="faq-header" onclick="toggleFAQ(this)">
                            <h5 class="mb-0 d-flex justify-content-between align-items-center">
                                Thời gian giao hàng là bao lâu?
                                <i class="fas fa-chevron-down"></i>
                            </h5>
                        </div>
                        <div class="faq-body">
                            <p class="mb-0">
                                Tại TP.HCM: Giao hàng trong 2-4 giờ làm việc. Các tỉnh thành khác: 1-3 ngày làm việc. 
                                Chúng tôi cũng cung cấp dịch vụ giao hàng nhanh cho khách hàng có nhu cầu.
                            </p>
                        </div>
                    </div>
                    
                    <div class="faq-item" data-aos="fade-up" data-aos-delay="300">
                        <div class="faq-header" onclick="toggleFAQ(this)">
                            <h5 class="mb-0 d-flex justify-content-between align-items-center">
                                Có thể đổi trả sản phẩm không?
                                <i class="fas fa-chevron-down"></i>
                            </h5>
                        </div>
                        <div class="faq-body">
                            <p class="mb-0">
                                Có, chúng tôi chấp nhận đổi trả trong vòng 30 ngày kể từ ngày mua hàng nếu sản phẩm 
                                còn nguyên vẹn và đầy đủ phụ kiện. Khách hàng chỉ cần liên hệ với chúng tôi để được hỗ trợ.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- FAQ Section End -->

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

        // FAQ Toggle Function
        function toggleFAQ(element) {
            const faqBody = element.nextElementSibling;
            const icon = element.querySelector('i');
            
            if (faqBody.classList.contains('show')) {
                faqBody.classList.remove('show');
                icon.classList.remove('fa-chevron-up');
                icon.classList.add('fa-chevron-down');
            } else {
                faqBody.classList.add('show');
                icon.classList.remove('fa-chevron-down');
                icon.classList.add('fa-chevron-up');
            }
        }

        // Contact Form Submission
        document.getElementById('contactForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(this);
            const data = Object.fromEntries(formData);
            
            // Show success message (in real application, you would send this to server)
            alert('Cảm ơn bạn đã liên hệ với chúng tôi! Chúng tôi sẽ phản hồi trong thời gian sớm nhất.');
            
            // Reset form
            this.reset();
        });
    </script>
</body>

</html> 