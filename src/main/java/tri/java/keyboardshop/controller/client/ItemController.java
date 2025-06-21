package tri.java.keyboardshop.controller.client;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import tri.java.keyboardshop.domain.*;
import tri.java.keyboardshop.domain.dto.ProductCriteriaDTO;
import tri.java.keyboardshop.service.*;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
public class ItemController {

    private final ProductService productService;
    private final VNPayService vNPayService;
    private final CommentService commentService;
    private final ReviewService reviewService;

    public ItemController(
            ProductService productService,
            VNPayService vNPayService,
            CommentService commentService,
            ReviewService reviewService) {
        this.productService = productService;
        this.vNPayService = vNPayService;
        this.commentService = commentService;
        this.reviewService = reviewService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id, @AuthenticationPrincipal CustomUserDetails userDetails) {
        Product product = productService.fetchProductById(id)
                .orElseThrow(() -> new IllegalArgumentException("Sản phẩm không tồn tại"));

        model.addAttribute("product", product);
        model.addAttribute("id", id);
        model.addAttribute("comments", commentService.getCommentsByProduct(id));
        model.addAttribute("reviews", reviewService.getReviewsByProduct(id));
        model.addAttribute("comment", new Comment());
        model.addAttribute("review", new Review());

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


    @PostMapping("/product/{id}/review")
    public String addReview(@PathVariable("id") Long id, @Valid @ModelAttribute("review") Review review,
                            BindingResult result, @AuthenticationPrincipal CustomUserDetails userDetails, Model model) {

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
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session, 1);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
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
        User currentUser = new User();
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
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("totalPrice") String totalPrice) throws UnsupportedEncodingException {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        final String uuid = UUID.randomUUID().toString().replace("-", "");
        this.productService.handlePlaceOrder(currentUser, session,
                receiverName, receiverAddress, receiverPhone,
                paymentMethod, uuid);

        if (!paymentMethod.equals("COD")) {
            String ip = this.vNPayService.getIpAddress(request);
            String vnpUrl = this.vNPayService.generateVNPayURL(Double.parseDouble(totalPrice), uuid, ip);
            return "redirect:" + vnpUrl;
        }
        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getThankYouPage(
            Model model,
            @RequestParam("vnp_ResponseCode") Optional<String> vnpayResponseCode,
            @RequestParam("vnp_TxnRef") Optional<String> paymentRef) {

        if (vnpayResponseCode.isPresent() && paymentRef.isPresent()) {
            String paymentStatus = vnpayResponseCode.get().equals("00")
                    ? "PAYMENT_SUCCEED"
                    : "PAYMENT_FAILED";
            this.productService.updatePaymentStatus(paymentRef.get(), paymentStatus);
        }
        return "client/cart/thanks";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;
    }

    @GetMapping("/products")
    public String getProductPage(Model model,
                                 ProductCriteriaDTO productCriteriaDTO,
                                 HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            }
        } catch (Exception e) {
            // page = 1
        }

        Pageable pageable = PageRequest.of(page - 1, 10);
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);
        List<Product> products = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);
        return "client/product/show";
    }
}