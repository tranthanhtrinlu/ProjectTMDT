<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Tùy chỉnh bàn phím - Keyboardshop</title>
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
    
    <!-- Meta CSRF -->
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
    
    <!-- jQuery Toast CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css" rel="stylesheet">
    
    <style>
        .custom-step {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            border-left: 4px solid #ffc107;
        }
        .product-option {
            border: 2px solid #e9ecef;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .product-option:hover {
            border-color: #ffc107;
            background-color: #fff8e1;
        }
        .product-option.selected {
            border-color: #ffc107;
            background-color: #fff8e1;
        }
        .service-option {
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 10px;
        }
        .price-summary {
            position: sticky;
            top: 20px;
        }
        .progress-step {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .step {
            flex: 1;
            text-align: center;
            padding: 10px;
            border-bottom: 3px solid #e9ecef;
            position: relative;
        }
        .step.active {
            border-bottom-color: #ffc107;
            color: #ffc107;
        }
        .step.completed {
            border-bottom-color: #28a745;
            color: #28a745;
        }
    </style>
</head>

<body>
    <jsp:include page="../layout/header.jsp" />

    <!-- Custom Page Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="mb-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/cart">Giỏ hàng</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tùy chỉnh bàn phím</li>
                    </ol>
                </nav>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <h2 class="mb-4">Tùy chỉnh bàn phím: ${baseKeyboard.name}</h2>
                    
                    <!-- Progress Steps -->
                    <div class="progress-step">
                        <div class="step active" data-step="1">
                            <i class="fas fa-keyboard"></i><br>
                            <small>Bàn phím gốc</small>
                        </div>
                        <div class="step" data-step="2">
                            <i class="fas fa-th"></i><br>
                            <small>Keycap</small>
                        </div>
                        <div class="step" data-step="3">
                            <i class="fas fa-toggle-on"></i><br>
                            <small>Switch</small>
                        </div>
                        <div class="step" data-step="4">
                            <i class="fas fa-toolbox"></i><br>
                            <small>Kit & Dịch vụ</small>
                        </div>
                        <div class="step" data-step="5">
                            <i class="fas fa-eye"></i><br>
                            <small>Xem trước</small>
                        </div>
                    </div>

                    <!-- Step 1: Base Keyboard -->
                    <div class="custom-step" id="step1">
                        <h4><i class="fas fa-keyboard text-warning"></i> Bàn phím gốc</h4>
                        <div class="row">
                            <div class="col-md-4">
                                <img src="/images/product/${baseKeyboard.image}" class="img-fluid rounded" alt="${baseKeyboard.name}">
                            </div>
                            <div class="col-md-8">
                                <h5>${baseKeyboard.name}</h5>
                                <p class="text-muted">${baseKeyboard.shortDesc}</p>
                                <h6 class="text-primary">
                                    <fmt:formatNumber type="number" value="${baseKeyboard.price}" /> đ
                                </h6>
                            </div>
                        </div>
                    </div>

                    <!-- Step 2: Keycap Selection -->
                    <div class="custom-step" id="step2">
                        <h4><i class="fas fa-th text-warning"></i> Chọn Keycap</h4>
                        <div class="row">
                            <div class="col-12">
                                <div class="product-option" data-type="keycap" data-id="0">
                                    <div class="d-flex align-items-center">
                                        <input type="radio" name="keycap" value="0" checked>
                                        <div class="ms-3">
                                            <h6 class="mb-1">Giữ nguyên keycap gốc</h6>
                                            <p class="text-muted mb-0">Sử dụng keycap có sẵn của bàn phím</p>
                                            <small class="text-success">Miễn phí</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <c:forEach var="keycap" items="${keycaps}">
                                    <div class="product-option" data-type="keycap" data-id="${keycap.id}" data-price="${keycap.price}">
                                        <div class="row align-items-center">
                                            <div class="col-md-2">
                                                <input type="radio" name="keycap" value="${keycap.id}">
                                            </div>
                                            <div class="col-md-3">
                                                <img src="/images/product/${keycap.image}" class="img-fluid rounded" alt="${keycap.name}">
                                            </div>
                                            <div class="col-md-7">
                                                <h6 class="mb-1">${keycap.name}</h6>
                                                <p class="text-muted mb-1">${keycap.shortDesc}</p>
                                                <h6 class="text-primary">+ <fmt:formatNumber type="number" value="${keycap.price}" /> đ</h6>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <!-- Step 3: Switch Selection -->
                    <div class="custom-step" id="step3">
                        <h4><i class="fas fa-toggle-on text-warning"></i> Chọn Switch</h4>
                        <div class="row">
                            <div class="col-12">
                                <div class="product-option" data-type="switch" data-id="original">
                                    <div class="d-flex align-items-center">
                                        <input type="radio" name="switch" value="" checked>
                                        <div class="ms-3">
                                            <h6 class="mb-1">Giữ nguyên switch gốc</h6>
                                            <p class="text-muted mb-0">Sử dụng switch có sẵn của bàn phím</p>
                                            <small class="text-success">Miễn phí</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="product-option" data-type="switch" data-id="red">
                                    <div class="d-flex align-items-center">
                                        <input type="radio" name="switch" value="Red Linear">
                                        <div class="ms-3">
                                            <h6 class="mb-1">Red Linear Switch</h6>
                                            <p class="text-muted mb-0">Cảm giác gõ mượt mà, không có tiếng click</p>
                                            <small class="text-success">Miễn phí</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="product-option" data-type="switch" data-id="blue">
                                    <div class="d-flex align-items-center">
                                        <input type="radio" name="switch" value="Blue Clicky">
                                        <div class="ms-3">
                                            <h6 class="mb-1">Blue Clicky Switch</h6>
                                            <p class="text-muted mb-0">Có tiếng click rõ ràng, phản hồi tốt</p>
                                            <small class="text-success">Miễn phí</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="product-option" data-type="switch" data-id="brown">
                                    <div class="d-flex align-items-center">
                                        <input type="radio" name="switch" value="Brown Tactile">
                                        <div class="ms-3">
                                            <h6 class="mb-1">Brown Tactile Switch</h6>
                                            <p class="text-muted mb-0">Cảm giác tactile nhẹ, không quá ồn</p>
                                            <small class="text-success">Miễn phí</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 4: Kit & Services -->
                    <div class="custom-step" id="step4">
                        <h4><i class="fas fa-toolbox text-warning"></i> Kit bổ sung & Dịch vụ</h4>
                        
                        <!-- Kit Selection -->
                        <h5>Kit bổ sung</h5>
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="product-option" data-type="kit" data-id="0">
                                    <div class="d-flex align-items-center">
                                        <input type="radio" name="kit" value="0" checked>
                                        <div class="ms-3">
                                            <h6 class="mb-1">Không cần kit bổ sung</h6>
                                            <small class="text-success">Miễn phí</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <c:forEach var="kit" items="${kits}">
                                    <div class="product-option" data-type="kit" data-id="${kit.id}" data-price="${kit.price}">
                                        <div class="row align-items-center">
                                            <div class="col-md-2">
                                                <input type="radio" name="kit" value="${kit.id}">
                                            </div>
                                            <div class="col-md-3">
                                                <img src="/images/product/${kit.image}" class="img-fluid rounded" alt="${kit.name}">
                                            </div>
                                            <div class="col-md-7">
                                                <h6 class="mb-1">${kit.name}</h6>
                                                <p class="text-muted mb-1">${kit.shortDesc}</p>
                                                <h6 class="text-primary">+ <fmt:formatNumber type="number" value="${kit.price}" /> đ</h6>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        
                        <!-- Services -->
                        <h5>Dịch vụ tùy chỉnh</h5>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="service-option">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="services" value="lubing" id="lubing">
                                        <label class="form-check-label" for="lubing">
                                            <h6>Lubing Switch Service</h6>
                                            <p class="text-muted mb-1">Bôi trơn switch để cảm giác gõ mượt mà hơn</p>
                                            <small class="text-primary">+ <fmt:formatNumber type="number" value="${lubingPrice}" /> đ</small>
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="service-option">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="services" value="stabilizer" id="stabilizer">
                                        <label class="form-check-label" for="stabilizer">
                                            <h6>Stabilizer Tuning</h6>
                                            <p class="text-muted mb-1">Điều chỉnh stabilizer cho phím space, enter, shift</p>
                                            <small class="text-primary">+ <fmt:formatNumber type="number" value="${stabilizerPrice}" /> đ</small>
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="service-option">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="services" value="keycap_custom" id="keycap_custom">
                                        <label class="form-check-label" for="keycap_custom">
                                            <h6>Keycap Customization</h6>
                                            <p class="text-muted mb-1">In logo hoặc text tùy chỉnh lên keycap</p>
                                            <small class="text-primary">+ <fmt:formatNumber type="number" value="${keycapCustomPrice}" /> đ</small>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="service-option">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="services" value="cable" id="cable">
                                        <label class="form-check-label" for="cable">
                                            <h6>Cable Customization</h6>
                                            <p class="text-muted mb-1">Dây cáp tùy chỉnh màu sắc và độ dài</p>
                                            <small class="text-primary">+ <fmt:formatNumber type="number" value="${cablePrice}" /> đ</small>
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="service-option">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="services" value="case" id="case">
                                        <label class="form-check-label" for="case">
                                            <h6>Case Modding</h6>
                                            <p class="text-muted mb-1">Chỉnh sửa case: foam, plate, gasket</p>
                                            <small class="text-primary">+ <fmt:formatNumber type="number" value="${casePrice}" /> đ</small>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Custom Notes -->
                        <div class="mt-4">
                            <h6>Ghi chú tùy chỉnh</h6>
                            <textarea class="form-control" name="customNotes" rows="3" 
                                    placeholder="Nhập yêu cầu đặc biệt hoặc ghi chú cho đơn hàng custom..."></textarea>
                        </div>
                    </div>
                </div>

                <!-- Price Summary -->
                <div class="col-lg-4">
                    <div class="bg-light rounded p-4 price-summary">
                        <h4 class="mb-4">Tóm tắt đơn hàng</h4>
                        
                        <div class="d-flex justify-content-between mb-2">
                            <span>Bàn phím gốc:</span>
                            <span><fmt:formatNumber type="number" value="${baseKeyboard.price}" /> đ</span>
                        </div>
                        
                        <div class="d-flex justify-content-between mb-2 keycap-price" style="display: none !important;">
                            <span>Keycap:</span>
                            <span>0 đ</span>
                        </div>
                        
                        <div class="d-flex justify-content-between mb-2 kit-price" style="display: none !important;">
                            <span>Kit:</span>
                            <span>0 đ</span>
                        </div>
                        
                        <div class="d-flex justify-content-between mb-2 service-prices">
                        </div>
                        
                        <hr>
                        <div class="d-flex justify-content-between mb-3">
                            <h5>Tổng cộng:</h5>
                            <h5 class="text-primary total-price">
                                <fmt:formatNumber type="number" value="${baseKeyboard.price}" /> đ
                            </h5>
                        </div>
                        
                        <a href="/custom/preview/${customOrder.id}" class="btn btn-primary w-100 mb-2" id="previewBtn">
                            Xem trước & Xác nhận
                        </a>
                        <a href="/cart" class="btn btn-outline-secondary w-100">
                            Quay lại giỏ hàng
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Custom Page End -->

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
    
    <!-- jQuery Toast JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
    
    <!-- Custom Order Data -->
    <script>
        window.customOrderData = {
            id: ${customOrder.id},
            basePrice: ${baseKeyboard.price},
            servicePrices: {
                lubing: ${lubingPrice},
                stabilizer: ${stabilizerPrice},
                keycap_custom: ${keycapCustomPrice},
                cable: ${cablePrice},
                case: ${casePrice}
            },
            selectedKeycapId: ${customOrder.selectedKeycap != null ? customOrder.selectedKeycap.id : 'null'},
            selectedSwitchType: '${customOrder.selectedSwitchType != null ? customOrder.selectedSwitchType : ""}',
            selectedKitId: ${customOrder.selectedKit != null ? customOrder.selectedKit.id : 'null'},
            lubingService: ${customOrder.lubingService},
            stabilizerTuning: ${customOrder.stabilizerTuning},
            keycapCustomization: ${customOrder.keycapCustomization},
            cableCustomization: ${customOrder.cableCustomization},
            caseModding: ${customOrder.caseModding},
            customNotes: '${customOrder.customNotes != null ? customOrder.customNotes : ""}'
        };
    </script>
    
    <!-- Custom Keyboard JS -->
    <script src="/js/custom-keyboard.js"></script>
</body>

</html> 