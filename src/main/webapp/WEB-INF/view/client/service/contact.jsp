<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ - KeyBoardShop</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
    <!-- Icon Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <!-- Bootstrap -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/client/css/contact.css" rel="stylesheet">
    <!-- Template CSS -->
    <link href="/client/css/style.css" rel="stylesheet">
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
</head>
<body>
<!-- Spinner -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<style>
    .contact-card {
        border: none;
        border-radius: 10px;
    }

    .contact-card .form-label {
        font-weight: 600;
    }

    .contact-card .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .contact-card .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
</style>

<!-- Header -->
<jsp:include page="../layout/header.jsp" />

<!-- Main Content -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Liên Hệ</li>
            </ol>
        </nav>

        <div class="row g-4">
            <div class="col-md-8 mx-auto">
                <div class="card shadow-sm p-4 contact-card">
                    <h2 class="text-center mb-4"><i class="fas fa-envelope"></i> Liên Hệ Với Chúng Tôi</h2>
                    <p class="lead">Vui lòng điền thông tin dưới đây để gửi yêu cầu hỗ trợ hoặc phản hồi.</p>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success" role="alert">${success}</div>
                    </c:if>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">${error}</div>
                    </c:if>
                    <form action="/contact/submit" method="post" enctype="application/x-www-form-urlencoded">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="mb-3">
                            <label for="name" class="form-label">Họ và Tên <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="subject" class="form-label">Chủ Đề <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="subject" name="subject" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Nội Dung <span class="text-danger">*</span></label>
                            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Gửi Liên Hệ</button>
                    </form>
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