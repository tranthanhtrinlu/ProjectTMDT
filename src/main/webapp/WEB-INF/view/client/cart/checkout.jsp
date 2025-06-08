<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Thanh Toán - KeyBoardShop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

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

    <!-- Custom Stylesheet -->
    <link href="/client/css/custom.css" rel="stylesheet">
</head>
<body>
<!-- Spinner Start -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->

<jsp:include page="../layout/header.jsp" />

<!-- Checkout Start -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="row g-4 mb-5">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="/cart">Giỏ Hàng</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Thanh Toán</li>
                    </ol>
                </nav>
            </div>
            <div class="col-lg-8">
                <div class="card shadow-sm rounded p-4">
                    <h3 class="mb-4">Thông Tin Giao Hàng</h3>
                    <form action="/place-order" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Họ và Tên</label>
                            <input type="text" class="form-control" id="fullName" name="receiverName" value="${sessionScope.fullName}" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="receiverEmail" value="${sessionScope.email}" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số Điện Thoại</label>
                            <input type="text" class="form-control" id="phone" name="receiverPhone" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Địa Chỉ Giao Hàng</label>
                            <textarea class="form-control" id="address" name="receiverAddress" rows="3" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="paymentMethod" class="form-label">Phương Thức Thanh Toán</label>
                            <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                                <option value="COD">Thanh toán khi nhận hàng (COD)</option>
                                <option value="BANK">Chuyển khoản ngân hàng</option>
                            </select>
                        </div>
                        <div class="text-end">
                            <button type="submit" class="btn btn-primary px-5">Đặt Hàng</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card shadow-sm rounded p-4">
                    <h3 class="mb-4">Tóm Tắt Đơn Hàng</h3>
                    <div class="mb-3">
                        <c:forEach var="cartDetail" items="${cartDetails}">
                            <div class="d-flex justify-content-between mb-2">
                                <span>${cartDetail.product.name} x ${cartDetail.quantity}</span>
                                <span><fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}" /> đ</span>
                            </div>
                        </c:forEach>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between fw-bold">
                        <span>Tổng Cộng:</span>
                        <span><fmt:formatNumber type="number" value="${totalPrice}" /> đ</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Checkout End -->

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