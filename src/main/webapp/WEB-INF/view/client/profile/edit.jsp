<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Chỉnh sửa thông tin - CustomKeyz</title>

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

                <style>
                    body {
                        font-family: 'Be Vietnam Pro', sans-serif;
                        background-color: #f8f9fa;
                    }

                    .edit-container {
                        margin-top: 120px;
                        margin-bottom: 50px;
                    }

                    .edit-card {
                        background: white;
                        border-radius: 20px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                        padding: 2.5rem;
                    }

                    .edit-header {
                        text-align: center;
                        margin-bottom: 2rem;
                        padding-bottom: 1.5rem;
                        border-bottom: 2px solid #e9ecef;
                    }

                    .edit-title {
                        font-family: 'Montserrat', sans-serif;
                        font-size: 2.5rem;
                        font-weight: 700;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        margin-bottom: 0.5rem;
                    }

                    .edit-subtitle {
                        color: #666;
                        font-size: 1.1rem;
                    }

                    .form-group {
                        margin-bottom: 1.5rem;
                    }

                    .form-label {
                        font-weight: 600;
                        color: #333;
                        margin-bottom: 0.5rem;
                        font-size: 0.95rem;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .form-control {
                        border: 2px solid #e9ecef;
                        border-radius: 12px;
                        padding: 12px 16px;
                        font-size: 1rem;
                        transition: all 0.3s ease;
                        background-color: #f8f9fa;
                    }

                    .form-control:focus {
                        border-color: #667eea;
                        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
                        background-color: white;
                    }

                    .form-control.is-invalid {
                        border-color: #dc3545;
                        background-color: #fff5f5;
                    }

                    .invalid-feedback {
                        display: block;
                        color: #dc3545;
                        font-size: 0.9rem;
                        margin-top: 0.25rem;
                    }

                    .avatar-section {
                        text-align: center;
                        margin-bottom: 2rem;
                    }

                    .current-avatar {
                        width: 120px;
                        height: 120px;
                        border-radius: 50%;
                        border: 4px solid #667eea;
                        object-fit: cover;
                        margin-bottom: 1rem;
                    }

                    .avatar-upload {
                        position: relative;
                        display: inline-block;
                    }

                    .avatar-upload input[type="file"] {
                        position: absolute;
                        left: -9999px;
                    }

                    .avatar-upload-btn {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        padding: 8px 20px;
                        border-radius: 25px;
                        border: none;
                        cursor: pointer;
                        font-weight: 600;
                        transition: all 0.3s ease;
                    }

                    .avatar-upload-btn:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
                    }

                    .action-buttons {
                        display: flex;
                        gap: 1rem;
                        justify-content: center;
                        flex-wrap: wrap;
                        margin-top: 2rem;
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
                        cursor: pointer;
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

                    #avatarPreview {
                        max-width: 120px;
                        max-height: 120px;
                        border-radius: 50%;
                        border: 4px solid #667eea;
                        object-fit: cover;
                        margin-top: 1rem;
                    }

                    @media (max-width: 768px) {
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

                <div class="container edit-container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="edit-card">
                                <!-- Edit Header -->
                                <div class="edit-header">
                                    <h1 class="edit-title">Chỉnh sửa thông tin</h1>
                                    <p class="edit-subtitle">Cập nhật thông tin cá nhân của bạn</p>
                                </div>

                                <!-- Edit Form -->
                                <form:form method="post" action="/profile/update" modelAttribute="userProfile"
                                    enctype="multipart/form-data">
                                    
                                    <!-- Hidden ID -->
                                    <form:hidden path="id" />

                                    <!-- Avatar Section -->
                                    <div class="avatar-section">
                                        <c:choose>
                                            <c:when test="${not empty userProfile.avatar}">
                                                <img src="/images/avatar/${userProfile.avatar}" alt="Current Avatar" class="current-avatar" id="currentAvatar">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/images/avatar/default-avatar.jpg" alt="Default Avatar" class="current-avatar" id="currentAvatar">
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="avatar-upload">
                                            <input type="file" id="avatarFile" name="avatarFile" accept=".png,.jpg,.jpeg">
                                            <label for="avatarFile" class="avatar-upload-btn">
                                                <i class="fas fa-camera me-2"></i>Đổi ảnh đại diện
                                            </label>
                                        </div>
                                        <img id="avatarPreview" style="display: none;" alt="Avatar Preview">
                                    </div>

                                    <div class="row">
                                        <!-- Full Name -->
                                        <div class="col-md-12 form-group">
                                            <c:set var="errorFullName">
                                                <form:errors path="fullName" cssClass="invalid-feedback" />
                                            </c:set>
                                            <label class="form-label">
                                                <i class="fas fa-user me-2"></i>Họ và tên
                                            </label>
                                            <form:input type="text" 
                                                class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                path="fullName" placeholder="Nhập họ và tên của bạn" />
                                            ${errorFullName}
                                        </div>

                                        <!-- Email (Read-only) -->
                                        <div class="col-md-12 form-group">
                                            <label class="form-label">
                                                <i class="fas fa-envelope me-2"></i>Email
                                            </label>
                                            <form:input type="email" class="form-control" path="email" readonly="true" 
                                                style="background-color: #e9ecef; cursor: not-allowed;" />
                                            <small class="text-muted">Email không thể thay đổi</small>
                                        </div>

                                        <!-- Phone -->
                                        <div class="col-md-6 form-group">
                                            <label class="form-label">
                                                <i class="fas fa-phone me-2"></i>Số điện thoại
                                            </label>
                                            <form:input type="tel" class="form-control" path="phone" 
                                                placeholder="Nhập số điện thoại" />
                                        </div>

                                        <!-- Address -->
                                        <div class="col-md-6 form-group">
                                            <label class="form-label">
                                                <i class="fas fa-map-marker-alt me-2"></i>Địa chỉ
                                            </label>
                                            <form:textarea class="form-control" path="address" rows="3" 
                                                placeholder="Nhập địa chỉ của bạn" style="resize: vertical;"/>
                                        </div>
                                    </div>

                                    <!-- Action Buttons -->
                                    <div class="action-buttons">
                                        <button type="submit" class="btn-modern btn-primary-modern">
                                            <i class="fas fa-save me-2"></i>Lưu thay đổi
                                        </button>
                                        <a href="/profile" class="btn-modern btn-outline-modern">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại
                                        </a>
                                    </div>
                                </form:form>
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

                <script>
                    // Avatar preview
                    document.getElementById('avatarFile').addEventListener('change', function(event) {
                        const file = event.target.files[0];
                        if (file) {
                            const reader = new FileReader();
                            reader.onload = function(e) {
                                const preview = document.getElementById('avatarPreview');
                                const current = document.getElementById('currentAvatar');
                                
                                preview.src = e.target.result;
                                preview.style.display = 'block';
                                current.style.display = 'none';
                            };
                            reader.readAsDataURL(file);
                        }
                    });

                    // Form validation
                    document.querySelector('form').addEventListener('submit', function(e) {
                        const fullName = document.querySelector('input[name="fullName"]').value.trim();
                        
                        if (fullName.length < 3) {
                            e.preventDefault();
                            alert('Họ và tên phải có tối thiểu 3 ký tự');
                        }
                    });
                </script>
            </body>

            </html> 