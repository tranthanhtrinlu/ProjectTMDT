<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>${product.name} - Keyboardshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">

    <meta name="_csrf" content="${_csrf.token}" />
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css" rel="stylesheet">
    <style>
        .star-rating input[type="radio"] { display: none; }
        .star-rating label { cursor: pointer; color: #ccc; font-size: 1.5em; }
        .star-rating input:checked ~ label, .star-rating label:hover, .star-rating label:hover ~ label { color: #f5c518; }
    </style>
</head>

<body>

<!-- Spinner Start -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->

<jsp:include page="../layout/header.jsp" />

<!-- Single Product Start -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="row g-4 mb-5">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chi Tiết Sản Phẩm</li>
                    </ol>
                </nav>
            </div>
            <div class="col-lg-8 col-xl-9">
                <div class="row g-4">
                    <div class="col-lg-6">
                        <div class="border rounded">
                            <a href="#">
                                <img src="/images/product/${product.image}" class="img-fluid rounded" alt="Image">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h4 class="fw-bold mb-3">${product.name}</h4>
                        <p class="mb-3">${product.factory}</p>
                        <h5 class="fw-bold mb-3">
                            <fmt:formatNumber type="number" value="${product.price}" /> đ
                        </h5>
                        <div class="d-flex mb-4">
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <p class="mb-4">${product.shortDesc}</p>

                        <div class="input-group quantity mb-5" style="width: 100px;">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control form-control-sm text-center border-0" value="1" data-cart-detail-index="0">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input class="form-control d-none" type="text" value="${product.id}" name="id" />
                        <input class="form-control d-none" type="text" name="quantity" id="cartDetails0.quantity" value="1" />
                        <button data-product-id="${product.id}" class="btnAddToCartDetail btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
                            <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                        </button>
                    </div>
                    <div class="col-lg-12">
                        <nav>
                            <div class="nav nav-tabs mb-3">
                                <button class="nav-link active border-white border-bottom-0" type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about" aria-controls="nav-about" aria-selected="true">Description</button>
                            </div>
                        </nav>
                        <div class="tab-content mb-5">
                            <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                <p>${product.detailDesc}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-xl-3">
                <div class="row g-4 fruite">
                    <div class="col-lg-12">
                        <div class="mb-4">
                            <h4>Categories</h4>
                            <ul class="list-unstyled fruite-categorie">
                                <li>
                                    <div class="d-flex justify-content-between fruite-name">
                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a>
                                        <span>(3)</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-flex justify-content-between fruite-name">
                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Ducky</a>
                                        <span>(5)</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-flex justify-content-between fruite-name">
                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Akko</a>
                                        <span>(2)</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-flex justify-content-between fruite-name">
                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Custom Build (Tự build)</a>
                                        <span>(8)</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-flex justify-content-between fruite-name">
                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Leopold</a>
                                        <span>(5)</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bình luận -->
        <div class="col-12">
            <h3>Bình luận</h3>
            <c:if test="${not empty pageContext.request.userPrincipal}">
                <form:form modelAttribute="comment" action="/product/${product.id}/comment" method="post" id="commentForm">
                    <form:errors path="content" cssClass="text-danger"/>
                    <div class="mb-3">
                        <form:textarea path="content" class="form-control" rows="4" placeholder="Nhập bình luận..." required="true"/>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary">Gửi bình luận</button>
                </form:form>
            </c:if>
            <div id="comments">
                <c:forEach var="comment" items="${comments}">
                    <div class="card mb-2">
                        <div class="card-body">
                            <p><strong>${comment.user.fullName}</strong> (${comment.formattedCreatedAt}): ${comment.content}</p>

                            <c:forEach var="reply" items="${comment.replies}">
                                <div class="ms-4 mt-2 p-2 bg-light border-start border-3 border-primary rounded">
                                    <p><strong>Admin phản hồi:</strong> ${reply.content}</p>
                                    <p class="mb-0"><fmt:formatDate value="${reply.createdAt}" pattern="dd/MM/yyyy HH:mm"/></p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

        <!-- Đánh giá -->
        <div class="col-12 mt-4">
            <h3>Đánh giá</h3>
            <c:if test="${canReview}">
                <form:form modelAttribute="review" action="/product/${product.id}/review" method="post">
                <form:errors path="rating" cssClass="text-danger"/>
                <form:errors path="comment" cssClass="text-danger"/>
                <div class="mb-3 star-rating">
                    <form:radiobutton path="rating" value="5" id="star5"/><label for="star5">★</label>
                    <form:radiobutton path="rating" value="4" id="star4"/><label for="star4">★</label>
                    <form:radiobutton path="rating" value="3" id="star3"/><label for="star3">★</label>
                    <form:radiobutton path="rating" value="2" id="star2"/><label for="star2">★</label>
                    <form:radiobutton path="rating" value="1" id="star1"/><label for="star1">★</label>
                </div>
                <div class="mb-3">
                    <form:textarea path="comment" class="form-control" rows="4" placeholder="Nhập đánh giá..." required="true"/>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary">Gửi đánh giá</button>
                </form:form>
            </c:if>
            <div id="reviews">
                <c:forEach var="review" items="${reviews}">
                    <div class="card mb-2">
                        <div class="card-body">
                            <p><strong>${review.user.fullName}</strong> (${review.formattedCreatedAt}): ${review.rating} sao - ${review.comment}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- Single Product End -->

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
        $("#commentForm").submit(function(e) {
            e.preventDefault();
            $.ajax({
                url: $(this).attr("action"),
                type: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    $("#comments").prepend(
                        '<div class="card mb-2"><div class="card-body"><p><strong>' +
                        response.user.fullName + '</strong> (' + new Date().toLocaleString("vi-VN") + '): ' +
                        response.content + '</p></div></div>'
                    );
                    $("#commentForm")[0].reset();
                    $.toast({
                        heading: 'Thành công',
                        text: 'Bình luận của bạn đã được gửi.',
                        showHideTransition: 'fade',
                        icon: 'success'
                    });
                },
                error: function(xhr) {
                    $.toast({
                        heading: 'Lỗi',
                        text: 'Có lỗi xảy ra khi gửi bình luận.',
                        showHideTransition: 'fade',
                        icon: 'error'
                    });
                }
            });
        });
    });
</script>
</body>

</html>