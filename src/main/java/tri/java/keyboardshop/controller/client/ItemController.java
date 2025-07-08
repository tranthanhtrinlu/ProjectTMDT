package tri.java.keyboardshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
<<<<<<< Updated upstream
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import tri.java.keyboardshop.domain.Cart;
import tri.java.keyboardshop.domain.CartDetail;
import tri.java.keyboardshop.domain.Product;
import tri.java.keyboardshop.domain.Product_;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.domain.dto.ProductCriteriaDTO;
import tri.java.keyboardshop.service.ProductService;
=======
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tri.java.keyboardshop.domain.*;
import tri.java.keyboardshop.domain.dto.ProductCriteriaDTO;
import tri.java.keyboardshop.service.*;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
>>>>>>> Stashed changes

@Controller
public class ItemController {

    private final ProductService productService;
<<<<<<< Updated upstream

    public ItemController(ProductService productService) {
        this.productService = productService;
=======
    private final VNPayService vNPayService;
    private final CommentService commentService;
    private final ReviewService reviewService;
    private final WishlistService wishlistService;

    public ItemController(
            ProductService productService,
            VNPayService vNPayService,
            CommentService commentService,
            ReviewService reviewService,
            WishlistService wishlistService) {
        this.productService = productService;
        this.vNPayService = vNPayService;
        this.commentService = commentService;
        this.reviewService = reviewService;
        this.wishlistService = wishlistService;
>>>>>>> Stashed changes
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
<<<<<<< Updated upstream
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, productId, session, 1);

=======
        model.addAttribute("comments", commentService.getCommentsByProduct(id));
        model.addAttribute("reviews", reviewService.getReviewsByProduct(id));
        model.addAttribute("comment", new Comment());
        model.addAttribute("review", new Review());

        // Thêm thông tin đánh giá chi tiết với safe defaults
        try {
            model.addAttribute("averageRating", reviewService.getAverageRating(id));
            model.addAttribute("totalReviews", reviewService.getTotalReviews(id));
            model.addAttribute("ratingStats", reviewService.getRatingStatistics(id));
            model.addAttribute("ratingPercentages", reviewService.getRatingPercentages(id));
        } catch (Exception e) {
            // Safe defaults if review service fails
            model.addAttribute("averageRating", 0.0);
            model.addAttribute("totalReviews", 0L);
            model.addAttribute("ratingStats", new java.util.HashMap<>());
            model.addAttribute("ratingPercentages", new java.util.HashMap<>());
        }

        if (userDetails != null) {
            model.addAttribute("canReview", reviewService.canUserReview(userDetails.getUser().getId(), id));
        } else {
            model.addAttribute("canReview", false);
        }

        return "client/product/detail";
    }

    @PostMapping("/product/{id}/comment")
    public String addComment(@PathVariable("id") Long id,
                             @Valid @ModelAttribute("comment") Comment comment,
                             BindingResult result,
                             @AuthenticationPrincipal CustomUserDetails userDetails,
                             Model model) {
        Product product = productService.fetchProductById(id)
                .orElseThrow(() -> new IllegalArgumentException("Sản phẩm không tồn tại"));

        if (result.hasErrors()) {
            model.addAttribute("product", product);
            model.addAttribute("comments", commentService.getCommentsByProduct(id));
            model.addAttribute("reviews", reviewService.getReviewsByProduct(id));
            model.addAttribute("canReview", userDetails != null && reviewService.canUserReview(userDetails.getUser().getId(), id));
            return "client/product/detail";
        }

        commentService.saveComment(comment, userDetails.getUser(), product);
        return "redirect:/product/" + id;
    }

    @PostMapping("/product/{id}/comment-ajax")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addCommentAjax(@PathVariable("id") Long id,
                                                             @RequestParam("content") String content,
                                                             @AuthenticationPrincipal CustomUserDetails userDetails) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            if (userDetails == null) {
                response.put("success", false);
                response.put("message", "Bạn cần đăng nhập để bình luận");
                return ResponseEntity.badRequest().body(response);
            }
            
            if (content == null || content.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "Nội dung bình luận không được để trống");
                return ResponseEntity.badRequest().body(response);
            }
            
            Product product = productService.fetchProductById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Sản phẩm không tồn tại"));
            
            Comment comment = new Comment();
            comment.setContent(content.trim());
            comment.setUser(userDetails.getUser());
            comment.setProduct(product);
            
            Comment savedComment = commentService.saveComment(comment, userDetails.getUser(), product);
            
            // Trả về thông tin comment đã lưu
            Map<String, Object> commentData = new HashMap<>();
            commentData.put("id", savedComment.getId());
            commentData.put("content", savedComment.getContent());
            commentData.put("createdAt", savedComment.getCreatedAt());
            
            Map<String, Object> userData = new HashMap<>();
            userData.put("id", userDetails.getUser().getId());
            userData.put("fullName", userDetails.getUser().getFullName() != null ? userDetails.getUser().getFullName() : "Người dùng");
            userData.put("email", userDetails.getUser().getEmail());
            userData.put("avatar", userDetails.getUser().getAvatar());
            
            commentData.put("user", userData);
            
            response.put("success", true);
            response.put("message", "Bình luận đã được gửi thành công");
            response.put("comment", commentData);
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

    @PostMapping("/product/{id}/review")
    public String addReview(@PathVariable("id") Long id, @Valid @ModelAttribute("review") Review review,
                            BindingResult result, @AuthenticationPrincipal CustomUserDetails userDetails, 
                            Model model, RedirectAttributes redirectAttributes) {

        try {
            if (result.hasErrors()) {
                Product product = this.productService.fetchProductById(id)
                        .orElseThrow(() -> new IllegalArgumentException("Sản phẩm không tồn tại"));
                model.addAttribute("product", product);
                model.addAttribute("comments", commentService.getCommentsByProduct(id));
                model.addAttribute("reviews", reviewService.getReviewsByProduct(id));
                model.addAttribute("canReview", userDetails != null && reviewService.canUserReview(userDetails.getUser().getId(), id));
                return "client/product/detail";
            }

            Product product = this.productService.fetchProductById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Sản phẩm không tồn tại"));
            
            reviewService.saveReview(review, userDetails.getUser(), product);
            redirectAttributes.addFlashAttribute("successMessage", "Đánh giá của bạn đã được gửi thành công!");
            
        } catch (IllegalStateException e) {
            // Xử lý trường hợp user đã đánh giá rồi
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        } catch (IllegalArgumentException e) {
            // Xử lý trường hợp sản phẩm không tồn tại
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        } catch (Exception e) {
            // Xử lý các lỗi khác
            redirectAttributes.addFlashAttribute("errorMessage", "Có lỗi xảy ra khi gửi đánh giá: " + e.getMessage());
        }
        
        return "redirect:/product/" + id;
    }
    @GetMapping("/product/{id}/review")
    public String getReviewForm(@PathVariable("id") Long id,
                                @AuthenticationPrincipal CustomUserDetails userDetails,
                                Model model) {
        Product product = this.productService.fetchProductById(id)
                .orElseThrow(() -> new IllegalArgumentException("Sản phẩm không tồn tại"));

        model.addAttribute("product", product);
        model.addAttribute("review", new Review());
        return "client/product/review"; // file JSP là review.jsp
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        try {
            HttpSession session = request.getSession(false);
            long productId = id;
            String email = (String) session.getAttribute("email");
            this.productService.handleAddProductToCart(email, productId, session, 1);
            redirectAttributes.addFlashAttribute("successMessage", "Sản phẩm đã được thêm vào giỏ hàng!");
        } catch (IllegalStateException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng!");
        }
>>>>>>> Stashed changes
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
<<<<<<< Updated upstream
            @RequestParam("receiverPhone") String receiverPhone) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);

        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getThankYouPage(Model model) {

=======
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("totalPrice") String totalPrice,
            RedirectAttributes redirectAttributes) {
        
        System.out.println("=== BẮT ĐẦU XỬ LÝ ĐẶT HÀNG ===");
        System.out.println("Receiver Name: " + receiverName);
        System.out.println("Receiver Address: " + receiverAddress);
        System.out.println("Receiver Phone: " + receiverPhone);
        System.out.println("Payment Method: " + paymentMethod);
        System.out.println("Total Price: " + totalPrice);
        
        try {
            // Validate input parameters
            if (receiverName == null || receiverName.trim().isEmpty()) {
                throw new IllegalArgumentException("Tên người nhận không được để trống");
            }
            if (receiverAddress == null || receiverAddress.trim().isEmpty()) {
                throw new IllegalArgumentException("Địa chỉ không được để trống");
            }
            if (receiverPhone == null || receiverPhone.trim().isEmpty()) {
                throw new IllegalArgumentException("Số điện thoại không được để trống");
            }
            if (paymentMethod == null || paymentMethod.trim().isEmpty()) {
                throw new IllegalArgumentException("Phương thức thanh toán không được để trống");
            }
            
            // Validate and parse total price
            double totalPriceValue;
            try {
                totalPriceValue = Double.parseDouble(totalPrice);
                if (totalPriceValue <= 0) {
                    throw new IllegalArgumentException("Tổng tiền phải lớn hơn 0");
                }
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Tổng tiền không hợp lệ");
            }

            User currentUser = new User();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("id") == null) {
                throw new IllegalStateException("Phiên đăng nhập đã hết hạn");
            }
            
            long id = (long) session.getAttribute("id");
            currentUser.setId(id);
            System.out.println("User ID: " + id);

            final String uuid = UUID.randomUUID().toString().replace("-", "");
            System.out.println("Payment UUID: " + uuid);
            
            System.out.println("Gọi ProductService.handlePlaceOrder...");
            this.productService.handlePlaceOrder(currentUser, session,
                    receiverName.trim(), receiverAddress.trim(), receiverPhone.trim(),
                    paymentMethod.trim(), uuid);
            System.out.println("ProductService.handlePlaceOrder thành công!");

            // Handle VNPay payment
            if (!paymentMethod.equals("COD")) {
                try {
                    System.out.println("Xử lý thanh toán VNPay...");
                    String ip = this.vNPayService.getIpAddress(request);
                    String vnpUrl = this.vNPayService.generateVNPayURL(totalPriceValue, uuid, ip);
                    System.out.println("VNPay URL: " + vnpUrl);
                    return "redirect:" + vnpUrl;
                } catch (Exception e) {
                    // If VNPay fails, we need to rollback the order
                    // For now, just show error message
                    throw new RuntimeException("Lỗi kết nối VNPay: " + e.getMessage());
                }
            }
            System.out.println("=== HOÀN THÀNH ĐẶT HÀNG ===");
            return "redirect:/thanks";
        } catch (IllegalStateException e) {
            System.err.println("IllegalStateException: " + e.getMessage());
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/checkout";
        } catch (IllegalArgumentException e) {
            System.err.println("IllegalArgumentException: " + e.getMessage());
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/checkout";
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "Có lỗi xảy ra khi đặt hàng: " + e.getMessage());
            return "redirect:/checkout";
        }
    }

    @GetMapping("/thanks")
    public String getThankYouPage(
            Model model,
            HttpServletRequest request,
            @RequestParam("vnp_ResponseCode") Optional<String> vnpayResponseCode,
            @RequestParam("vnp_TxnRef") Optional<String> paymentRef,
            @RequestParam("vnp_SecureHash") Optional<String> vnpSecureHash) {

        System.out.println("=== VNPAY CALLBACK RECEIVED ===");
        System.out.println("Response Code: " + vnpayResponseCode.orElse("N/A"));
        System.out.println("Transaction Ref: " + paymentRef.orElse("N/A"));
        System.out.println("Secure Hash: " + vnpSecureHash.orElse("N/A"));

        HttpSession session = request.getSession();
        Boolean isCustomOrder = (Boolean) session.getAttribute("isCustomOrder");
        
        if (isCustomOrder != null && isCustomOrder) {
            // This is a custom order payment, redirect to custom thanks page
            return "redirect:/custom/thanks" + 
                   (vnpayResponseCode.isPresent() ? "?vnp_ResponseCode=" + vnpayResponseCode.get() : "") +
                   (paymentRef.isPresent() ? "&vnp_TxnRef=" + paymentRef.get() : "") +
                   (vnpSecureHash.isPresent() ? "&vnp_SecureHash=" + vnpSecureHash.get() : "");
        }

        if (vnpayResponseCode.isPresent() && paymentRef.isPresent()) {
            try {
                // Validate VNPay response signature
                Map<String, String> params = new HashMap<>();
                request.getParameterMap().forEach((key, values) -> {
                    if (values.length > 0) {
                        params.put(key, values[0]);
                    }
                });
                
                boolean isValidSignature = vNPayService.validateSignature(params, vnpSecureHash.orElse(""));
                
                if (!isValidSignature) {
                    System.err.println("VNPay signature validation failed!");
                    model.addAttribute("paymentStatus", "PAYMENT_FAILED");
                    model.addAttribute("paymentMessage", "Chữ ký VNPay không hợp lệ. Giao dịch có thể bị giả mạo.");
                    return "client/cart/thanks";
                }

                String responseCode = vnpayResponseCode.get();
                String paymentStatus;
                String paymentMessage;
                
                if ("00".equals(responseCode)) {
                    paymentStatus = "PAYMENT_SUCCEED";
                    paymentMessage = "Thanh toán thành công! Đơn hàng của bạn đã được xác nhận.";
                    System.out.println("VNPay payment successful for transaction: " + paymentRef.get());
                } else {
                    paymentStatus = "PAYMENT_FAILED";
                    paymentMessage = "Thanh toán thất bại. Mã lỗi: " + responseCode;
                    System.err.println("VNPay payment failed for transaction: " + paymentRef.get() + " with code: " + responseCode);
                }
                
                // Cập nhật trạng thái đơn hàng
                this.productService.updatePaymentStatus(paymentRef.get(), paymentStatus);
                
                // Thêm thông tin vào model
                model.addAttribute("paymentStatus", paymentStatus);
                model.addAttribute("paymentMessage", paymentMessage);
                model.addAttribute("transactionRef", paymentRef.get());
                
            } catch (Exception e) {
                System.err.println("Error processing VNPay callback: " + e.getMessage());
                e.printStackTrace();
                model.addAttribute("paymentStatus", "PAYMENT_FAILED");
                model.addAttribute("paymentMessage", "Có lỗi xảy ra khi xử lý thanh toán: " + e.getMessage());
            }
        } else {
            // Không có tham số VNPay - có thể là COD hoặc truy cập trực tiếp
            model.addAttribute("paymentStatus", "PAYMENT_SUCCEED");
            model.addAttribute("paymentMessage", "Đơn hàng đã được đặt thành công!");
        }
        
>>>>>>> Stashed changes
        return "client/cart/thanks";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
<<<<<<< Updated upstream
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);
=======
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        try {
            HttpSession session = request.getSession(false);
            String email = (String) session.getAttribute("email");
            this.productService.handleAddProductToCart(email, id, session, quantity);
            redirectAttributes.addFlashAttribute("successMessage", "Sản phẩm đã được thêm vào giỏ hàng!");
        } catch (IllegalStateException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng!");
        }
>>>>>>> Stashed changes
        return "redirect:/product/" + id;
    }

    @GetMapping("/products")
    public String getProductPage(Model model,
<<<<<<< Updated upstream
            ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request) {
=======
                                 ProductCriteriaDTO productCriteriaDTO,
                                 @RequestParam(value = "type", required = false) String type,
                                 @RequestParam(value = "factories", required = false) String factories,
                                 @RequestParam(value = "targets", required = false) String targets,
                                 @RequestParam(value = "priceMin", required = false) String priceMin,
                                 @RequestParam(value = "priceMax", required = false) String priceMax,
                                 HttpServletRequest request) {
        
        // Debug logging
        System.out.println("=== DEBUG PRODUCT FILTER ===");
        System.out.println("ProductCriteriaDTO: " + productCriteriaDTO);
        System.out.println("Factory: " + productCriteriaDTO.getFactory());
        System.out.println("Target: " + productCriteriaDTO.getTarget());
        System.out.println("Type: " + type);
        System.out.println("Factories param: " + factories);
        System.out.println("Targets param: " + targets);
        System.out.println("PriceMin: " + priceMin);
        System.out.println("PriceMax: " + priceMax);
        System.out.println("Query String: " + request.getQueryString());
        
>>>>>>> Stashed changes
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                // convert from String to int
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }

<<<<<<< Updated upstream
        // check sort price
        Pageable pageable = PageRequest.of(page - 1, 10);

=======
        // Xử lý parameter factories từ URL
        if (factories != null && !factories.trim().isEmpty()) {
            List<String> factoryList = List.of(factories.split(","));
            productCriteriaDTO.setFactory(Optional.of(factoryList));
        }

        // Xử lý parameter targets từ URL
        if (targets != null && !targets.trim().isEmpty()) {
            List<String> targetList = List.of(targets.split(","));
            productCriteriaDTO.setTarget(Optional.of(targetList));
        }

        // Xử lý parameter type từ URL
        if (type != null && !type.trim().isEmpty()) {
            List<String> typeList = List.of(type.trim());
            productCriteriaDTO.setType(Optional.of(typeList));
        }

        // Xử lý parameter price từ URL
        if ((priceMin != null && !priceMin.trim().isEmpty()) || (priceMax != null && !priceMax.trim().isEmpty())) {
            try {
                double min = 0;
                double max = Double.MAX_VALUE;
                
                if (priceMin != null && !priceMin.trim().isEmpty()) {
                    min = Double.parseDouble(priceMin.trim());
                }
                if (priceMax != null && !priceMax.trim().isEmpty()) {
                    max = Double.parseDouble(priceMax.trim());
                }
                
                List<String> priceList = List.of("custom-" + min + "-" + max);
                productCriteriaDTO.setPrice(Optional.of(priceList));
            } catch (NumberFormatException e) {
                // Ignore invalid price parameters
            }
        }

        Pageable pageable = PageRequest.of(page - 1, 12);
>>>>>>> Stashed changes
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 12, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 12, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);
<<<<<<< Updated upstream

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent()
                : new ArrayList<Product>();
=======
        List<Product> products = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();
        
        // Thêm thông tin rating cho mỗi sản phẩm
        this.productService.enrichProductsWithRating(products);
>>>>>>> Stashed changes

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);
        return "client/product/show";
    }
<<<<<<< Updated upstream

}
=======
    
    @PostMapping("/wishlist/toggle/{productId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> toggleWishlist(@PathVariable Long productId,
                                                             @AuthenticationPrincipal CustomUserDetails userDetails) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            if (userDetails == null) {
                response.put("success", false);
                response.put("message", "Bạn cần đăng nhập để thực hiện chức năng này");
                return ResponseEntity.badRequest().body(response);
            }
            
            Product product = productService.fetchProductById(productId)
                    .orElseThrow(() -> new IllegalArgumentException("Sản phẩm không tồn tại"));
            
            boolean wasInWishlist = wishlistService.isInWishlist(userDetails.getUser(), product);
            wishlistService.toggleWishlist(userDetails.getUser(), product);
            boolean isNowInWishlist = wishlistService.isInWishlist(userDetails.getUser(), product);
            
            response.put("success", true);
            response.put("inWishlist", isNowInWishlist);
            response.put("message", isNowInWishlist ? "Đã thêm vào danh sách yêu thích!" : "Đã xóa khỏi danh sách yêu thích!");
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @GetMapping("/wishlist")
    public String getWishlistPage(Model model, @AuthenticationPrincipal CustomUserDetails userDetails) {
        if (userDetails == null) {
            return "redirect:/login";
        }
        
        List<Wishlist> wishlistItems = wishlistService.getUserWishlist(userDetails.getUser());
        List<Product> wishlistProducts = wishlistItems.stream()
                .map(Wishlist::getProduct)
                .toList();
        
        // Thêm thông tin rating cho mỗi sản phẩm
        productService.enrichProductsWithRating(wishlistProducts);
        
        model.addAttribute("wishlistProducts", wishlistProducts);
        model.addAttribute("wishlistCount", wishlistItems.size());
        
        return "client/wishlist/show";
    }
    
    @PostMapping("/wishlist/remove/{productId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> removeFromWishlist(@PathVariable Long productId,
                                                                 @AuthenticationPrincipal CustomUserDetails userDetails) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            if (userDetails == null) {
                response.put("success", false);
                response.put("message", "Bạn cần đăng nhập để thực hiện chức năng này");
                return ResponseEntity.badRequest().body(response);
            }
            
            Product product = productService.fetchProductById(productId)
                    .orElseThrow(() -> new IllegalArgumentException("Sản phẩm không tồn tại"));
            
            wishlistService.removeFromWishlist(userDetails.getUser(), product);
            
            response.put("success", true);
            response.put("message", "Đã xóa khỏi danh sách yêu thích!");
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
}
>>>>>>> Stashed changes
