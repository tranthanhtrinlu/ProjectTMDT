package tri.java.keyboardshop.controller.client;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.OrderDetail;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.service.CustomUserDetails;
import tri.java.keyboardshop.service.OrderService;
import tri.java.keyboardshop.service.ReviewService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;
    private final ReviewService reviewService;

    public OrderController(OrderService orderService, ReviewService reviewService) {
        this.orderService = orderService;
        this.reviewService = reviewService;
    }

    @GetMapping("/history")
    public String showOrderHistory(Model model, @AuthenticationPrincipal CustomUserDetails userDetails) {
        List<Order> orders = orderService.fetchOrderByUser(userDetails.getUser());
        model.addAttribute("orders", orders);
        return "client/cart/order-history";
    }
    
    @GetMapping("/history/data")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getOrderHistoryData(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(required = false) String status,
            @RequestParam(defaultValue = "newest") String sort,
            @RequestParam(required = false) String search,
            @AuthenticationPrincipal CustomUserDetails userDetails) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            User user = userDetails.getUser();
            
            // Tạo Sort object
            Sort sortObj;
            switch (sort) {
                case "oldest":
                    sortObj = Sort.by(Sort.Direction.ASC, "createdAt");
                    break;
                case "price-high":
                    sortObj = Sort.by(Sort.Direction.DESC, "totalPrice");
                    break;
                case "price-low":
                    sortObj = Sort.by(Sort.Direction.ASC, "totalPrice");
                    break;
                case "newest":
                default:
                    sortObj = Sort.by(Sort.Direction.DESC, "createdAt");
                    break;
            }
            
            Pageable pageable = PageRequest.of(page, size, sortObj);
            Page<Order> ordersPage;
            
            // Filter theo status nếu có
            if (status != null && !status.isEmpty()) {
                try {
                    Order.OrderStatus orderStatus = Order.OrderStatus.valueOf(status);
                    ordersPage = orderService.fetchOrdersByUserAndStatus(user, orderStatus, pageable);
                } catch (IllegalArgumentException e) {
                    // Status không hợp lệ, trả về tất cả
                    ordersPage = orderService.fetchOrdersByUser(user, pageable);
                }
            } else {
                ordersPage = orderService.fetchOrdersByUser(user, pageable);
            }
            
            // Lọc theo search nếu có (search trong tên sản phẩm hoặc order ID)
            List<Order> filteredOrders = ordersPage.getContent();
            if (search != null && !search.trim().isEmpty()) {
                String searchLower = search.toLowerCase().trim();
                filteredOrders = filteredOrders.stream()
                    .filter(order -> {
                        // Tìm trong order ID
                        if (String.valueOf(order.getId()).contains(search)) {
                            return true;
                        }
                        // Tìm trong tên sản phẩm
                        return order.getOrderDetails().stream()
                            .anyMatch(detail -> detail.getProduct().getName().toLowerCase().contains(searchLower));
                    })
                    .collect(Collectors.toList());
            }
            
            // Convert to DTOs
            List<Map<String, Object>> orderData = filteredOrders.stream()
                .map(this::convertToOrderDTO)
                .collect(Collectors.toList());
                
            // Pagination info
            Map<String, Object> pagination = new HashMap<>();
            pagination.put("currentPage", ordersPage.getNumber());
            pagination.put("totalPages", ordersPage.getTotalPages());
            pagination.put("totalOrders", ordersPage.getTotalElements());
            pagination.put("currentSize", filteredOrders.size());
            pagination.put("hasNext", ordersPage.hasNext());
            pagination.put("hasPrevious", ordersPage.hasPrevious());
            
            response.put("success", true);
            response.put("data", orderData);
            response.put("pagination", pagination);
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

    @PostMapping("/cancel/{id}")
    public String cancelOrder(@PathVariable("id") Long orderId, @AuthenticationPrincipal CustomUserDetails userDetails) {
        orderService.cancelOrder(orderId, userDetails.getUser());
        return "redirect:/order/history";
    }
    
    @GetMapping("/{id}")
    public String showOrderDetail(@PathVariable("id") Long orderId, 
                                 Model model, 
                                 @AuthenticationPrincipal CustomUserDetails userDetails) {
        // Chỉ trả về JSP rỗng, dữ liệu sẽ được load qua AJAX
        model.addAttribute("orderId", orderId);
        return "client/cart/order-detail";
    }
    
    @GetMapping("/{id}/data")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getOrderDetailData(@PathVariable("id") Long orderId,
                                                                 @AuthenticationPrincipal CustomUserDetails userDetails) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            User user = userDetails.getUser();
            Optional<Order> orderOptional = orderService.fetchOrderById(orderId);
            
            if (!orderOptional.isPresent()) {
                response.put("success", false);
                response.put("message", "Đơn hàng không tồn tại");
                return ResponseEntity.badRequest().body(response);
            }
            
            Order order = orderOptional.get();
            
            // Check if user owns this order
            if (order.getUser().getId() != user.getId()) {
                response.put("success", false);
                response.put("message", "Bạn không có quyền xem đơn hàng này");
                return ResponseEntity.badRequest().body(response);
            }
            
            // Convert order to DTO
            Map<String, Object> orderData = convertToOrderDTO(order);
            
            response.put("success", true);
            response.put("data", orderData);
            response.put("user", convertToUserDTO(user));
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @PostMapping("/{id}/reorder")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> reorderOrder(@PathVariable("id") Long orderId,
                                                           @AuthenticationPrincipal CustomUserDetails userDetails) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            User user = userDetails.getUser();
            Optional<Order> orderOptional = orderService.fetchOrderById(orderId);
            
            if (!orderOptional.isPresent()) {
                response.put("success", false);
                response.put("message", "Đơn hàng không tồn tại");
                return ResponseEntity.badRequest().body(response);
            }
            
            Order order = orderOptional.get();
            
            // Check if user owns this order
            if (order.getUser().getId() != user.getId()) {
                response.put("success", false);
                response.put("message", "Bạn không có quyền thao tác với đơn hàng này");
                return ResponseEntity.badRequest().body(response);
            }
            
            // Check if order is completed
            if (order.getStatus() != Order.OrderStatus.COMPLETE) {
                response.put("success", false);
                response.put("message", "Chỉ có thể đặt lại đơn hàng đã hoàn thành");
                return ResponseEntity.badRequest().body(response);
            }
            
            // Redirect to cart page with reorder info
            response.put("success", true);
            response.put("message", "Đang thêm sản phẩm vào giỏ hàng...");
            response.put("redirectUrl", "/cart?reorder=" + orderId);
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    private Map<String, Object> convertToOrderDTO(Order order) {
        Map<String, Object> dto = new HashMap<>();
        dto.put("id", order.getId());
        dto.put("status", order.getStatus().toString());
        dto.put("totalPrice", order.getTotalPrice());
        dto.put("createdAt", order.getCreatedAt().toString());
        dto.put("paymentStatus", order.getPaymentStatus());
        dto.put("paymentMethod", order.getPaymentMethod());
        
        // Order details with review status
        List<Map<String, Object>> orderDetails = order.getOrderDetails().stream()
            .map(detail -> convertToOrderDetailDTO(detail, order.getUser()))
            .collect(Collectors.toList());
        dto.put("orderDetails", orderDetails);
        
        return dto;
    }
    
    private Map<String, Object> convertToOrderDetailDTO(OrderDetail orderDetail) {
        Map<String, Object> dto = new HashMap<>();
        dto.put("id", orderDetail.getId());
        dto.put("quantity", orderDetail.getQuantity());
        dto.put("price", orderDetail.getPrice());
        
        // Product info
        Map<String, Object> product = new HashMap<>();
        product.put("id", orderDetail.getProduct().getId());
        product.put("name", orderDetail.getProduct().getName());
        product.put("image", orderDetail.getProduct().getImage());
        product.put("price", orderDetail.getProduct().getPrice());
        dto.put("product", product);
        
        return dto;
    }
    
    private Map<String, Object> convertToOrderDetailDTO(OrderDetail orderDetail, User user) {
        Map<String, Object> dto = new HashMap<>();
        dto.put("id", orderDetail.getId());
        dto.put("quantity", orderDetail.getQuantity());
        dto.put("price", orderDetail.getPrice());
        
        // Product info
        Map<String, Object> product = new HashMap<>();
        product.put("id", orderDetail.getProduct().getId());
        product.put("name", orderDetail.getProduct().getName());
        product.put("image", orderDetail.getProduct().getImage());
        product.put("price", orderDetail.getProduct().getPrice());
        dto.put("product", product);
        
        // Check if user has reviewed this product
        boolean hasReviewed = !reviewService.canUserReview(user.getId(), orderDetail.getProduct().getId());
        dto.put("hasReviewed", hasReviewed);
        
        return dto;
    }
    
    private Map<String, Object> convertToUserDTO(User user) {
        Map<String, Object> dto = new HashMap<>();
        dto.put("id", user.getId());
        dto.put("fullName", user.getFullName());
        dto.put("email", user.getEmail());
        return dto;
    }
}