<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Reset Password - Keyboardshop</title>
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
                                <h3 class="text-center font-weight-light my-4">Reset Password</h3>
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                                </c:if>
                                <c:if test="${not empty message}">
                                    <div class="alert alert-success">${message}</div>
                                </c:if>
                                <form method="post" action="/verify-forgot-password">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="email" name="email" value="${email}" placeholder="name@example.com" required readonly />
                                        <label>Email address</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="text" name="verificationCode" value="${verificationCode}" placeholder="Verification Code" required />
                                        <label>Verification Code</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="password" name="newPassword" placeholder="New Password" required />
                                        <label>New Password</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="password" name="confirmPassword" placeholder="Confirm Password" required />
                                        <label>Confirm Password</label>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <button class="btn btn-primary btn-block">Reset Password</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="/login">Back to Login</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>
</html>