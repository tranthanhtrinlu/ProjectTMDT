<%@page contentType="text/html" pageEncoding="UTF-8" %>
<<<<<<< Updated upstream
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi Mật Khẩu - KeyBoardShop</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
    <!-- Icon Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Libraries -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/profile/profile-password.css" rel="stylesheet">
    <!-- Template CSS -->
    <link href="/client/css/style.css" rel="stylesheet">
    <!-- CSRF Meta Tags -->
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css" rel="stylesheet">
</head>
<body>
<!-- Spinner -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>

<!-- Header -->
<jsp:include page="../layout/header.jsp" />

<!-- Main Content -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Tài Khoản</a></li>
                <li class="breadcrumb-item active">Đổi Mật Khẩu</li>
            </ol>
        </nav>

        <div class="row g-4">
            <div class="col-md-6 mx-auto">
                <div class="card shadow-sm p-4">
                    <h3 class="mb-4"><i class="fas fa-lock"></i> Đổi Mật Khẩu</h3>
                    <form action="/profile/change-password" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">Mật Khẩu Hiện Tại</label>
                            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                        </div>
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">Mật Khẩu Mới</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Xác Nhận Mật Khẩu Mới</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Đổi Mật Khẩu</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="../layout/footer.jsp" />

<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
<script>
    $(document).ready(function() {
        $('#confirmPassword').on('keyup', function() {
            if ($('#newPassword').val() !== $(this).val()) {
                $(this).addClass('is-invalid');
                $('#passwordMatchError').text('Mật khẩu không khớp!').show();
            } else {
                $(this).removeClass('is-invalid');
                $('#passwordMatchError').hide();
            }
        });
    });
</script>
</body>
</html>
=======
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Đổi mật khẩu - CustomKeyz</title>

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

                    .password-container {
                        margin-top: 120px;
                        margin-bottom: 50px;
                    }

                    .password-card {
                        background: white;
                        border-radius: 20px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                        padding: 2.5rem;
                        max-width: 600px;
                        margin: 0 auto;
                    }

                    .password-header {
                        text-align: center;
                        margin-bottom: 2rem;
                        padding-bottom: 1.5rem;
                        border-bottom: 2px solid #e9ecef;
                    }

                    .password-title {
                        font-family: 'Montserrat', sans-serif;
                        font-size: 2.5rem;
                        font-weight: 700;
                        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        margin-bottom: 0.5rem;
                    }

                    .password-subtitle {
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

                    .password-input-group {
                        position: relative;
                    }

                    .form-control {
                        border: 2px solid #e9ecef;
                        border-radius: 12px;
                        padding: 12px 50px 12px 16px;
                        font-size: 1rem;
                        transition: all 0.3s ease;
                        background-color: #f8f9fa;
                    }

                    .form-control:focus {
                        border-color: #f093fb;
                        box-shadow: 0 0 0 0.2rem rgba(240, 147, 251, 0.25);
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

                    .password-toggle {
                        position: absolute;
                        right: 15px;
                        top: 50%;
                        transform: translateY(-50%);
                        background: none;
                        border: none;
                        color: #666;
                        cursor: pointer;
                        font-size: 1.1rem;
                        z-index: 10;
                    }

                    .password-toggle:hover {
                        color: #f093fb;
                    }

                    .password-requirements {
                        background: #f8f9fa;
                        padding: 1rem;
                        border-radius: 10px;
                        margin-bottom: 1.5rem;
                        border-left: 4px solid #f093fb;
                    }

                    .password-requirements h6 {
                        color: #333;
                        margin-bottom: 0.5rem;
                        font-weight: 600;
                    }

                    .password-requirements ul {
                        margin: 0;
                        padding-left: 1.2rem;
                        color: #666;
                        font-size: 0.9rem;
                    }

                    .password-requirements li {
                        margin-bottom: 0.25rem;
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
                        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                        color: white;
                    }

                    .btn-primary-modern:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 8px 25px rgba(240, 147, 251, 0.4);
                        color: white;
                    }

                    .btn-outline-modern {
                        background: transparent;
                        border: 2px solid #f093fb;
                        color: #f093fb;
                    }

                    .btn-outline-modern:hover {
                        background: #f093fb;
                        color: white;
                        transform: translateY(-2px);
                    }

                    .security-tips {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        padding: 1.5rem;
                        border-radius: 15px;
                        margin-bottom: 2rem;
                    }

                    .security-tips h6 {
                        margin-bottom: 0.5rem;
                        font-weight: 600;
                    }

                    .security-tips p {
                        margin: 0;
                        font-size: 0.9rem;
                        opacity: 0.9;
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

                <div class="container password-container">
                    <div class="password-card">
                        <!-- Password Header -->
                        <div class="password-header">
                            <h1 class="password-title">Đổi mật khẩu</h1>
                            <p class="password-subtitle">Cập nhật mật khẩu để bảo mật tài khoản</p>
                        </div>

                        <!-- Security Tips -->
                        <div class="security-tips">
                            <h6><i class="fas fa-shield-alt me-2"></i>Lưu ý bảo mật</h6>
                            <p>Sử dụng mật khẩu mạnh với ít nhất 6 ký tự, bao gồm chữ cái, số và ký tự đặc biệt để bảo vệ tài khoản của bạn.</p>
                        </div>

                        <!-- Password Form -->
                        <form:form method="post" action="/profile/change-password" modelAttribute="changePasswordDTO">
                            
                            <!-- Current Password -->
                            <div class="form-group">
                                <c:set var="errorCurrentPassword">
                                    <form:errors path="currentPassword" cssClass="invalid-feedback" />
                                </c:set>
                                <label class="form-label">
                                    <i class="fas fa-lock me-2"></i>Mật khẩu hiện tại
                                </label>
                                <div class="password-input-group">
                                    <form:input type="password" 
                                        class="form-control ${not empty errorCurrentPassword ? 'is-invalid' : ''}"
                                        path="currentPassword" 
                                        placeholder="Nhập mật khẩu hiện tại"
                                        id="currentPassword" />
                                    <button type="button" class="password-toggle" onclick="togglePassword('currentPassword')">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                                ${errorCurrentPassword}
                            </div>

                            <!-- New Password -->
                            <div class="form-group">
                                <c:set var="errorNewPassword">
                                    <form:errors path="newPassword" cssClass="invalid-feedback" />
                                </c:set>
                                <label class="form-label">
                                    <i class="fas fa-key me-2"></i>Mật khẩu mới
                                </label>
                                <div class="password-input-group">
                                    <form:input type="password" 
                                        class="form-control ${not empty errorNewPassword ? 'is-invalid' : ''}"
                                        path="newPassword" 
                                        placeholder="Nhập mật khẩu mới"
                                        id="newPassword" />
                                    <button type="button" class="password-toggle" onclick="togglePassword('newPassword')">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                                ${errorNewPassword}
                            </div>

                            <!-- Confirm Password -->
                            <div class="form-group">
                                <c:set var="errorConfirmPassword">
                                    <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                </c:set>
                                <label class="form-label">
                                    <i class="fas fa-check-circle me-2"></i>Xác nhận mật khẩu mới
                                </label>
                                <div class="password-input-group">
                                    <form:input type="password" 
                                        class="form-control ${not empty errorConfirmPassword ? 'is-invalid' : ''}"
                                        path="confirmPassword" 
                                        placeholder="Nhập lại mật khẩu mới"
                                        id="confirmPassword" />
                                    <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword')">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                                ${errorConfirmPassword}
                            </div>

                            <!-- Password Requirements -->
                            <div class="password-requirements">
                                <h6><i class="fas fa-info-circle me-2"></i>Yêu cầu mật khẩu</h6>
                                <ul>
                                    <li>Tối thiểu 6 ký tự</li>
                                    <li>Nên sử dụng cả chữ hoa và chữ thường</li>
                                    <li>Nên bao gồm ít nhất một số</li>
                                    <li>Nên có ít nhất một ký tự đặc biệt (@, #, $, %, v.v.)</li>
                                </ul>
                            </div>

                            <!-- Action Buttons -->
                            <div class="action-buttons">
                                <button type="submit" class="btn-modern btn-primary-modern">
                                    <i class="fas fa-save me-2"></i>Đổi mật khẩu
                                </button>
                                <a href="/profile" class="btn-modern btn-outline-modern">
                                    <i class="fas fa-arrow-left me-2"></i>Quay lại
                                </a>
                            </div>
                        </form:form>
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
                    // Toggle password visibility
                    function togglePassword(fieldId) {
                        const field = document.getElementById(fieldId);
                        const button = field.nextElementSibling;
                        const icon = button.querySelector('i');
                        
                        if (field.type === 'password') {
                            field.type = 'text';
                            icon.classList.remove('fa-eye');
                            icon.classList.add('fa-eye-slash');
                        } else {
                            field.type = 'password';
                            icon.classList.remove('fa-eye-slash');
                            icon.classList.add('fa-eye');
                        }
                    }

                    // Form validation
                    document.querySelector('form').addEventListener('submit', function(e) {
                        const currentPassword = document.getElementById('currentPassword').value;
                        const newPassword = document.getElementById('newPassword').value;
                        const confirmPassword = document.getElementById('confirmPassword').value;
                        
                        // Check if new password and confirm password match
                        if (newPassword !== confirmPassword) {
                            e.preventDefault();
                            alert('Mật khẩu mới và xác nhận mật khẩu không khớp!');
                            return;
                        }
                        
                        // Check password length
                        if (newPassword.length < 6) {
                            e.preventDefault();
                            alert('Mật khẩu mới phải có ít nhất 6 ký tự!');
                            return;
                        }
                        
                        // Check if current password is provided
                        if (currentPassword.length === 0) {
                            e.preventDefault();
                            alert('Vui lòng nhập mật khẩu hiện tại!');
                            return;
                        }
                    });

                    // Real-time password match validation
                    document.getElementById('confirmPassword').addEventListener('input', function() {
                        const newPassword = document.getElementById('newPassword').value;
                        const confirmPassword = this.value;
                        
                        if (confirmPassword && newPassword !== confirmPassword) {
                            this.classList.add('is-invalid');
                        } else {
                            this.classList.remove('is-invalid');
                        }
                    });
                </script>
            </body>

            </html> 
>>>>>>> Stashed changes
