<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Đặt hàng thành công - Keyboardshop</title>
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
    
    <style>
        .thank-you-container {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 20px;
            padding: 60px 40px;
            text-align: center;
            margin: 50px 0;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }
        
        .success-icon {
            width: 120px;
            height: 120px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            animation: pulse 2s infinite;
        }
        
        .failed-icon {
            width: 120px;
            height: 120px;
            background: rgba(220, 53, 69, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            animation: shake 1s;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        
        @keyframes shake {
            0%, 20%, 40%, 60%, 80%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
        }
        
        .order-summary {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-top: 30px;
            color: #333;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .order-detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .order-detail-row:last-child {
            border-bottom: none;
            font-weight: bold;
            font-size: 1.2em;
            color: #28a745;
        }
        
        .custom-badge {
            background: linear-gradient(135deg, #ffc107 0%, #ff8a00 100%);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: bold;
            display: inline-block;
            margin: 5px;
        }
    </style>
</head>

<body>
    <jsp:include page="../layout/header.jsp" />

    <!-- Thank You Page Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row">
                <div class="col-12">
                    <c:choose>
                        <c:when test="${paymentStatus == 'PAYMENT_SUCCEED'}">
                            <div class="thank-you-container">
                                <div class="success-icon">
                                    <i class="fas fa-check-circle fa-4x text-white"></i>
                                </div>
                                <h1 class="display-4 mb-4">Đặt hàng thành công!</h1>
                                <p class="lead mb-4">${paymentMessage}</p>
                                <p class="mb-0">Cảm ơn bạn đã tin tưởng và sử dụng dịch vụ của chúng tôi!</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="thank-you-container" style="background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);">
                                <div class="failed-icon">
                                    <i class="fas fa-times-circle fa-4x text-white"></i>
                                </div>
                                <h1 class="display-4 mb-4">Đặt hàng thất bại!</h1>
                                <p class="lead mb-4">${paymentMessage}</p>
                                <p class="mb-0">Vui lòng thử lại hoặc liên hệ với chúng tôi để được hỗ trợ.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <c:if test="${customOrder != null}">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <div class="order-summary">
                            <h3 class="text-center mb-4">
                                <i class="fas fa-receipt text-primary"></i> 
                                Chi tiết đơn hàng custom
                            </h3>
                            
                            <div class="order-detail-row">
                                <span><strong>Mã đơn hàng:</strong></span>
                                <span>#CUSTOM${customOrder.id}</span>
                            </div>
                            
                            <div class="order-detail-row">
                                <span><strong>Bàn phím gốc:</strong></span>
                                <span>${customOrder.baseKeyboard.name}</span>
                            </div>
                            
                            <c:if test="${customOrder.selectedKeycap != null}">
                                <div class="order-detail-row">
                                    <span><strong>Keycap:</strong></span>
                                    <span>${customOrder.selectedKeycap.name}</span>
                                </div>
                            </c:if>
                            
                            <c:if test="${not empty customOrder.selectedSwitchType}">
                                <div class="order-detail-row">
                                    <span><strong>Switch:</strong></span>
                                    <span>${customOrder.selectedSwitchType}</span>
                                </div>
                            </c:if>
                            
                            <c:if test="${customOrder.selectedKit != null}">
                                <div class="order-detail-row">
                                    <span><strong>Kit:</strong></span>
                                    <span>${customOrder.selectedKit.name}</span>
                                </div>
                            </c:if>
                            
                            <!-- Custom Services -->
                            <c:set var="hasServices" value="false" />
                            <c:set var="serviceText" value="" />
                            
                            <c:if test="${customOrder.lubingService}">
                                <c:set var="hasServices" value="true" />
                                <c:set var="serviceText" value="${serviceText}Lubing Service, " />
                            </c:if>
                            <c:if test="${customOrder.stabilizerTuning}">
                                <c:set var="hasServices" value="true" />
                                <c:set var="serviceText" value="${serviceText}Stabilizer Tuning, " />
                            </c:if>
                            <c:if test="${customOrder.keycapCustomization}">
                                <c:set var="hasServices" value="true" />
                                <c:set var="serviceText" value="${serviceText}Keycap Custom, " />
                            </c:if>
                            <c:if test="${customOrder.cableCustomization}">
                                <c:set var="hasServices" value="true" />
                                <c:set var="serviceText" value="${serviceText}Cable Custom, " />
                            </c:if>
                            <c:if test="${customOrder.caseModding}">
                                <c:set var="hasServices" value="true" />
                                <c:set var="serviceText" value="${serviceText}Case Modding, " />
                            </c:if>
                            
                            <c:if test="${hasServices}">
                                <div class="order-detail-row">
                                    <span><strong>Dịch vụ:</strong></span>
                                    <span>${serviceText.substring(0, serviceText.length() - 2)}</span>
                                </div>
                            </c:if>
                            
                            <c:if test="${not empty customOrder.customNotes}">
                                <div class="order-detail-row">
                                    <span><strong>Ghi chú:</strong></span>
                                    <span>${customOrder.customNotes}</span>
                                </div>
                            </c:if>
                            
                            <div class="order-detail-row">
                                <span><strong>Trạng thái:</strong></span>
                                <span>
                                    <c:choose>
                                        <c:when test="${customOrder.status == 'PENDING'}">
                                            <span class="custom-badge" style="background: linear-gradient(135deg, #ffc107 0%, #ff8a00 100%);">
                                                ${customOrder.status.displayName}
                                            </span>
                                        </c:when>
                                        <c:when test="${customOrder.status == 'PROCESSING'}">
                                            <span class="custom-badge" style="background: linear-gradient(135deg, #17a2b8 0%, #0056b3 100%);">
                                                ${customOrder.status.displayName}
                                            </span>
                                        </c:when>
                                        <c:when test="${customOrder.status == 'READY'}">
                                            <span class="custom-badge" style="background: linear-gradient(135deg, #28a745 0%, #155724 100%);">
                                                ${customOrder.status.displayName}
                                            </span>
                                        </c:when>
                                        <c:when test="${customOrder.status == 'SHIPPED'}">
                                            <span class="custom-badge" style="background: linear-gradient(135deg, #6f42c1 0%, #493267 100%);">
                                                ${customOrder.status.displayName}
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="custom-badge" style="background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);">
                                                ${customOrder.status.displayName}
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            
                            <div class="order-detail-row">
                                <span><strong>Tổng tiền:</strong></span>
                                <span class="text-success">
                                    <fmt:formatNumber type="number" value="${customOrder.totalPrice}" /> đ
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            
            <!-- Action Buttons -->
            <div class="row mt-5">
                <div class="col-12 text-center">
                    <c:if test="${paymentStatus == 'PAYMENT_SUCCEED'}">
                        <a href="/custom/orders" class="btn btn-primary btn-lg me-3">
                            <i class="fas fa-list"></i> Xem đơn hàng của tôi
                        </a>
                        <a href="/products" class="btn btn-outline-primary btn-lg">
                            <i class="fas fa-shopping-cart"></i> Tiếp tục mua sắm
                        </a>
                    </c:if>
                    <c:if test="${paymentStatus == 'PAYMENT_FAILED'}">
                        <a href="/cart" class="btn btn-primary btn-lg me-3">
                            <i class="fas fa-redo"></i> Thử lại
                        </a>
                        <a href="/contact" class="btn btn-outline-primary btn-lg">
                            <i class="fas fa-phone"></i> Liên hệ hỗ trợ
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- Thank You Page End -->

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