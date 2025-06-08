<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="/">KeyBoardShop</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="/show">Sản phẩm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/cart">Giỏ hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/custom">Tùy Chỉnh Bàn Phím</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/about-us">Giới Thiệu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/support">Hỗ Trợ</a>
                                </li>

                                <!-- Kiểm tra đăng nhập để hiển thị liên kết profile -->
                                <c:if test="${not empty sessionScope.id}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="fas fa-user"></i> Tài khoản
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li><a class="dropdown-item" href="/profile/edit">Thay đổi thông tin</a></li>
                                            <li><a class="dropdown-item" href="/profile/change-password">Đổi mật khẩu</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <!-- Hiển thị đăng nhập/đăng ký nếu chưa đăng nhập -->
                                <c:if test="${empty sessionScope.id}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="/login">Đăng nhập</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/register">Đăng ký</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->