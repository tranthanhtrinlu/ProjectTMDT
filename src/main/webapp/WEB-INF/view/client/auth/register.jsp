<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<<<<<<< Updated upstream
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Register - KeyBoardShop</title>
                <link href="/css/styles.css" rel="stylesheet" />
=======
                <meta name="description" content="Đăng ký tài khoản Keyboard Shop - Cửa hàng bàn phím chuyên nghiệp" />
                <meta name="author" content="Keyboard Shop" />
                <title>Đăng ký - Keyboard Shop</title>
                
                <!-- Google Fonts -->
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
                
                <!-- CSS -->
                <link href="/css/auth.css" rel="stylesheet" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
                
                <!-- Font Awesome -->
>>>>>>> Stashed changes
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="auth-body">
                <div class="auth-container">
                    <div class="auth-card register-card">
                        <!-- Header -->
                        <div class="auth-header">
                            <h1><i class="fas fa-user-plus me-2"></i>Đăng ký</h1>
                            <p>Tạo tài khoản mới để trải nghiệm dịch vụ</p>
                        </div>

                        <!-- Body -->
                        <div class="auth-body">
                            <!-- Registration Form -->
                            <form:form method="post" action="/register" modelAttribute="registerUser" id="registerForm">
                                <c:set var="errorPassword">
                                    <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorEmail">
                                    <form:errors path="email" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorFirstName">
                                    <form:errors path="firstName" cssClass="invalid-feedback" />
                                </c:set>

                                <!-- Name Fields -->
                                <div class="form-row">
                                    <div class="form-group">
                                        <div class="form-input-group">
                                            <i class="fas fa-user"></i>
                                            <form:input
                                                class="form-control-modern ${not empty errorFirstName ? 'is-invalid' : ''}"
                                                type="text"
                                                placeholder=" "
                                                path="firstName"
                                                id="firstName" />
                                            <label class="form-label" for="firstName">Họ</label>
                                        </div>
                                        ${errorFirstName}
                                    </div>

                                    <div class="form-group">
                                        <div class="form-input-group">
                                            <i class="fas fa-user"></i>
                                            <form:input
                                                class="form-control-modern"
                                                type="text"
                                                placeholder=" "
                                                path="lastName"
                                                id="lastName" />
                                            <label class="form-label" for="lastName">Tên</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Email Field -->
                                <div class="form-group">
                                    <div class="form-input-group">
                                        <i class="fas fa-envelope"></i>
                                        <form:input
                                            class="form-control-modern ${not empty errorEmail ? 'is-invalid' : ''}"
                                            type="email"
                                            placeholder=" "
                                            path="email"
                                            id="email" />
                                        <label class="form-label" for="email">Địa chỉ email</label>
                                    </div>
                                    ${errorEmail}
                                </div>

                                <!-- Password Fields -->
                                <div class="form-row">
                                    <div class="form-group">
                                        <div class="form-input-group">
                                            <i class="fas fa-lock"></i>
                                            <form:input
                                                class="form-control-modern ${not empty errorPassword ? 'is-invalid' : ''}"
                                                type="password"
                                                placeholder=" "
                                                path="password"
                                                id="password" />
                                            <label class="form-label" for="password">Mật khẩu</label>
                                        </div>
                                        <!-- Password Strength Indicator -->
                                        <div class="password-strength" id="passwordStrength" style="display: none;">
                                            <div class="strength-text">Độ mạnh mật khẩu: <span id="strengthText">Yếu</span></div>
                                            <div class="strength-bar">
                                                <div class="strength-fill" id="strengthFill"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="form-input-group">
                                            <i class="fas fa-lock"></i>
                                            <form:input
                                                class="form-control-modern"
                                                type="password"
                                                placeholder=" "
                                                path="confirmPassword"
                                                id="confirmPassword" />
                                            <label class="form-label" for="confirmPassword">Xác nhận mật khẩu</label>
                                        </div>
                                    </div>
                                </div>
                                
                                ${errorPassword}

                                <!-- Terms & Conditions -->
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="terms" required>
                                    <label class="form-check-label" for="terms">
                                        Tôi đồng ý với <a href="#" style="color: var(--primary-color);">Điều khoản sử dụng</a> 
                                        và <a href="#" style="color: var(--primary-color);">Chính sách bảo mật</a>
                                    </label>
                                </div>

                                <button type="submit" class="btn-auth-primary" id="registerBtn">
                                    <i class="fas fa-user-plus me-2"></i>Tạo tài khoản
                                </button>
                            </form:form>
                        </div>

                        <!-- Footer -->
                        <div class="auth-footer">
                            <div>
                                Đã có tài khoản? 
                                <a href="/login">
                                    <i class="fas fa-sign-in-alt me-1"></i>Đăng nhập ngay
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Scripts -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                
                <script>
                    // Form submit with loading state
                    document.getElementById('registerForm').addEventListener('submit', function(e) {
                        const termsCheckbox = document.getElementById('terms');
                        if (!termsCheckbox.checked) {
                            e.preventDefault();
                            alert('Vui lòng đồng ý với điều khoản sử dụng!');
                            return;
                        }

                        const submitBtn = document.getElementById('registerBtn');
                        submitBtn.classList.add('btn-loading');
                        submitBtn.disabled = true;
                    });

                    // Password strength checker
                    document.getElementById('password').addEventListener('input', function() {
                        const password = this.value;
                        const strengthIndicator = document.getElementById('passwordStrength');
                        const strengthText = document.getElementById('strengthText');
                        const strengthFill = document.getElementById('strengthFill');
                        const strengthContainer = strengthIndicator.parentElement;

                        if (password.length > 0) {
                            strengthIndicator.style.display = 'block';
                            
                            let score = 0;
                            let feedback = 'Yếu';

                            // Length check
                            if (password.length >= 8) score++;
                            if (password.length >= 12) score++;

                            // Character variety checks
                            if (/[a-z]/.test(password)) score++;
                            if (/[A-Z]/.test(password)) score++;
                            if (/[0-9]/.test(password)) score++;
                            if (/[^A-Za-z0-9]/.test(password)) score++;

                            // Remove existing strength classes
                            strengthContainer.classList.remove('strength-weak', 'strength-medium', 'strength-strong');

                            if (score <= 2) {
                                strengthContainer.classList.add('strength-weak');
                                feedback = 'Yếu';
                            } else if (score <= 4) {
                                strengthContainer.classList.add('strength-medium');
                                feedback = 'Trung bình';
                            } else {
                                strengthContainer.classList.add('strength-strong');
                                feedback = 'Mạnh';
                            }

                            strengthText.textContent = feedback;
                        } else {
                            strengthIndicator.style.display = 'none';
                        }
                    });

                    // Confirm password validation
                    document.getElementById('confirmPassword').addEventListener('input', function() {
                        const password = document.getElementById('password').value;
                        const confirmPassword = this.value;
                        
                        if (confirmPassword.length > 0) {
                            if (password !== confirmPassword) {
                                this.classList.add('is-invalid');
                            } else {
                                this.classList.remove('is-invalid');
                            }
                        }
                    });

                    // Input focus animations
                    document.querySelectorAll('.form-control-modern').forEach(input => {
                        input.addEventListener('focus', function() {
                            this.parentElement.querySelector('i').style.color = '#4f46e5';
                        });
                        
                        input.addEventListener('blur', function() {
                            if (!this.value) {
                                this.parentElement.querySelector('i').style.color = '#6b7280';
                            }
                        });
                    });

                    // Real-time form validation
                    document.querySelectorAll('input[required]').forEach(input => {
                        input.addEventListener('blur', function() {
                            if (!this.value) {
                                this.classList.add('is-invalid');
                            } else {
                                this.classList.remove('is-invalid');
                            }
                        });

                        input.addEventListener('input', function() {
                            if (this.value) {
                                this.classList.remove('is-invalid');
                            }
                        });
                    });
                </script>
            </body>

            </html>