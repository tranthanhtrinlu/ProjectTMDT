<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Giỏ Hàng - KeyBoardShop</title>
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

<!-- Cart Start -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="row g-4 mb-5">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Trang Chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Giỏ Hàng</li>
                    </ol>
                </nav>
            </div>
            <div class="col-12">
                <h3 class="mb-4">Giỏ Hàng Của Bạn</h3>
                <c:if test="${empty cartDetails}">
                    <p class="text-center">Giỏ hàng của bạn đang trống!</p>
                </c:if>
                <c:if test="${not empty cartDetails}">
                    <div class="table-responsive">
                        <table class="table table-bordered align-middle">
                            <thead>
                            <tr>
                                <th scope="col">Sản Phẩm</th>
                                <th scope="col">Tên Sản Phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Số Lượng</th>
                                <th scope="col">Tổng</th>
                                <th scope="col">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cartDetail" items="${cartDetails}">
                                <tr>
                                    <td>
                                        <img src="/images/product/${cartDetail.product.image}" alt="${cartDetail.product.name}" style="width: 80px; height: 80px; object-fit: cover;">
                                    </td>
                                    <td>${cartDetail.product.name}</td>
                                    <td><fmt:formatNumber type="number" value="${cartDetail.price}" /> đ</td>
                                    <td>
                                        <div class="input-group quantity mx-auto" style="width: 120px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-minus rounded-circle bg-light border" onclick="updateQuantity(${cartDetail.id}, ${cartDetail.quantity - 1})">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm text-center border-0" value="${cartDetail.quantity}" readonly>
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-plus rounded-circle bg-light border" onclick="updateQuantity(${cartDetail.id}, ${cartDetail.quantity + 1})">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td><fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}" /> đ</td>
                                    <td>
                                        <form action="/cart/remove/${cartDetail.id}" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button type="submit" class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash-alt"></i> Xóa
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="4" class="text-end fw-bold">Tổng Cộng:</td>
                                <td colspan="2" class="fw-bold"><fmt:formatNumber type="number" value="${totalPrice}" /> đ</td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="text-end">
                        <a href="/checkout" class="btn btn-primary px-5">Tiến Hành Thanh Toán</a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!-- Cart End -->

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
<script>
    function updateQuantity(cartDetailId, newQuantity) {
        if (newQuantity < 1) return;
        $.ajax({
            url: '/cart/update/' + cartDetailId,
            type: 'POST',
            data: { quantity: newQuantity, _csrf: '${_csrf.token}' },
            success: function(response) {
                location.reload();
            },
            error: function() {
                alert('Cập nhật số lượng thất bại!');
            }
        });
    }
</script>
</body>
</html>