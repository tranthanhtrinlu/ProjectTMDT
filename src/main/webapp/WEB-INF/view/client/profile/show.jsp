<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Quản lý tài khoản - CustomKeyz</title>

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&family=Be+Vietnam+Pro:wght@300;400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&family=Orbitron:wght@400;700;800;900&display=swap"
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

                <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                    rel="stylesheet">

                <style>
                    body {
                        font-family: 'Be Vietnam Pro', sans-serif;
                        background-color: #f8f9fa;
                    }

                    .profile-container {
                        margin-top: 120px;
                        margin-bottom: 50px;
                    }

                    .profile-card {
                        background: white;
                        border-radius: 20px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                        padding: 2rem;
                        margin-bottom: 2rem;
                    }

                    .profile-header {
                        text-align: center;
                        margin-bottom: 2rem;
                        padding-bottom: 1.5rem;
                        border-bottom: 2px solid #e9ecef;
                    }

                    .profile-avatar {
                        width: 150px;
                        height: 150px;
                        border-radius: 50%;
                        border: 5px solid #667eea;
                        object-fit: cover;
                        margin-bottom: 1rem;
                    }

                    .profile-name {
                        font-family: 'Montserrat', sans-serif;
                        font-size: 2rem;
                        font-weight: 700;
                        color: #333;
                        margin-bottom: 0.5rem;
                    }

                    .profile-email {
                        color: #666;
                        font-size: 1.1rem;
                    }

                    .profile-info {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                        gap: 2rem;
                        margin-bottom: 2rem;
                    }

                    .info-item {
                        background: #f8f9fa;
                        padding: 1.5rem;
                        border-radius: 15px;
                        border-left: 4px solid #667eea;
                    }

                    .info-label {
                        font-weight: 600;
                        color: #333;
                        margin-bottom: 0.5rem;
                        font-size: 0.9rem;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .info-value {
                        font-size: 1.1rem;
                        color: #555;
                        word-break: break-word;
                    }

                    .action-buttons {
                        display: flex;
                        gap: 1rem;
                        justify-content: center;
                        flex-wrap: wrap;
                    }

                    .btn-modern {
                        padding: 12px 30px;
                        border-radius: 50px;
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                        transition: all 0.3s ease;
                        text-decoration: none;
                        border: none;
                        font-family: 'Be Vietnam Pro', sans-serif;
                    }

                    .btn-primary-modern {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                    }

                    .btn-primary-modern:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
                        color: white;
                    }

                    .btn-secondary-modern {
                        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                        color: white;
                    }

                    .btn-secondary-modern:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 8px 25px rgba(240, 147, 251, 0.4);
                        color: white;
                    }

                    .btn-outline-modern {
                        background: transparent;
                        border: 2px solid #667eea;
                        color: #667eea;
                    }

                    .btn-outline-modern:hover {
                        background: #667eea;
                        color: white;
                        transform: translateY(-2px);
                    }

                    .alert-success {
                        background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
                        border: none;
                        border-radius: 15px;
                        color: white;
                        padding: 1rem 1.5rem;
                        margin-bottom: 2rem;
                    }

                    @media (max-width: 768px) {
                        .profile-info {
                            grid-template-columns: 1fr;
                        }

                        .action-buttons {
                            flex-direction: column;
                            align-items: center;
                        }

                        .btn-modern {
                            width: 100%;
                            max-width: 300px;
                        }
                    }
                </style>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />

                <div class="container profile-container">
                    <!-- Success Message -->
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success alert-dismissible fade show">
                            <i class="fas fa-check-circle me-2"></i>
                            ${successMessage}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="profile-card">
                                <!-- Profile Header -->
                                <div class="profile-header">
                                    <c:choose>
                                        <c:when test="${not empty userProfile.avatar}">
                                            <img src="/images/avatar/${userProfile.avatar}" alt="Avatar" class="profile-avatar">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/images/avatar/default-avatar.jpg" alt="Default Avatar" class="profile-avatar">
                                        </c:otherwise>
                                    </c:choose>
                                    <h1 class="profile-name">${userProfile.fullName}</h1>
                                    <p class="profile-email">${userProfile.email}</p>
                                </div>

                                <!-- Profile Information -->
                                <div class="profile-info">
                                    <div class="info-item">
                                        <div class="info-label">
                                            <i class="fas fa-user me-2"></i>Họ và tên
                                        </div>
                                        <div class="info-value">
                                            ${not empty userProfile.fullName ? userProfile.fullName : 'Chưa cập nhật'}
                                        </div>
                                    </div>

                                    <div class="info-item">
                                        <div class="info-label">
                                            <i class="fas fa-envelope me-2"></i>Email
                                        </div>
                                        <div class="info-value">${userProfile.email}</div>
                                    </div>

                                    <div class="info-item">
                                        <div class="info-label">
                                            <i class="fas fa-phone me-2"></i>Số điện thoại
                                        </div>
                                        <div class="info-value">
                                            ${not empty userProfile.phone ? userProfile.phone : 'Chưa cập nhật'}
                                        </div>
                                    </div>

                                    <div class="info-item">
                                        <div class="info-label">
                                            <i class="fas fa-map-marker-alt me-2"></i>Địa chỉ
                                        </div>
                                        <div class="info-value">
                                            ${not empty userProfile.address ? userProfile.address : 'Chưa cập nhật'}
                                        </div>
                                    </div>
                                </div>

                                <!-- Action Buttons -->
                                <div class="action-buttons">
                                    <a href="/profile/edit" class="btn-modern btn-primary-modern">
                                        <i class="fas fa-edit me-2"></i>Chỉnh sửa thông tin
                                    </a>
                                    <a href="/profile/change-password" class="btn-modern btn-secondary-modern">
                                        <i class="fas fa-key me-2"></i>Đổi mật khẩu
                                    </a>
                                    <a href="/order-history" class="btn-modern btn-outline-modern">
                                        <i class="fas fa-history me-2"></i>Lịch sử mua hàng
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
            </body>

            </html> 