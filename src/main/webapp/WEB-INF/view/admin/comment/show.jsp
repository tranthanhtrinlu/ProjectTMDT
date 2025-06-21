<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Admin - Comment Management" />
    <title>Manage Comments - Hoi Dan IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link href="/css/comment.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manage Comments</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Comment</li>
                </ol>

                <c:if test="${empty comments}">
                    <div class="alert alert-info">Không có bình luận nào.</div>
                </c:if>

                <c:forEach var="comment" items="${comments}">
                    <div class="card mb-3">
                        <div class="card-body">
                            <p><strong>Sản phẩm:</strong> <a href="/product/${comment.product.id}" target="_blank">${comment.product.name}</a></p>
                            <p><strong>Người dùng:</strong> ${comment.user.fullName}</p>
                            <p><strong>Nội dung:</strong> ${comment.content}</p>
                            <p><strong>Thời gian:</strong> <fmt:formatDate value="${comment.createdAt}" pattern="dd/MM/yyyy HH:mm" /></p>

                            <c:forEach var="reply" items="${comment.replies}">
                                <div class="ms-4 border-start ps-3 mt-2 bg-light p-2 rounded">
                                    <p><strong>Admin phản hồi:</strong> ${reply.content}</p>
                                    <p><fmt:formatDate value="${reply.createdAt}" pattern="dd/MM/yyyy HH:mm" /></p>
                                </div>
                            </c:forEach>

                            <form action="/admin/comment/reply/${comment.id}" method="post" class="mt-3">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="mb-2">
                                    <textarea name="replyContent" class="form-control" rows="2" placeholder="Nhập nội dung phản hồi..."></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm">Gửi phản hồi</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="/js/comment.js"></script>
</body>

</html>
