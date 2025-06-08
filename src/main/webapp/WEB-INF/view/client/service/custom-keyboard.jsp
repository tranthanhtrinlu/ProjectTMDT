<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tùy Chỉnh Bàn Phím - KeyBoardShop</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
    <!-- Icon Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <!-- Bootstrap -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/client/css/custom-keyboard.css" rel="stylesheet">
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

<!-- Header -->
<jsp:include page="../layout/header.jsp" />

<!-- Main Content -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Tùy Chỉnh Bàn Phím</li>
            </ol>
        </nav>

        <div class="row g-4">
            <div class="col-md-8 mx-auto">
                <div class="card shadow-sm p-4 custom-card">
                    <h3 class="mb-4"><i class="fas fa-keyboard"></i> Tùy Chỉnh Bàn Phím Theo Yêu Cầu</h3>
                    <form action="/custom/submit" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="mb-3">
                            <label for="layout" class="form-label">Bố cục bàn phím</label>
                            <select class="form-select" id="layout" name="layout" required>
                                <option value="60%">60%</option>
                                <option value="65%">65%</option>
                                <option value="75%">75%</option>
                                <option value="TKL">TKL</option>
                                <option value="Full">Full</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="switchType" class="form-label">Loại switch</label>
                            <select class="form-select" id="switchType" name="switchType" required>
                                <option value="Red">Red (Lineal)</option>
                                <option value="Blue">Blue (Clicky)</option>
                                <option value="Brown">Brown (Tactile)</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="keycapMaterial" class="form-label">Chất liệu keycap</label>
                            <select class="form-select" id="keycapMaterial" name="keycapMaterial" required>
                                <option value="ABS">ABS</option>
                                <option value="PBT">PBT</option>
                                <option value="PSA">PSA</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="color" class="form-label">Màu sắc</label>
                            <input type="color" class="form-control form-control-color" id="color" name="color" value="#000000" title="Chọn màu">
                        </div>
                        <div class="mb-3">
                            <label for="image" class="form-label">Tải lên thiết kế (tùy chọn)</label>
                            <input type="file" class="form-control" id="image" name="image" accept="image/*">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Gửi Yêu Cầu</button>
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