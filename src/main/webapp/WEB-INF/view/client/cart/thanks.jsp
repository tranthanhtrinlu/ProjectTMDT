<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Đơn hàng - KeyBoardShop</title>

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">

                <style>
                    .payment-success {
                        background: linear-gradient(135deg, #52c41a 0%, #73d13d 100%);
                        color: white;
                        border: none;
                    }
                    .payment-failed {
                        background: linear-gradient(135deg, #ff4d4f 0%, #ff7875 100%);
                        color: white;
                        border: none;
                    }
                    .payment-info-card {
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                        border-radius: 12px;
                        overflow: hidden;
                    }
                    .payment-icon {
                        font-size: 3rem;
                        margin-bottom: 1rem;
                    }
                    .transaction-ref {
                        font-family: 'Courier New', monospace;
                        background: #f6f6f6;
                        padding: 8px 12px;
                        border-radius: 6px;
                        font-weight: bold;
                    }
                </style>

            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />

                <div class="container" style="margin-top: 100px; margin-bottom: 50px;">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-10">
                            
                            <!-- Payment Success -->
                            <c:if test="${paymentStatus == 'PAYMENT_SUCCEED'}">
                                <div class="card payment-info-card payment-success">
                                    <div class="card-body text-center py-5">
                                        <div class="payment-icon">
                                            <i class="fas fa-check-circle"></i>
                                        </div>
                                        <h2 class="card-title mb-3">Thanh toán thành công!</h2>
                                        <p class="card-text mb-4">${paymentMessage}</p>
                                        <c:if test="${not empty transactionRef}">
                                            <div class="mb-3">
                                                <small>Mã giao dịch:</small><br>
                                                <span class="transaction-ref">${transactionRef}</span>
                                            </div>
                                        </c:if>
                                        <p class="mb-0">Cảm ơn bạn đã đặt hàng tại Keyboardshop!</p>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Payment Failed -->
                            <c:if test="${paymentStatus == 'PAYMENT_FAILED'}">
                                <div class="card payment-info-card payment-failed">
                                    <div class="card-body text-center py-5">
                                        <div class="payment-icon">
                                            <i class="fas fa-times-circle"></i>
                                        </div>
                                        <h2 class="card-title mb-3">Thanh toán thất bại</h2>
                                        <p class="card-text mb-4">
                                            <c:choose>
                                                <c:when test="${not empty paymentMessage}">${paymentMessage}</c:when>
                                                <c:when test="${not empty paymentError}">${paymentError}</c:when>
                                                <c:otherwise>Giao dịch không thành công. Vui lòng thử lại.</c:otherwise>
                                            </c:choose>
                                        </p>
                                        <c:if test="${not empty transactionRef}">
                                            <div class="mb-3">
                                                <small>Mã giao dịch:</small><br>
                                                <span class="transaction-ref">${transactionRef}</span>
                                            </div>
                                        </c:if>
                                        <div class="mt-4">
                                            <a href="/checkout" class="btn btn-light btn-lg me-3">
                                                <i class="fas fa-redo"></i> Thử lại
                                            </a>
                                            <a href="/contact" class="btn btn-outline-light btn-lg">
                                                <i class="fas fa-phone"></i> Liên hệ hỗ trợ
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Default success (COD or no payment info) -->
                            <c:if test="${empty paymentStatus}">
                                <div class="card payment-info-card">
                                    <div class="card-body text-center py-5">
                                        <div class="payment-icon text-success">
                                            <i class="fas fa-check-circle"></i>
                                        </div>
                                        <h2 class="card-title mb-3">Đặt hàng thành công!</h2>
                                        <p class="card-text mb-4">
                                            Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đã được tiếp nhận và sẽ được xử lý trong thời gian sớm nhất.
                                        </p>
                                        <div class="alert alert-info">
                                            <i class="fas fa-info-circle"></i>
                                            Chúng tôi sẽ liên hệ với bạn để xác nhận đơn hàng và thông báo thời gian giao hàng.
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Actions -->
                            <div class="text-center mt-4">
                                <a href="/" class="btn btn-primary btn-lg me-3">
                                    <i class="fas fa-home"></i> Về trang chủ
                                </a>
                                <a href="/products" class="btn btn-outline-primary btn-lg">
                                    <i class="fas fa-shopping-bag"></i> Tiếp tục mua sắm
                                </a>
                            </div>

                            <!-- Order tracking info -->
                            <div class="card mt-4">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <i class="fas fa-truck"></i> Theo dõi đơn hàng
                                    </h5>
                                    <p class="card-text">
                                        Bạn có thể theo dõi tình trạng đơn hàng thông qua:
                                    </p>
                                    <ul class="list-unstyled">
                                        <li><i class="fas fa-envelope text-primary"></i> Email xác nhận đã gửi đến hộp thư của bạn</li>
                                        <li><i class="fas fa-phone text-primary"></i> Hotline: 1900-xxxx (8:00 - 22:00)</li>
                                        <li><i class="fas fa-comments text-primary"></i> Live chat trên website</li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/feature.jsp" />

                <jsp:include page="../layout/footer.jsp" />

                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>

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
                    // Auto hide spinner after page load
                    $(document).ready(function() {
                        setTimeout(function() {
                            $('#spinner').removeClass('show');
                        }, 500);
                    });
                </script>
            </body>

            </html>