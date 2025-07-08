<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Thanh toán đơn custom - Keyboardshop</title>
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
    
    <!-- Meta CSRF -->
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
</head>

<body>
    <jsp:include page="../layout/header.jsp" />

    <!-- Checkout Page Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="mb-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/cart">Giỏ hàng</a></li>
                        <li class="breadcrumb-item"><a href="/custom/preview/${customOrder.id}">Xem trước</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
                    </ol>
                </nav>
            </div>

            <h1 class="mb-4">Thanh toán đơn hàng custom</h1>

            <div class="row g-5">
                <div class="col-md-12 col-lg-6 col-xl-7">
                    <form action="/custom/place-order" method="post" modelAttribute="user">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" name="customOrderId" value="${customOrder.id}" />
                        
                        <div class="row">
                            <div class="col-md-12 col-lg-6">
                                <div class="form-item w-100">
                                    <label class="form-label my-3">Họ và tên<sup>*</sup></label>
                                    <input type="text" class="form-control" name="receiverName" 
                                           value="${user.fullName}" required>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-6">
                                <div class="form-item w-100">
                                    <label class="form-label my-3">Địa chỉ<sup>*</sup></label>
                                    <input type="text" class="form-control" name="receiverAddress" 
                                           value="${user.address}" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-item">
                            <label class="form-label my-3">Số điện thoại<sup>*</sup></label>
                            <input type="tel" class="form-control" name="receiverPhone" 
                                   value="${user.phone}" required>
                        </div>
                        
                        <div class="form-item">
                            <label class="form-label my-3">Email</label>
                            <input type="email" class="form-control" name="receiverEmail" 
                                   value="${user.email}" readonly>
                        </div>
                        
                        <div class="form-item">
                            <label class="form-label my-3">Ghi chú đơn hàng (tùy chọn)</label>
                            <textarea name="orderNotes" class="form-control" spellcheck="false" cols="30" rows="11" 
                                      placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa điểm giao hàng chi tiết hơn."></textarea>
                        </div>

                        <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                            <div class="col-12">
                                <div class="form-check text-start my-3">
                                    <input type="radio" class="form-check-input bg-primary border-0" 
                                           id="cod" name="paymentMethod" value="COD" checked>
                                    <label class="form-check-label" for="cod">Thanh toán khi nhận hàng (COD)</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                            <div class="col-12">
                                <div class="form-check text-start my-3">
                                    <input type="radio" class="form-check-input bg-primary border-0" 
                                           id="vnpay" name="paymentMethod" value="VNPAY">
                                    <label class="form-check-label" for="vnpay">Thanh toán trực tuyến VNPay</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                            <button type="submit" 
                                    class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">
                                Đặt hàng
                            </button>
                        </div>
                    </form>
                </div>
                
                <div class="col-md-12 col-lg-6 col-xl-5">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Sản phẩm</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Base Keyboard -->
                                <tr>
                                    <th scope="row">
                                        <div class="d-flex align-items-center mt-2">
                                            <img src="/images/product/${customOrder.baseKeyboard.image}" 
                                                 class="img-fluid rounded-circle" 
                                                 style="width: 90px; height: 90px;" 
                                                 alt="${customOrder.baseKeyboard.name}">
                                        </div>
                                    </th>
                                    <td class="py-5">
                                        <strong>${customOrder.baseKeyboard.name}</strong>
                                        <p class="text-muted mb-0">(Bàn phím gốc)</p>
                                    </td>
                                    <td class="py-5">
                                        <fmt:formatNumber type="number" value="${customOrder.baseKeyboard.price}" /> đ
                                    </td>
                                </tr>
                                
                                <!-- Selected Keycap -->
                                <c:if test="${customOrder.selectedKeycap != null}">
                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center mt-2">
                                                <img src="/images/product/${customOrder.selectedKeycap.image}" 
                                                     class="img-fluid rounded-circle" 
                                                     style="width: 90px; height: 90px;" 
                                                     alt="${customOrder.selectedKeycap.name}">
                                            </div>
                                        </th>
                                        <td class="py-5">
                                            <strong>${customOrder.selectedKeycap.name}</strong>
                                            <p class="text-muted mb-0">(Keycap tùy chỉnh)</p>
                                        </td>
                                        <td class="py-5">
                                            <fmt:formatNumber type="number" value="${customOrder.selectedKeycap.price}" /> đ
                                        </td>
                                    </tr>
                                </c:if>
                                
                                <!-- Selected Kit -->
                                <c:if test="${customOrder.selectedKit != null}">
                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center mt-2">
                                                <img src="/images/product/${customOrder.selectedKit.image}" 
                                                     class="img-fluid rounded-circle" 
                                                     style="width: 90px; height: 90px;" 
                                                     alt="${customOrder.selectedKit.name}">
                                            </div>
                                        </th>
                                        <td class="py-5">
                                            <strong>${customOrder.selectedKit.name}</strong>
                                            <p class="text-muted mb-0">(Kit bổ sung)</p>
                                        </td>
                                        <td class="py-5">
                                            <fmt:formatNumber type="number" value="${customOrder.selectedKit.price}" /> đ
                                        </td>
                                    </tr>
                                </c:if>
                                
                                <!-- Switch Info -->
                                <c:if test="${not empty customOrder.selectedSwitchType}">
                                    <tr>
                                        <td colspan="2" class="py-3">
                                            <strong>Switch: ${customOrder.selectedSwitchType}</strong>
                                        </td>
                                        <td class="py-3">Miễn phí</td>
                                    </tr>
                                </c:if>
                                
                                <!-- Services -->
                                <c:if test="${customOrder.lubingService}">
                                    <tr>
                                        <td colspan="2" class="py-3">Lubing Switch Service</td>
                                        <td class="py-3">75,000 đ</td>
                                    </tr>
                                </c:if>
                                <c:if test="${customOrder.stabilizerTuning}">
                                    <tr>
                                        <td colspan="2" class="py-3">Stabilizer Tuning</td>
                                        <td class="py-3">40,000 đ</td>
                                    </tr>
                                </c:if>
                                <c:if test="${customOrder.keycapCustomization}">
                                    <tr>
                                        <td colspan="2" class="py-3">Keycap Customization</td>
                                        <td class="py-3">150,000 đ</td>
                                    </tr>
                                </c:if>
                                <c:if test="${customOrder.cableCustomization}">
                                    <tr>
                                        <td colspan="2" class="py-3">Cable Customization</td>
                                        <td class="py-3">225,000 đ</td>
                                    </tr>
                                </c:if>
                                <c:if test="${customOrder.caseModding}">
                                    <tr>
                                        <td colspan="2" class="py-3">Case Modding</td>
                                        <td class="py-3">350,000 đ</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                        <div class="col-12">
                            <div class="d-flex justify-content-between">
                                <h5 class="mb-0 me-4">Tạm tính</h5>
                                <div class="">
                                    <p class="mb-0">
                                        <fmt:formatNumber type="number" value="${customOrder.totalPrice}" /> đ
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                        <div class="col-12">
                            <div class="d-flex justify-content-between">
                                <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                <div class="">
                                    <p class="mb-0">Miễn phí</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row g-4 text-center align-items-center justify-content-center py-3">
                        <div class="col-12">
                            <div class="d-flex justify-content-between">
                                <h5 class="mb-0 me-4">Tổng cộng</h5>
                                <div class="">
                                    <h5 class="mb-0">
                                        <fmt:formatNumber type="number" value="${customOrder.totalPrice}" /> đ
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <c:if test="${not empty customOrder.customNotes}">
                        <div class="mt-4 p-3 bg-light rounded">
                            <h6>Ghi chú tùy chỉnh:</h6>
                            <p class="mb-0">"${customOrder.customNotes}"</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout Page End -->

    <jsp:include page="../layout/footer.jsp" />

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