<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Đơn hàng custom - Keyboardshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    
    <!-- Meta CSRF -->
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
</head>

<body>
    <div class="container mt-5">
        <h2 class="mb-4">Đơn hàng custom của bạn</h2>
        
        <c:choose>
            <c:when test="${empty customOrders}">
                <div class="alert alert-info">
                    <h4>Chưa có đơn hàng custom nào</h4>
                    <p>Hãy chọn một bàn phím và bắt đầu tùy chỉnh!</p>
                    <a href="/products?type=KEYBOARD" class="btn btn-primary">Chọn bàn phím</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row">
                    <c:forEach var="order" items="${customOrders}">
                        <div class="col-md-6 mb-4">
                            <div class="card">
                                <div class="card-header bg-primary text-white">
                                    <h5 class="mb-0">${order.baseKeyboard.name}</h5>
                                    <small>Đơn hàng #CUSTOM${order.id}</small>
                                </div>
                                <div class="card-body">
                                    <p><strong>Giá:</strong> <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ</p>
                                    <p><strong>Trạng thái:</strong> ${order.status.displayName}</p>
                                    <p><strong>Ngày tạo:</strong> <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm" /></p>
                                    
                                    <div class="mt-3">
                                        <a href="/custom/preview/${order.id}" class="btn btn-outline-primary btn-sm">
                                            <i class="fas fa-eye"></i> Xem chi tiết
                                        </a>
                                        <c:if test="${order.status == 'PENDING'}">
                                            <a href="/custom/keyboard/${order.baseKeyboard.id}?customOrderId=${order.id}" class="btn btn-outline-warning btn-sm">
                                                <i class="fas fa-edit"></i> Chỉnh sửa
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
        
        <div class="mt-4">
            <a href="/" class="btn btn-secondary">Về trang chủ</a>
            <a href="/products?type=KEYBOARD" class="btn btn-primary">Tạo đơn mới</a>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 