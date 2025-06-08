<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hỗ Trợ Khách Hàng - KeyBoardShop</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
    <!-- Icon Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <!-- Bootstrap -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/client/css/support.css" rel="stylesheet">
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
                <li class="breadcrumb-item active">Hỗ Trợ</li>
            </ol>
        </nav>

        <div class="row g-4">
            <div class="col-md-10 mx-auto">
                <div class="card shadow-sm p-4 support-card">
                    <h2 class="text-center mb-4"><i class="fas fa-headset"></i> Hỗ Trợ Khách Hàng</h2>
                    <p class="lead">Chúng tôi luôn sẵn sàng hỗ trợ bạn 24/7. Dưới đây là các cách liên hệ và thông tin hữu ích:</p>
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <h4>Liên Hệ</h4>
                            <ul class="list-unstyled">
                                <li><i class="fas fa-phone"></i> Hotline: 0909 123 456</li>
                                <li><i class="fas fa-envelope"></i> Email: support@keyboardshop.com</li>
                                <li><i class="fas fa-map-marker-alt"></i> Địa chỉ: 123 Đường ABC, TP.HCM</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h4>Thời Gian Hỗ Trợ</h4>
                            <p>Thứ 2 - Thứ 6: 8:00 - 20:00</p>
                            <p>Thứ 7 - Chủ Nhật: 9:00 - 17:00</p>
                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <a href="/contact" class="btn btn-primary">Gửi Yêu Cầu Hỗ Trợ</a>
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