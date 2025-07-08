<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Đơn hàng custom - Keyboardshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
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
    <link href="/css/custom-orders.css" rel="stylesheet">
    
    <!-- Meta CSRF -->
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
</head>

<body>
    <jsp:include page="../layout/header.jsp" />

    <!-- Orders Page Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="mb-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Đơn hàng custom</li>
                    </ol>
                </nav>
            </div>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">
                    <i class="fas fa-list-alt text-primary"></i> 
                    Đơn hàng custom của bạn
                </h2>
                <a href="/products?type=KEYBOARD" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Tạo đơn mới
                </a>
            </div>
            
            <!-- Loading Spinner -->
            <div id="loadingSpinner" class="text-center py-5">
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <p class="mt-2">Đang tải đơn hàng...</p>
            </div>
            
            <!-- Filters -->
            <div id="filtersSection" style="display: none;" class="card mb-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <label class="form-label">Trạng thái:</label>
                            <select class="form-select" id="statusFilter">
                                <option value="">Tất cả</option>
                                <option value="PENDING">Đang chờ</option>
                                <option value="PROCESSING">Đang xử lý</option>
                                <option value="READY">Hoàn thành</option>
                                <option value="SHIPPED">Đã giao</option>
                                <option value="CANCELLED">Đã hủy</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Sắp xếp:</label>
                            <select class="form-select" id="sortFilter">
                                <option value="newest">Mới nhất</option>
                                <option value="oldest">Cũ nhất</option>
                                <option value="price-high">Giá cao</option>
                                <option value="price-low">Giá thấp</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Tìm kiếm:</label>
                            <input type="text" class="form-control" id="searchInput" placeholder="Tìm theo tên bàn phím...">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Hiển thị:</label>
                            <select class="form-select" id="pageSizeSelect">
                                <option value="5">5 đơn</option>
                                <option value="10">10 đơn</option>
                                <option value="15">15 đơn</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Orders Container -->
            <div id="ordersContainer"></div>
            
            <!-- Pagination -->
            <div id="paginationContainer" class="mt-4"></div>
            
            <!-- Empty State -->
            <div id="emptyState" style="display: none;" class="text-center py-5">
                <i class="fas fa-shopping-cart text-muted fa-3x mb-3"></i>
                <h4 class="text-muted">Chưa có đơn hàng custom nào</h4>
                <p class="text-muted">Hãy chọn một bàn phím và bắt đầu tùy chỉnh!</p>
                <a href="/products?type=KEYBOARD" class="btn btn-primary">
                    <i class="fas fa-keyboard"></i> Chọn bàn phím
                </a>
            </div>
        </div>
    </div>
    <!-- Orders Page End -->

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
    <script src="/js/custom-orders-ajax.js"></script>
</body>

</html> 