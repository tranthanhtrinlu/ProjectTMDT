<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Đặt lại mật khẩu Keyboard Shop - Tạo mật khẩu mới" />
    <meta name="author" content="Keyboard Shop" />
    <title>Đặt lại mật khẩu - Keyboard Shop</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- CSS -->
    <link href="/css/auth.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="auth-body">
    <div class="auth-container">
        <div class="auth-card">
            <!-- Header -->
            <div class="auth-header">
                <h1><i class="fas fa-shield-alt me-2"></i>Đặt lại mật khẩu</h1>
                <p>Nhập mã xác thực và mật khẩu mới</p>
            </div>

            <!-- Body -->
            <div class="auth-body">
                <!-- Error & Success Messages -->
                <c:if test="${not empty error}">
                    <div class="alert-modern alert-error">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        ${error}
                    </div>
                </c:if>
                
                <c:if test="${not empty message}">
                    <div class="alert-modern alert-success">
                        <i class="fas fa-check-circle me-2"></i>
                        ${message}
                    </div>
                </c:if>

                <!-- Reset Password Form -->
                <form method="post" action="/verify-forgot-password" id="resetPasswordForm">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    
                    <!-- Email Field (readonly) -->
                    <div class="form-group">
                        <div class="form-input-group">
                            <i class="fas fa-envelope"></i>
                            <input class="form-control-modern" 
                                   type="email" 
                                   name="email" 
                                   value="${email}" 
                                   id="email"
                                   placeholder=" "
                                   readonly />
                            <label class="form-label" for="email">Địa chỉ email</label>
                        </div>
                    </div>

                    <!-- Verification Code -->
                    <div class="form-group">
                        <div class="form-input-group">
                            <i class="fas fa-key"></i>
                            <input class="form-control-modern" 
                                   type="text" 
                                   name="verificationCode" 
                                   value="${verificationCode}" 
                                   id="verificationCode"
                                   placeholder=" "
                                   required />
                            <label class="form-label" for="verificationCode">Mã xác thực</label>
                        </div>
                        <div class="form-help">
                            <small>
                                <i class="fas fa-info-circle me-1"></i>
                                Nhập mã 6 chữ số được gửi qua email
                            </small>
                        </div>
                    </div>

                    <!-- New Password -->
                    <div class="form-group">
                        <div class="form-input-group">
                            <i class="fas fa-lock"></i>
                            <input class="form-control-modern" 
                                   type="password" 
                                   name="newPassword" 
                                   id="newPassword"
                                   placeholder=" "
                                   required />
                            <label class="form-label" for="newPassword">Mật khẩu mới</label>
                        </div>
                        <!-- Password Strength Indicator -->
                        <div class="password-strength" id="passwordStrength" style="display: none;">
                            <div class="strength-text">Độ mạnh mật khẩu: <span id="strengthText">Yếu</span></div>
                            <div class="strength-bar">
                                <div class="strength-fill" id="strengthFill"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group">
                        <div class="form-input-group">
                            <i class="fas fa-lock"></i>
                            <input class="form-control-modern" 
                                   type="password" 
                                   name="confirmPassword" 
                                   id="confirmPassword"
                                   placeholder=" "
                                   required />
                            <label class="form-label" for="confirmPassword">Xác nhận mật khẩu</label>
                        </div>
                        <div id="passwordMatch" class="form-help" style="display: none;">
                            <small id="matchText">
                                <i class="fas fa-times-circle me-1" style="color: var(--error-color);"></i>
                                Mật khẩu không khớp
                            </small>
                        </div>
                    </div>

                    <button type="submit" class="btn-auth-primary" id="resetBtn">
                        <i class="fas fa-sync-alt me-2"></i>Đặt lại mật khẩu
                    </button>
                </form>

                <!-- Security Tips -->
                <div class="instructions-box">
                    <h5><i class="fas fa-shield-alt me-2"></i>Bảo mật tài khoản</h5>
                    <ul>
                        <li>Sử dụng mật khẩu dài ít nhất 8 ký tự</li>
                        <li>Kết hợp chữ hoa, chữ thường, số và ký tự đặc biệt</li>
                        <li>Không sử dụng thông tin cá nhân dễ đoán</li>
                        <li>Định kỳ thay đổi mật khẩu</li>
                    </ul>
                </div>
            </div>

            <!-- Footer -->
            <div class="auth-footer">
                <div class="mb-3">
                    <a href="/forgot-password">
                        <i class="fas fa-redo me-1"></i>Gửi lại mã xác thực
                    </a>
                </div>
                <div>
                    <a href="/login">
                        <i class="fas fa-arrow-left me-1"></i>Quay lại đăng nhập
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    
    <script>
        // Form submit with loading state
        document.getElementById('resetPasswordForm').addEventListener('submit', function(e) {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (newPassword !== confirmPassword) {
                e.preventDefault();
                document.getElementById('confirmPassword').classList.add('is-invalid');
                return;
            }

            const submitBtn = document.getElementById('resetBtn');
            submitBtn.classList.add('btn-loading');
            submitBtn.disabled = true;
        });

        // Password strength checker
        document.getElementById('newPassword').addEventListener('input', function() {
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
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = this.value;
            const matchIndicator = document.getElementById('passwordMatch');
            const matchText = document.getElementById('matchText');
            
            if (confirmPassword.length > 0) {
                matchIndicator.style.display = 'block';
                
                if (newPassword !== confirmPassword) {
                    this.classList.add('is-invalid');
                    matchText.innerHTML = '<i class="fas fa-times-circle me-1" style="color: var(--error-color);"></i>Mật khẩu không khớp';
                    matchText.style.color = 'var(--error-color)';
                } else {
                    this.classList.remove('is-invalid');
                    matchText.innerHTML = '<i class="fas fa-check-circle me-1" style="color: var(--success-color);"></i>Mật khẩu khớp';
                    matchText.style.color = 'var(--success-color)';
                }
            } else {
                matchIndicator.style.display = 'none';
                this.classList.remove('is-invalid');
            }
        });

        // Auto-hide alerts
        document.addEventListener('DOMContentLoaded', function() {
            const alerts = document.querySelectorAll('.alert-modern');
            alerts.forEach(alert => {
                setTimeout(() => {
                    alert.style.opacity = '0';
                    alert.style.transform = 'translateY(-10px)';
                    setTimeout(() => alert.remove(), 300);
                }, 8000);
            });
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

        // Verification code formatting
        document.getElementById('verificationCode').addEventListener('input', function() {
            let value = this.value.replace(/\D/g, ''); // Remove non-digits
            if (value.length > 6) {
                value = value.slice(0, 6); // Limit to 6 digits
            }
            this.value = value;
        });
    </script>

    <style>
        .form-help {
            margin-top: 8px;
        }

        .form-help small {
            color: var(--text-secondary);
            font-size: 14px;
            display: flex;
            align-items: center;
        }

        .instructions-box {
            background: var(--bg-light);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 20px;
            margin-top: 30px;
        }

        .instructions-box h5 {
            color: var(--text-primary);
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
        }

        .instructions-box ul {
            margin: 0;
            padding-left: 20px;
        }

        .instructions-box li {
            color: var(--text-secondary);
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 8px;
        }

        .instructions-box li:last-child {
            margin-bottom: 0;
        }

        .form-control-modern[readonly] {
            background-color: #f8f9fa;
            opacity: 0.8;
        }
    </style>
</body>
</html>