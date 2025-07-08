<%@page contentType="text/html" pageEncoding="UTF-8" %>
<<<<<<< Updated upstream
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> Stashed changes

            <!DOCTYPE html>
            <html lang="en">

<<<<<<< Updated upstream
            <head>
                <meta charset="utf-8">
                <title> Lịch sử mua hàng - KeyBoardShop</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">
=======
<head>
    <meta charset="utf-8">
    <title>Lịch sử mua hàng - Keyboardshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
>>>>>>> Stashed changes

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


<<<<<<< Updated upstream
                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">
=======
    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">
    <link href="/css/order-history.css" rel="stylesheet">
    
    <!-- Meta CSRF -->
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
</head>
>>>>>>> Stashed changes

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

<<<<<<< Updated upstream
                <jsp:include page="../layout/header.jsp" />

                <!-- Cart Page Start -->
                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="mb-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Lịch sử mua hàng</li>
                                </ol>
                            </nav>
                        </div>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Giá cả</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Thành tiền</th>
                                        <th scope="col">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${ empty orders}">
                                        <tr>
                                            <td colspan="6">
                                                Không có đơn hàng nào được tạo
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td colspan="2">Order Id = ${order.id}</td>
                                            <td colspan="1">
                                                <fmt:formatNumber type="number" value=" ${order.totalPrice}" />
                                                đ
                                            </td>
                                            <td colspan="2"></td>
                                            <td colspan="1">
                                                ${order.status}
                                            </td>
                                        </tr>
                                        <c:forEach var="orderDetail" items="${order.orderDetails}">
                                            <tr>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/images/product/${orderDetail.product.image}"
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </th>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <a href="/product/${orderDetail.product.id}" target="_blank">
                                                            ${orderDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number" value="${orderDetail.price}" />
                                                        đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${orderDetail.quantity}">
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value="${orderDetail.price * orderDetail.quantity}" /> đ
                                                    </p>
                                                </td>
                                                <td></td>
=======
<!-- Order History Page Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="mb-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Lịch sử mua hàng</li>
                </ol>
            </nav>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="mb-0">
                <i class="fas fa-history text-primary"></i> 
                Lịch sử mua hàng
            </h2>
            <a href="/products" class="btn btn-primary">
                <i class="fas fa-shopping-cart"></i> Mua sắm ngay
            </a>
        </div>

        <!-- Loading Spinner -->
        <div id="loadingSpinner" class="text-center py-5">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <p class="mt-2">Đang tải lịch sử đơn hàng...</p>
        </div>
        
        <!-- Statistics Cards -->
        <div id="statsSection" style="display: none;" class="stats-cards mb-4">
            <div class="stat-card">
                <div class="stat-number" id="totalOrders">0</div>
                <div class="stat-label">Tổng đơn hàng</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="pendingOrders">0</div>
                <div class="stat-label">Đang chờ</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="completeOrders">0</div>
                <div class="stat-label">Hoàn thành</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="totalSpent">0</div>
                <div class="stat-label">Tổng chi tiêu (VNĐ)</div>
            </div>
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
                            <option value="SHIPPED">Đã giao</option>
                            <option value="COMPLETE">Hoàn thành</option>
                            <option value="CANCEL">Đã hủy</option>
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
                        <input type="text" class="form-control" id="searchInput" placeholder="Tìm theo tên sản phẩm hoặc ID đơn hàng...">
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
            <i class="fas fa-shopping-bag text-muted fa-3x mb-3"></i>
            <h4 class="text-muted">Chưa có đơn hàng nào</h4>
            <p class="text-muted">Bạn chưa có đơn hàng nào trong lịch sử. Hãy bắt đầu mua sắm ngay!</p>
            <a href="/products" class="btn btn-primary btn-lg">
                <i class="fas fa-shopping-cart"></i> Mua sắm ngay
            </a>
        </div>
    </div>
</div>
<!-- Order History Page End -->
>>>>>>> Stashed changes

                                            </tr>
                                        </c:forEach>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <!-- Cart Page End -->

<<<<<<< Updated upstream
=======
<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
<script src="/js/order-history-ajax.js"></script>
</body>
>>>>>>> Stashed changes

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
            </body>

            </html>