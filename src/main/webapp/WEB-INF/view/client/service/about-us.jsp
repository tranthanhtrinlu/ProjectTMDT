<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới Thiệu - KeyBoardShop</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
    <!-- Icon Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <!-- Bootstrap -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/client/css/about-us.css" rel="stylesheet">
    <!-- Template CSS -->
    <link href="/client/css/style.css" rel="stylesheet">
</head>
<body>
<!-- Spinner -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>

<!-- Header -->
<jsp:include page="../layout/header.jsp" />

<!-- Main Content -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Giới Thiệu</li>
            </ol>
        </nav>

        <div class="row g-4">
            <div class="col-md-10 mx-auto">
                <div class="card shadow-sm p-4 about-card">
                    <h2 class="text-center mb-4"><i class="fas fa-info-circle"></i> Về Chúng Tôi</h2>
                    <p class="lead">KeyBoardShop là nơi mang đến trải nghiệm cá nhân hóa bàn phím đỉnh cao cho mọi game thủ và người yêu công nghệ. Với sứ mệnh tạo ra những sản phẩm độc đáo, chúng tôi cung cấp dịch vụ tùy chỉnh bàn phím theo yêu cầu, từ layout, switch đến keycap và màu sắc.</p>
                    <p>Thành lập từ [năm thành lập], KeyBoardShop đã không ngừng đổi mới, kết hợp giữa chất lượng và phong cách để đáp ứng nhu cầu đa dạng của khách hàng. Chúng tôi tự hào là thương hiệu được tin cậy với đội ngũ chuyên nghiệp và cam kết mang lại sự hài lòng tối đa.</p>
                    <div class="text-center mt-4">
                        <a href="/contact" class="btn btn-outline-primary">Liên Hệ Ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="../layout/footer.jsp" />

<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
</body>
</html>