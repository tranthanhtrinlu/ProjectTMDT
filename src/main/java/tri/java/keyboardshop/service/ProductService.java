package tri.java.keyboardshop.service;

<<<<<<< Updated upstream
import java.util.List;
import java.util.Optional;

=======
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.context.annotation.Lazy;
>>>>>>> Stashed changes
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

<<<<<<< Updated upstream
import jakarta.servlet.http.HttpSession;
import tri.java.keyboardshop.domain.Cart;
import tri.java.keyboardshop.domain.CartDetail;
import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.OrderDetail;
import tri.java.keyboardshop.domain.Product;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.domain.dto.ProductCriteriaDTO;
import tri.java.keyboardshop.repository.CartDetailRepository;
import tri.java.keyboardshop.repository.CartRepository;
import tri.java.keyboardshop.repository.OrderDetailRepository;
import tri.java.keyboardshop.repository.OrderRepository;
import tri.java.keyboardshop.repository.ProductRepository;
import tri.java.keyboardshop.service.specification.ProductSpecs;
=======
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Optional;
>>>>>>> Stashed changes

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final ReviewService reviewService;
    private final OrderProcessingService orderProcessingService;

    public ProductService(
            ProductRepository productRepository,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            UserService userService,
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository,
            @Lazy ReviewService reviewService,
            OrderProcessingService orderProcessingService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.reviewService = reviewService;
        this.orderProcessingService = orderProcessingService;
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public Page<Product> fetchProducts(Pageable page) {
        return this.productRepository.findAll(page);
    }

    public Page<Product> fetchProductsWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        // Kiểm tra nếu productCriteriaDTO là null hoặc tất cả các trường đều null
        if (productCriteriaDTO == null || 
            (productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getPrice() == null
                && productCriteriaDTO.getType() == null)) {
            return this.productRepository.findAll(page);
        }

        Specification<Product> combinedSpec = Specification.where(null);

        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListFactory(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getType() != null && productCriteriaDTO.getType().isPresent()) {
            Specification<Product> currentSpecs = this.buildTypeSpecification(productCriteriaDTO.getType().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        return this.productRepository.findAll(combinedSpec, page);
    }

    // case 6
    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null); // disconjunction
        for (String p : price) {
            double min = 0;
            double max = 0;

<<<<<<< Updated upstream
            // Set the appropriate min and max based on the price range string
            switch (p) {
                case "duoi-10-trieu":
                    min = 1;
                    max = 10000000;
                    break;
                case "10-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    break;
                case "15-20-trieu":
                    min = 15000000;
                    max = 20000000;
                    break;
                case "tren-20-trieu":
                    min = 20000000;
                    max = 200000000;
                    break;
=======
            if (p.startsWith("custom-")) {
                // Xử lý custom price range từ input fields
                String[] parts = p.substring(7).split("-");
                if (parts.length == 2) {
                    try {
                        min = Double.parseDouble(parts[0]);
                        max = Double.parseDouble(parts[1]);
                        
                        // Nếu max là Double.MAX_VALUE, chỉ filter theo min
                        if (max == Double.MAX_VALUE) {
                            Specification<Product> minSpec = ProductSpecs.minPrice(min);
                            combinedSpec = combinedSpec.or(minSpec);
                            continue;
                        }
                        // Nếu min là 0, chỉ filter theo max
                        else if (min == 0) {
                            Specification<Product> maxSpec = ProductSpecs.maxPrice(max);
                            combinedSpec = combinedSpec.or(maxSpec);
                            continue;
                        }
                    } catch (NumberFormatException e) {
                        // Skip invalid custom price
                        continue;
                    }
                }
            } else {
                // Xử lý các khoảng giá cũ (nếu còn dùng)
                switch (p) {
                    case "duoi-10-trieu":
                        min = 1;
                        max = 10000000;
                        break;
                    case "10-15-trieu":
                        min = 10000000;
                        max = 15000000;
                        break;
                    case "15-20-trieu":
                        min = 15000000;
                        max = 20000000;
                        break;
                    case "tren-20-trieu":
                        min = 20000000;
                        max = 200000000;
                        break;
                }
>>>>>>> Stashed changes
            }

            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }

        return combinedSpec;
    }

    public Specification<Product> buildTypeSpecification(List<String> types) {
        Specification<Product> combinedSpec = Specification.where(null);
        for (String typeStr : types) {
            try {
                Product.ProductType type = Product.ProductType.valueOf(typeStr.toUpperCase());
                Specification<Product> typeSpec = ProductSpecs.matchProductType(type);
                combinedSpec = combinedSpec.or(typeSpec);
            } catch (IllegalArgumentException e) {
                // Skip invalid type values
                System.err.println("Invalid product type: " + typeStr);
            }
        }
        return combinedSpec;
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {

        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user đã có Cart chưa ? nếu chưa -> tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            // save cart_detail
            // tìm product by id

            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();
<<<<<<< Updated upstream
=======
                
                // Kiểm tra số lượng sản phẩm
                if (realProduct.getQuantity() <= 0) {
                    throw new IllegalStateException("Sản phẩm đã hết hàng!");
                }
                
                // Kiểm tra số lượng yêu cầu có vượt quá số lượng có sẵn không
                if (quantity > realProduct.getQuantity()) {
                    throw new IllegalStateException("Số lượng yêu cầu vượt quá số lượng có sẵn!");
                }
                
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
>>>>>>> Stashed changes

                // check sản phẩm đã từng được thêm vào giỏ hàng trước đây chưa ?
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                //
                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getDiscountedPrice()); // Sử dụng giá sau discount
                    cd.setQuantity(quantity);
                    this.cartDetailRepository.save(cd);

                    // update cart (sum);
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    // Kiểm tra tổng số lượng sau khi thêm
                    long totalQuantity = oldDetail.getQuantity() + quantity;
                    if (totalQuantity > realProduct.getQuantity()) {
                        throw new IllegalStateException("Tổng số lượng trong giỏ hàng vượt quá số lượng có sẵn!");
                    }
                    oldDetail.setQuantity(totalQuantity);
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();

            Cart currentCart = cartDetail.getCart();
            // delete cart-detail
            this.cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (currentCart.getSum() > 1) {
                // update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // delete cart (sum = 1)
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

<<<<<<< Updated upstream
    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone) {

        // step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {

                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());

                    this.orderDetailRepository.save(orderDetail);
                }

                // step 2: delete cart_detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                // step 3 : update session
                session.setAttribute("sum", 0);
            }
        }

    }
}
=======
    @Transactional
    public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
                                 String receiverPhone, String paymentMethod, String uuid) {
        // Sử dụng OrderProcessingService để xử lý order
        try {
            orderProcessingService.processOrder(user, session, receiverName, receiverAddress, 
                                               receiverPhone, paymentMethod, uuid);
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi tạo đơn hàng: " + e.getMessage(), e);
        }
    }

    public void updatePaymentStatus(String paymentRef, String paymentStatus) {
        Optional<Order> orderOptional = orderRepository.findByPaymentRef(paymentRef);
        orderOptional.ifPresent(order -> {
            order.setPaymentStatus(paymentStatus);
            
            // Cập nhật order status dựa trên payment status
            if ("PAYMENT_SUCCEED".equals(paymentStatus)) {
                order.setStatus(Order.OrderStatus.COMPLETE);
            } else if ("PAYMENT_FAILED".equals(paymentStatus)) {
                order.setStatus(Order.OrderStatus.CANCEL);
            } else if ("PAYMENT_UNPAID".equals(paymentStatus)) {
                // Nếu PAYMENT_UNPAID thì giữ nguyên PENDING
                order.setStatus(Order.OrderStatus.PENDING);
            }
            
            orderRepository.save(order);
        });
    }

    public Page<Product> fetchProductsWithCriteria(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getPrice() == null
                && productCriteriaDTO.getType() == null) {
            return this.productRepository.findAll(page);
        }

        Specification<Product> combinedSpec = Specification.where(null);
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListFactory(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getType() != null && productCriteriaDTO.getType().isPresent()) {
            Specification<Product> currentSpecs = this.buildTypeSpecification(productCriteriaDTO.getType().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        return this.productRepository.findAll(combinedSpec, page);
    }

    /**
     * Lấy rating trung bình cho một sản phẩm
     */
    public Double getAverageRating(Long productId) {
        return this.reviewService.getAverageRating(productId);
    }

    /**
     * Lấy tổng số đánh giá cho một sản phẩm
     */
    public Long getTotalReviews(Long productId) {
        return this.reviewService.getTotalReviews(productId);
    }

    /**
     * Thêm thông tin rating vào danh sách sản phẩm
     */
    public void enrichProductsWithRating(List<Product> products) {
        for (Product product : products) {
            try {
                Double avgRating = getAverageRating(product.getId());
                Long totalReviews = getTotalReviews(product.getId());
                
                // Set temporary fields for JSP display
                product.setAverageRating(avgRating);
                product.setTotalReviews(totalReviews.intValue()); // Convert long to int
            } catch (Exception e) {
                // Set default values if error occurs
                product.setAverageRating(0.0);
                product.setTotalReviews(0);
            }
        }
    }

    /**
     * Lấy danh sách sản phẩm bán chạy nhất
     */
    public List<Product> getBestSellingProducts(int limit) {
        Pageable pageable = PageRequest.of(0, limit);
        return this.productRepository.findBestSellingProducts(pageable);
    }

    /**
     * Lấy danh sách sản phẩm mới nhất
     */
    public List<Product> getNewestProducts(int limit) {
        Pageable pageable = PageRequest.of(0, limit);
        return this.productRepository.findNewestProducts(pageable);
    }
}
>>>>>>> Stashed changes
