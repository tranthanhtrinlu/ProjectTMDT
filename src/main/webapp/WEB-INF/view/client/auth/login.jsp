<%@page contentType="text/html" pageEncoding="UTF-8" %>
<<<<<<< Updated upstream
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Login - KeyBoardShop</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Login</h3>
                                            </div>
                                            <div class="card-body">
                                                <form method="post" action="/login">
                                                    <c:if test="${param.error != null}">
                                                        <div class="my-2" style="color: red;">Invalid email or password.
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${param.logout != null}">
                                                        <div class="my-2" style="color: green;">Logout success.
                                                        </div>
                                                    </c:if>

                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="email"
                                                            placeholder="name@example.com" name="username" />
                                                        <label>Email address</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="password"
                                                            placeholder="Password" name="password" />
                                                        <label>Password</label>
                                                    </div>
                                                    <div>
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />

                                                    </div>

                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid">
                                                            <button class="btn btn-primary btn-block">
                                                                Login
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/register">Need an account? Sign up!</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>

                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Đăng nhập vào Keyboard Shop - Cửa hàng bàn phím chuyên nghiệp" />
    <meta name="author" content="Keyboard Shop" />
    <title>Đăng nhập - Keyboard Shop</title>
    
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
                <h1><i class="fas fa-keyboard me-2"></i>Đăng nhập</h1>
                <p>Chào mừng bạn quay trở lại!</p>
            </div>

            <!-- Body -->
            <div class="auth-body">
                <!-- Error & Success Messages -->
                <c:if test="${param.error != null}">
                    <div class="alert-modern alert-error">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        <c:choose>
                            <c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message.contains('not verified')}">
                                ${SPRING_SECURITY_LAST_EXCEPTION.message}
                            </c:when>
                            <c:otherwise>
                                Email hoặc mật khẩu không chính xác!
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:if>
                
                <c:if test="${param.logout != null}">
                    <div class="alert-modern alert-success">
                        <i class="fas fa-check-circle me-2"></i>
                        Đăng xuất thành công!
                    </div>
                </c:if>

                <!-- Login Form -->
                <form method="post" action="/login" id="loginForm">
                    <div class="form-group">
                        <div class="form-input-group">
                            <i class="fas fa-envelope"></i>
                            <input class="form-control-modern" 
                                   type="email" 
                                   name="username" 
                                   id="email"
                                   placeholder=" "
                                   required />
                            <label class="form-label" for="email">Địa chỉ email</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-input-group">
                            <i class="fas fa-lock"></i>
                            <input class="form-control-modern" 
                                   type="password" 
                                   name="password" 
                                   id="password"
                                   placeholder=" "
                                   required />
                            <label class="form-label" for="password">Mật khẩu</label>
                        </div>
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="rememberMe" name="remember-me">
                        <label class="form-check-label" for="rememberMe">
                            Ghi nhớ đăng nhập
                        </label>
                    </div>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                    <button type="submit" class="btn-auth-primary" id="loginBtn">
                        <i class="fas fa-sign-in-alt me-2"></i>Đăng nhập
                    </button>
                </form>

                <!-- Divider -->
                <div class="divider">
                    <span>Hoặc đăng nhập bằng</span>
                </div>

                <!-- Social Login -->
                <div class="social-auth">
                    <a href="/oauth2/authorization/google" class="btn-social" title="Đăng nhập với Google">
                        <img src="/client/img/provider/default-google.png" alt="Google">
                        <span>Google</span>
                    </a>
                    <a href="/oauth2/authorization/github" class="btn-social" title="Đăng nhập với Github">
                        <img src="/client/img/provider/default-github.png" alt="Github">
                        <span>Github</span>
                    </a>
                </div>
            </div>

            <!-- Footer -->
            <div class="auth-footer">
                <div class="mb-3">
                    <a href="/forgot-password">
                        <i class="fas fa-question-circle me-1"></i>Quên mật khẩu?
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
        document.getElementById('loginForm').addEventListener('submit', function() {
            const submitBtn = document.getElementById('loginBtn');
            submitBtn.classList.add('btn-loading');
            submitBtn.disabled = true;
        });

        // Auto-hide alerts after 5 seconds
        document.addEventListener('DOMContentLoaded', function() {
            const alerts = document.querySelectorAll('.alert-modern');
            alerts.forEach(alert => {
                setTimeout(() => {
                    alert.style.opacity = '0';
                    alert.style.transform = 'translateY(-10px)';
                    setTimeout(() => alert.remove(), 300);
                }, 5000);
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
    </script>
</body>
</html>
>>>>>>> Stashed changes
