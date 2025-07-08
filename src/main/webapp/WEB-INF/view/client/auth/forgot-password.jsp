<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Quên mật khẩu Keyboard Shop - Khôi phục tài khoản của bạn" />
    <meta name="author" content="Keyboard Shop" />
    <title>Quên mật khẩu - Keyboard Shop</title>
    
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
                <h1><i class="fas fa-key me-2"></i>Quên mật khẩu</h1>
                <p>Nhập email để khôi phục mật khẩu của bạn</p>
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

                <!-- Forgot Password Form -->
                <form method="post" action="/forgot-password" id="forgotPasswordForm">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    
                    <div class="form-group">
                        <div class="form-input-group">
                            <i class="fas fa-envelope"></i>
                            <input class="form-control-modern" 
                                   type="email" 
                                   name="email" 
                                   value="${email}" 
                                   id="email"
                                   placeholder=" "
                                   required />
                            <label class="form-label" for="email">Địa chỉ email</label>
                        </div>
                        <div class="form-help">
                            <small>
                                <i class="fas fa-info-circle me-1"></i>
                                Chúng tôi sẽ gửi mã xác thực đến email này
                            </small>
                        </div>
                    </div>

                    <button type="submit" class="btn-auth-primary" id="submitBtn">
                        <i class="fas fa-paper-plane me-2"></i>Gửi mã xác thực
                    </button>
                </form>

                <!-- Instructions -->
                <div class="instructions-box">
                    <h5><i class="fas fa-lightbulb me-2"></i>Hướng dẫn khôi phục</h5>
                    <ol>
                        <li>Nhập địa chỉ email đã đăng ký tài khoản</li>
                        <li>Kiểm tra hộp thư email (bao gồm cả thư spam)</li>
                        <li>Nhấp vào liên kết khôi phục trong email</li>
                        <li>Tạo mật khẩu mới cho tài khoản</li>
                    </ol>
                </div>
            </div>

            <!-- Footer -->
            <div class="auth-footer">
                <div class="mb-3">
                    <a href="/login">
                        <i class="fas fa-arrow-left me-1"></i>Quay lại đăng nhập
                    </a>
                </div>
                <div>
                    Chưa có tài khoản? 
                    <a href="/register">
                        <i class="fas fa-user-plus me-1"></i>Đăng ký ngay
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    
    <script>
        // Form submit with loading state
        document.getElementById('forgotPasswordForm').addEventListener('submit', function() {
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.classList.add('btn-loading');
            submitBtn.disabled = true;
            
            // Update button text
            setTimeout(() => {
                if (!submitBtn.classList.contains('btn-loading')) return;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Đang gửi...';
            }, 100);
        });

        // Auto-hide alerts after 8 seconds (longer for important messages)
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

        // Email validation
        document.getElementById('email').addEventListener('input', function() {
            const email = this.value;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            
            if (email && !emailRegex.test(email)) {
                this.classList.add('is-invalid');
            } else {
                this.classList.remove('is-invalid');
            }
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

        .instructions-box ol {
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
    </style>
</body>
</html>