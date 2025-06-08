<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cảm Ơn - KeyBoardShop</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
    <!-- Icon Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <!-- Bootstrap -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/client/css/thank-you.css" rel="stylesheet">
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
        <div class="row g-4">
            <div class="col-md-8 mx-auto text-center">
                <div class="card shadow-sm p-4 thank-you-card">
                    <h2 class="mb-4"><i class="fas fa-check-circle text-success"></i> Cảm Ơn Bạn!</h2>
                    <p class="lead">Cảm ơn bạn đã gửi yêu cầu hỗ trợ đến KeyBoardShop. Chúng tôi đã nhận được thông tin của bạn và sẽ phản hồi trong thời gian sớm nhất.</p>
                    <p>Nếu bạn có thắc mắc thêm, vui lòng liên hệ qua <a href="/support">Hỗ Trợ</a> hoặc quay lại <a href="/">Trang Chủ</a>.</p>
                    <a href="/" class="btn btn-primary mt-4">Quay Về Trang Chủ</a>
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