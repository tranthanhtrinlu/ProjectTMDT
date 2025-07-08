package tri.java.keyboardshop.service;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.*;
import tri.java.keyboardshop.repository.CartRepository;
import tri.java.keyboardshop.repository.CartDetailRepository;
import tri.java.keyboardshop.repository.OrderRepository;
import tri.java.keyboardshop.repository.OrderDetailRepository;
import tri.java.keyboardshop.repository.ProductRepository;

import java.util.List;

@Service
public class OrderProcessingService {
    
    private static final Logger logger = LoggerFactory.getLogger(OrderProcessingService.class);
    
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final ProductRepository productRepository;

    public OrderProcessingService(
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository,
            ProductRepository productRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.productRepository = productRepository;
    }

    @Transactional
    public Order processOrder(User user, HttpSession session, String receiverName, 
                            String receiverAddress, String receiverPhone, 
                            String paymentMethod, String uuid) {
        
        logger.info("Bắt đầu xử lý đơn hàng cho user: {}", user.getId());
        
        try {
            // 1. Validate input
            validateOrderInput(user, receiverName, receiverAddress, receiverPhone, paymentMethod);
            
            // 2. Get and validate cart
            Cart cart = getAndValidateCart(user);
            List<CartDetail> cartDetails = cart.getCartDetails();
            
            // 3. Validate product availability
            validateProductAvailability(cartDetails);
            
            // 4. Create order
            Order order = createOrder(user, receiverName, receiverAddress, receiverPhone, 
                                    paymentMethod, uuid, cartDetails);
            
            // 5. Create order details and update product quantities
            createOrderDetails(order, cartDetails);
            
            // 6. Update product quantities
            updateProductQuantities(cartDetails);
            
            // 7. Save order (cascade will save order details)
            order = orderRepository.save(order);
            logger.info("Đã lưu order với ID: {}", order.getId());
            
            // 8. Clean up cart
            cleanupCart(cart, cartDetails, session);
            
            logger.info("Hoàn thành xử lý đơn hàng cho user: {}", user.getId());
            return order;
            
        } catch (Exception e) {
            logger.error("Lỗi khi xử lý đơn hàng cho user {}: {}", user.getId(), e.getMessage(), e);
            throw new RuntimeException("Lỗi khi tạo đơn hàng: " + e.getMessage(), e);
        }
    }
    
    private void validateOrderInput(User user, String receiverName, String receiverAddress, 
                                  String receiverPhone, String paymentMethod) {
        if (user == null) {
            throw new IllegalArgumentException("Người dùng không tồn tại.");
        }
        if (receiverName == null || receiverName.trim().isEmpty()) {
            throw new IllegalArgumentException("Tên người nhận không được để trống.");
        }
        if (receiverAddress == null || receiverAddress.trim().isEmpty()) {
            throw new IllegalArgumentException("Địa chỉ không được để trống.");
        }
        if (receiverPhone == null || receiverPhone.trim().isEmpty()) {
            throw new IllegalArgumentException("Số điện thoại không được để trống.");
        }
        if (paymentMethod == null || paymentMethod.trim().isEmpty()) {
            throw new IllegalArgumentException("Phương thức thanh toán không được để trống.");
        }
    }
    
    private Cart getAndValidateCart(User user) {
        Cart cart = cartRepository.findByUser(user);
        if (cart == null || cart.getCartDetails().isEmpty()) {
            throw new IllegalStateException("Giỏ hàng trống.");
        }
        return cart;
    }
    
    private void validateProductAvailability(List<CartDetail> cartDetails) {
        for (CartDetail cd : cartDetails) {
            Product product = cd.getProduct();
            if (product.getQuantity() < cd.getQuantity()) {
                throw new IllegalStateException(
                    "Sản phẩm " + product.getName() + " chỉ còn " + product.getQuantity() + " sản phẩm trong kho!");
            }
        }
    }
    
    private Order createOrder(User user, String receiverName, String receiverAddress, 
                            String receiverPhone, String paymentMethod, String uuid, 
                            List<CartDetail> cartDetails) {
        
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(receiverName.trim());
        order.setReceiverAddress(receiverAddress.trim());
        order.setReceiverPhone(receiverPhone.trim());
        order.setStatus(Order.OrderStatus.PENDING);
        order.setPaymentMethod(paymentMethod.trim());
        order.setPaymentStatus("PAYMENT_UNPAID");
        order.setPaymentRef(paymentMethod.equals("COD") ? "UNKNOWN" : uuid);

        double totalPrice = cartDetails.stream()
                .mapToDouble(cd -> cd.getPrice() * cd.getQuantity())
                .sum();
        order.setTotalPrice(totalPrice);
        
        logger.info("Đã tạo order với tổng tiền: {}", totalPrice);
        return order;
    }
    
    private void createOrderDetails(Order order, List<CartDetail> cartDetails) {
        for (CartDetail cd : cartDetails) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setProduct(cd.getProduct());
            orderDetail.setPrice(cd.getPrice());
            orderDetail.setQuantity(cd.getQuantity());
            
            // Sử dụng helper method để quản lý relationship
            order.addOrderDetail(orderDetail);
            
            logger.debug("Đã tạo order detail cho sản phẩm: {} với số lượng: {}", 
                        cd.getProduct().getName(), cd.getQuantity());
        }
    }
    
    private void updateProductQuantities(List<CartDetail> cartDetails) {
        for (CartDetail cd : cartDetails) {
            Product product = cd.getProduct();
            long newQuantity = product.getQuantity() - cd.getQuantity();
            
            // Chỉ cập nhật quantity, không cập nhật toàn bộ entity để tránh validation
            productRepository.updateProductQuantity(product.getId(), newQuantity);
            
            logger.debug("Đã cập nhật số lượng sản phẩm {}: {} -> {}", 
                        product.getName(), product.getQuantity() + cd.getQuantity(), newQuantity);
        }
    }
    
    private void cleanupCart(Cart cart, List<CartDetail> cartDetails, HttpSession session) {
        // Xóa cart details trước
        cartDetailRepository.deleteAll(cartDetails);
        
        // Xóa cart
        cartRepository.delete(cart);
        
        // Cập nhật session
        session.setAttribute("sum", 0);
        
        logger.info("Đã xóa cart và cart details cho user");
    }
} 