<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Xem trước đơn custom - Keyboardshop</title>
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
    
    <style>
        .preview-section {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .component-item {
            background: white;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            border-left: 4px solid #28a745;
        }
        .service-item {
            background: white;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 10px;
            border-left: 4px solid #007bff;
        }
        .total-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 30px;
            margin-top: 30px;
        }
    </style>
</head>

<body>
    <jsp:include page="../layout/header.jsp" />

    <!-- Preview Page Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="mb-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/cart">Giỏ hàng</a></li>
                        <li class="breadcrumb-item"><a href="/custom/keyboard/${customOrder.baseKeyboard.id}">Tùy chỉnh</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Xem trước</li>
                    </ol>
                </nav>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <h2 class="mb-4">
                        <i class="fas fa-eye text-primary"></i> 
                        Xem trước đơn hàng custom
                    </h2>
                    
                    <!-- Base Keyboard -->
                    <div class="preview-section">
                        <h4 class="mb-3">
                            <i class="fas fa-keyboard text-warning"></i> 
                            Bàn phím gốc
                        </h4>
                        <div class="component-item">
                            <div class="row align-items-center">
                                <div class="col-md-3">
                                    <img src="/images/product/${customOrder.baseKeyboard.image}" 
                                         class="img-fluid rounded" alt="${customOrder.baseKeyboard.name}">
                                </div>
                                <div class="col-md-6">
                                    <h5 class="mb-1">${customOrder.baseKeyboard.name}</h5>
                                    <p class="text-muted mb-0">${customOrder.baseKeyboard.shortDesc}</p>
                                </div>
                                <div class="col-md-3 text-end">
                                    <h5 class="text-success mb-0">
                                        <fmt:formatNumber type="number" value="${customOrder.baseKeyboard.price}" /> đ
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Components -->
                    <div class="preview-section">
                        <h4 class="mb-3">
                            <i class="fas fa-puzzle-piece text-info"></i> 
                            Linh kiện đã chọn
                        </h4>
                        
                        <!-- Keycap -->
                        <c:choose>
                            <c:when test="${customOrder.selectedKeycap != null}">
                                <div class="component-item">
                                    <div class="row align-items-center">
                                        <div class="col-md-3">
                                            <img src="/images/product/${customOrder.selectedKeycap.image}" 
                                                 class="img-fluid rounded" alt="${customOrder.selectedKeycap.name}">
                                        </div>
                                        <div class="col-md-6">
                                            <h6 class="mb-1">
                                                <i class="fas fa-th text-secondary"></i> 
                                                Keycap: ${customOrder.selectedKeycap.name}
                                            </h6>
                                            <p class="text-muted mb-0">${customOrder.selectedKeycap.shortDesc}</p>
                                        </div>
                                        <div class="col-md-3 text-end">
                                            <h6 class="text-success mb-0">
                                                + <fmt:formatNumber type="number" value="${customOrder.selectedKeycap.price}" /> đ
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="component-item">
                                    <h6 class="mb-1">
                                        <i class="fas fa-th text-secondary"></i> 
                                        Keycap: Giữ nguyên keycap gốc
                                    </h6>
                                    <p class="text-muted mb-0">Sử dụng keycap có sẵn của bàn phím</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- Switch -->
                        <div class="component-item">
                            <h6 class="mb-1">
                                <i class="fas fa-toggle-on text-secondary"></i> 
                                Switch: 
                                <c:choose>
                                    <c:when test="${not empty customOrder.selectedSwitchType}">
                                        ${customOrder.selectedSwitchType}
                                    </c:when>
                                    <c:otherwise>
                                        Giữ nguyên switch gốc
                                    </c:otherwise>
                                </c:choose>
                            </h6>
                            <c:choose>
                                <c:when test="${not empty customOrder.selectedSwitchType}">
                                    <p class="text-muted mb-0">Switch được thay đổi theo yêu cầu</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="text-muted mb-0">Sử dụng switch có sẵn của bàn phím</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        
                        <!-- Kit -->
                        <c:choose>
                            <c:when test="${customOrder.selectedKit != null}">
                                <div class="component-item">
                                    <div class="row align-items-center">
                                        <div class="col-md-3">
                                            <img src="/images/product/${customOrder.selectedKit.image}" 
                                                 class="img-fluid rounded" alt="${customOrder.selectedKit.name}">
                                        </div>
                                        <div class="col-md-6">
                                            <h6 class="mb-1">
                                                <i class="fas fa-toolbox text-secondary"></i> 
                                                Kit: ${customOrder.selectedKit.name}
                                            </h6>
                                            <p class="text-muted mb-0">${customOrder.selectedKit.shortDesc}</p>
                                        </div>
                                        <div class="col-md-3 text-end">
                                            <h6 class="text-success mb-0">
                                                + <fmt:formatNumber type="number" value="${customOrder.selectedKit.price}" /> đ
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="component-item">
                                    <h6 class="mb-1">
                                        <i class="fas fa-toolbox text-secondary"></i> 
                                        Kit: Không sử dụng kit bổ sung
                                    </h6>
                                    <p class="text-muted mb-0">Không cần kit bổ sung cho đơn hàng này</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Services -->
                    <div class="preview-section">
                        <h4 class="mb-3">
                            <i class="fas fa-cogs text-warning"></i> 
                            Dịch vụ tùy chỉnh
                        </h4>
                        
                        <c:set var="hasServices" value="false" />
                        
                        <c:if test="${customOrder.lubingService}">
                            <c:set var="hasServices" value="true" />
                            <div class="service-item">
                                <h6 class="mb-1">
                                    <i class="fas fa-oil-can text-primary"></i> 
                                    Lubing Switch Service
                                </h6>
                                <p class="text-muted mb-0">Bôi trơn switch để cảm giác gõ mượt mà hơn</p>
                            </div>
                        </c:if>
                        
                        <c:if test="${customOrder.stabilizerTuning}">
                            <c:set var="hasServices" value="true" />
                            <div class="service-item">
                                <h6 class="mb-1">
                                    <i class="fas fa-wrench text-primary"></i> 
                                    Stabilizer Tuning
                                </h6>
                                <p class="text-muted mb-0">Điều chỉnh stabilizer cho phím space, enter, shift</p>
                            </div>
                        </c:if>
                        
                        <c:if test="${customOrder.keycapCustomization}">
                            <c:set var="hasServices" value="true" />
                            <div class="service-item">
                                <h6 class="mb-1">
                                    <i class="fas fa-palette text-primary"></i> 
                                    Keycap Customization
                                </h6>
                                <p class="text-muted mb-0">In logo hoặc text tùy chỉnh lên keycap</p>
                            </div>
                        </c:if>
                        
                        <c:if test="${customOrder.cableCustomization}">
                            <c:set var="hasServices" value="true" />
                            <div class="service-item">
                                <h6 class="mb-1">
                                    <i class="fas fa-plug text-primary"></i> 
                                    Cable Customization
                                </h6>
                                <p class="text-muted mb-0">Dây cáp tùy chỉnh màu sắc và độ dài</p>
                            </div>
                        </c:if>
                        
                        <c:if test="${customOrder.caseModding}">
                            <c:set var="hasServices" value="true" />
                            <div class="service-item">
                                <h6 class="mb-1">
                                    <i class="fas fa-hammer text-primary"></i> 
                                    Case Modding
                                </h6>
                                <p class="text-muted mb-0">Chỉnh sửa case: foam, plate, gasket</p>
                            </div>
                        </c:if>
                        
                        <c:if test="${!hasServices}">
                            <div class="text-center py-4">
                                <i class="fas fa-info-circle text-muted fa-2x mb-3"></i>
                                <p class="text-muted">Không có dịch vụ tùy chỉnh nào được chọn</p>
                            </div>
                        </c:if>
                    </div>

                    <!-- Custom Notes -->
                    <c:if test="${not empty customOrder.customNotes}">
                        <div class="preview-section">
                            <h4 class="mb-3">
                                <i class="fas fa-sticky-note text-info"></i> 
                                Ghi chú tùy chỉnh
                            </h4>
                            <div class="bg-white p-3 rounded border">
                                <p class="mb-0">${customOrder.customNotes}</p>
                            </div>
                        </div>
                    </c:if>
                </div>

                <!-- Order Summary -->
                <div class="col-lg-4">
                    <div class="bg-light rounded p-4 position-sticky" style="top: 20px;">
                        <h4 class="mb-4">
                            <i class="fas fa-receipt text-primary"></i> 
                            Tóm tắt đơn hàng
                        </h4>
                        
                        <!-- Base keyboard -->
                        <div class="d-flex justify-content-between mb-2">
                            <span>Bàn phím gốc:</span>
                            <span><fmt:formatNumber type="number" value="${customOrder.baseKeyboard.price}" /> đ</span>
                        </div>
                        
                        <!-- Keycap -->
                        <c:if test="${customOrder.selectedKeycap != null}">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Keycap:</span>
                                <span>+ <fmt:formatNumber type="number" value="${customOrder.selectedKeycap.price}" /> đ</span>
                            </div>
                        </c:if>
                        
                        <!-- Kit -->
                        <c:if test="${customOrder.selectedKit != null}">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Kit:</span>
                                <span>+ <fmt:formatNumber type="number" value="${customOrder.selectedKit.price}" /> đ</span>
                            </div>
                        </c:if>
                        
                        <!-- Services -->
                        <c:if test="${customOrder.lubingService}">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Lubing Service:</span>
                                <span>+ 75,000 đ</span>
                            </div>
                        </c:if>
                        <c:if test="${customOrder.stabilizerTuning}">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Stabilizer Tuning:</span>
                                <span>+ 40,000 đ</span>
                            </div>
                        </c:if>
                        <c:if test="${customOrder.keycapCustomization}">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Keycap Custom:</span>
                                <span>+ 150,000 đ</span>
                            </div>
                        </c:if>
                        <c:if test="${customOrder.cableCustomization}">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Cable Custom:</span>
                                <span>+ 225,000 đ</span>
                            </div>
                        </c:if>
                        <c:if test="${customOrder.caseModding}">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Case Modding:</span>
                                <span>+ 350,000 đ</span>
                            </div>
                        </c:if>
                        
                        <hr>
                        <div class="d-flex justify-content-between mb-4">
                            <h5>Tổng cộng:</h5>
                            <h5 class="text-primary">
                                <fmt:formatNumber type="number" value="${customOrder.totalPrice}" /> đ
                            </h5>
                        </div>
                        
                        <div class="alert alert-info">
                            <small>
                                <i class="fas fa-info-circle"></i>
                                Thời gian ước tính: 5-7 ngày làm việc
                            </small>
                        </div>
                        
                        <form action="/custom/confirm/${customOrder.id}" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="btn btn-success w-100 mb-2">
                                <i class="fas fa-check"></i> Tiến hành thanh toán
                            </button>
                        </form>
                        
                        <a href="/custom/keyboard/${customOrder.baseKeyboard.id}" class="btn btn-outline-primary w-100 mb-2">
                            <i class="fas fa-edit"></i> Chỉnh sửa
                        </a>
                        
                        <a href="/cart" class="btn btn-outline-secondary w-100">
                            <i class="fas fa-arrow-left"></i> Quay lại giỏ hàng
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Preview Page End -->

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