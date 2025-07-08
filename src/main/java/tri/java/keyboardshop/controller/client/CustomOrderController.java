package tri.java.keyboardshop.controller.client;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tri.java.keyboardshop.domain.*;
import tri.java.keyboardshop.service.CustomOrderService;
import tri.java.keyboardshop.service.ProductService;
import tri.java.keyboardshop.service.UserService;
import tri.java.keyboardshop.service.VNPayService;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.http.ResponseEntity;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/custom")
public class CustomOrderController {
    
    @Autowired
    private CustomOrderService customOrderService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private VNPayService vNPayService;
    
    @GetMapping("/keyboard/{productId}")
    public String showCustomizePage(@PathVariable Long productId, 
                                  @RequestParam(required = false) Long customOrderId,
                                  Model model, HttpServletRequest request) {
        // Check if user is logged in
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
            return "redirect:/login?redirect=/custom/keyboard/" + productId;
        }
        
        String email = authentication.getName();
        User user = this.userService.getUserByEmail(email);
        
        Optional<Product> productOptional = productService.fetchProductById(productId);
        if (!productOptional.isPresent()) {
            return "redirect:/products?error=product_not_found";
        }
        
        Product product = productOptional.get();
        
        // Check if product is a keyboard
        if (product.getType() != Product.ProductType.KEYBOARD) {
            return "redirect:/cart?error=not_keyboard";
        }
        
        // Get available components
        List<Product> keycaps = customOrderService.getAvailableKeycaps();
        List<Product> kits = customOrderService.getAvailableKits();
        List<Product> switches = customOrderService.getAvailableSwitches();
        
        // Get or create custom order
        CustomOrder customOrder;
        if (customOrderId != null) {
            Optional<CustomOrder> existingOrder = customOrderService.findById(customOrderId);
            if (existingOrder.isPresent() && existingOrder.get().getUser().getId() == user.getId()) {
                customOrder = existingOrder.get();
            } else {
                customOrder = customOrderService.createCustomOrder(user, product);
            }
        } else {
            customOrder = customOrderService.createCustomOrder(user, product);
        }
        
        // Service prices
        model.addAttribute("lubingPrice", customOrderService.getServicePrice("lubing"));
        model.addAttribute("stabilizerPrice", customOrderService.getServicePrice("stabilizer"));
        model.addAttribute("keycapCustomPrice", customOrderService.getServicePrice("keycap_custom"));
        model.addAttribute("cablePrice", customOrderService.getServicePrice("cable"));
        model.addAttribute("casePrice", customOrderService.getServicePrice("case"));
        
        model.addAttribute("customOrder", customOrder);
        model.addAttribute("baseKeyboard", product);
        model.addAttribute("keycaps", keycaps);
        model.addAttribute("kits", kits);
        model.addAttribute("switches", switches);
        
        return "client/custom/customize";
    }
    
    @PostMapping("/update/{customOrderId}")
    @ResponseBody
    public String updateCustomOrder(@PathVariable Long customOrderId,
                                  @RequestParam(required = false) Long keycapId,
                                  @RequestParam(required = false) String switchType,
                                  @RequestParam(required = false) Long kitId,
                                  @RequestParam(defaultValue = "false") boolean lubingService,
                                  @RequestParam(defaultValue = "false") boolean stabilizerTuning,
                                  @RequestParam(defaultValue = "false") boolean keycapCustomization,
                                  @RequestParam(defaultValue = "false") boolean cableCustomization,
                                  @RequestParam(defaultValue = "false") boolean caseModding,
                                  @RequestParam(required = false) String customNotes) {
        
        try {
            Optional<CustomOrder> customOrderOptional = customOrderService.findById(customOrderId);
            if (!customOrderOptional.isPresent()) {
                return "{\"success\": false, \"message\": \"Custom order not found\"}";
            }
            
            CustomOrder customOrder = customOrderOptional.get();
            
            // Update keycap
            if (keycapId != null) {
                Optional<Product> keycap = productService.fetchProductById(keycapId);
                keycap.ifPresent(customOrder::setSelectedKeycap);
            } else {
                customOrder.setSelectedKeycap(null);
            }
            
            // Update switch
            customOrder.setSelectedSwitchType(switchType);
            
            // Update kit
            if (kitId != null) {
                Optional<Product> kit = productService.fetchProductById(kitId);
                kit.ifPresent(customOrder::setSelectedKit);
            } else {
                customOrder.setSelectedKit(null);
            }
            
            // Update services
            customOrder.setLubingService(lubingService);
            customOrder.setStabilizerTuning(stabilizerTuning);
            customOrder.setKeycapCustomization(keycapCustomization);
            customOrder.setCableCustomization(cableCustomization);
            customOrder.setCaseModding(caseModding);
            customOrder.setCustomNotes(customNotes);
            
            // Save and calculate total price
            customOrder = customOrderService.updateCustomOrder(customOrder);
            
            return "{\"success\": true, \"totalPrice\": " + customOrder.getTotalPrice() + "}";
            
        } catch (Exception e) {
            return "{\"success\": false, \"message\": \"" + e.getMessage() + "\"}";
        }
    }
    
    @GetMapping("/preview/{customOrderId}")
    public String showPreview(@PathVariable Long customOrderId, Model model) {
        Optional<CustomOrder> customOrderOptional = customOrderService.findById(customOrderId);
        if (!customOrderOptional.isPresent()) {
            return "redirect:/cart?error=custom_order_not_found";
        }
        
        CustomOrder customOrder = customOrderOptional.get();
        model.addAttribute("customOrder", customOrder);
        
        return "client/custom/preview";
    }
    
    @PostMapping("/confirm/{customOrderId}")
    public String confirmCustomOrder(@PathVariable Long customOrderId, RedirectAttributes redirectAttributes) {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
                return "redirect:/login";
            }
            
            String email = authentication.getName();
            User user = this.userService.getUserByEmail(email);
            
            Optional<CustomOrder> customOrderOptional = customOrderService.findById(customOrderId);
            if (!customOrderOptional.isPresent()) {
                redirectAttributes.addFlashAttribute("error", "Custom order không tồn tại");
                return "redirect:/cart";
            }
            
            CustomOrder customOrder = customOrderOptional.get();
            
            // Check if user owns this order
            if (customOrder.getUser().getId() != user.getId()) {
                redirectAttributes.addFlashAttribute("error", "Bạn không có quyền truy cập đơn hàng này");
                return "redirect:/cart";
            }
            
            // Store custom order info in session for checkout
            try {
                HttpServletRequest httpRequest = (HttpServletRequest) RequestContextHolder.currentRequestAttributes()
                    .resolveReference(RequestAttributes.REFERENCE_REQUEST);
                if (httpRequest != null) {
                    HttpSession session = httpRequest.getSession();
                    session.setAttribute("customOrderId", customOrderId);
                    session.setAttribute("customOrderTotal", customOrder.getTotalPrice());
                }
            } catch (Exception e) {
                // Session handling failed, continue anyway
            }
            
            // Redirect to custom checkout page
            return "redirect:/custom/checkout/" + customOrderId;
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            return "redirect:/cart";
        }
    }
    
    @GetMapping("/checkout/{customOrderId}")
    public String showCustomCheckout(@PathVariable Long customOrderId, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }
        
        String email = authentication.getName();
        User user = this.userService.getUserByEmail(email);
        
        Optional<CustomOrder> customOrderOptional = customOrderService.findById(customOrderId);
        if (!customOrderOptional.isPresent()) {
            return "redirect:/cart?error=custom_order_not_found";
        }
        
        CustomOrder customOrder = customOrderOptional.get();
        
        // Check if user owns this order
        if (customOrder.getUser().getId() != user.getId()) {
            return "redirect:/cart?error=access_denied";
        }
        
        model.addAttribute("customOrder", customOrder);
        model.addAttribute("user", user);
        
        return "client/custom/checkout";
    }
    
    @PostMapping("/place-order")
    public String placeCustomOrder(@RequestParam Long customOrderId,
                                 @RequestParam String receiverName,
                                 @RequestParam String receiverAddress,
                                 @RequestParam String receiverPhone,
                                 @RequestParam String receiverEmail,
                                 @RequestParam(required = false) String orderNotes,
                                 @RequestParam String paymentMethod,
                                 RedirectAttributes redirectAttributes,
                                 HttpServletRequest request) {
        
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
                return "redirect:/login";
            }
            
            String email = authentication.getName();
            User user = this.userService.getUserByEmail(email);
            
            Optional<CustomOrder> customOrderOptional = customOrderService.findById(customOrderId);
            if (!customOrderOptional.isPresent()) {
                redirectAttributes.addFlashAttribute("error", "Custom order không tồn tại");
                return "redirect:/cart";
            }
            
            CustomOrder customOrder = customOrderOptional.get();
            
            // Check if user owns this order
            if (customOrder.getUser().getId() != user.getId()) {
                redirectAttributes.addFlashAttribute("error", "Bạn không có quyền truy cập đơn hàng này");
                return "redirect:/cart";
            }
            
            // Create a regular order from custom order
            // We'll need to import Order service and create an order
            // For now, just update the custom order status
            customOrder.setStatus(CustomOrderStatus.PROCESSING);
            customOrderService.updateCustomOrder(customOrder);
            
            if ("VNPAY".equals(paymentMethod)) {
                // Store custom order info in session for VNPay processing
                HttpSession session = request.getSession();
                session.setAttribute("customOrderId", customOrderId);
                session.setAttribute("customOrderTotal", customOrder.getTotalPrice());
                session.setAttribute("isCustomOrder", true);
                session.setAttribute("receiverName", receiverName);
                session.setAttribute("receiverAddress", receiverAddress);
                session.setAttribute("receiverPhone", receiverPhone);
                session.setAttribute("orderNotes", orderNotes);
                
                // Generate UUID for payment reference
                String uuid = java.util.UUID.randomUUID().toString().replace("-", "");
                
                try {
                    String ip = vNPayService.getIpAddress(request);
                    String vnpUrl = vNPayService.generateVNPayURL(customOrder.getTotalPrice().doubleValue(), uuid, ip);
                    
                    // Store payment reference in session
                    session.setAttribute("paymentRef", uuid);
                    
                    return "redirect:" + vnpUrl;
                } catch (Exception e) {
                    redirectAttributes.addFlashAttribute("error", "Lỗi kết nối VNPay: " + e.getMessage());
                    return "redirect:/custom/checkout/" + customOrderId;
                }
            } else {
                // COD payment - mark as completed
                customOrder.setStatus(CustomOrderStatus.PROCESSING);
                customOrderService.updateCustomOrder(customOrder);
                
                redirectAttributes.addFlashAttribute("success", "Đơn hàng custom đã được đặt thành công! Bạn sẽ thanh toán khi nhận hàng.");
                return "redirect:/custom/thanks?customOrderId=" + customOrderId;
            }
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi đặt hàng: " + e.getMessage());
            return "redirect:/custom/checkout/" + customOrderId;
        }
    }
    
    @GetMapping("/thanks")
    public String showCustomThanks(
            @RequestParam(required = false) Long customOrderId,
            @RequestParam(required = false) String vnp_ResponseCode,
            @RequestParam(required = false) String vnp_TxnRef,
            @RequestParam(required = false) String vnp_SecureHash,
            HttpServletRequest request,
            Model model) {
        
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
                return "redirect:/login";
            }
            
            String email = authentication.getName();
            User user = this.userService.getUserByEmail(email);
            HttpSession session = request.getSession();
            
            // Handle VNPay callback
            if (vnp_ResponseCode != null && vnp_TxnRef != null) {
                // This is VNPay callback
                Long sessionCustomOrderId = (Long) session.getAttribute("customOrderId");
                if (sessionCustomOrderId != null) {
                    Optional<CustomOrder> customOrderOptional = customOrderService.findById(sessionCustomOrderId);
                    if (customOrderOptional.isPresent()) {
                        CustomOrder customOrder = customOrderOptional.get();
                        
                        if ("00".equals(vnp_ResponseCode)) {
                            // Payment successful
                            customOrder.setStatus(CustomOrderStatus.PROCESSING);
                            customOrderService.updateCustomOrder(customOrder);
                            
                            model.addAttribute("paymentStatus", "PAYMENT_SUCCEED");
                            model.addAttribute("paymentMessage", "Thanh toán thành công! Đơn hàng custom của bạn đã được xác nhận.");
                            model.addAttribute("customOrder", customOrder);
                        } else {
                            // Payment failed
                            customOrder.setStatus(CustomOrderStatus.CANCELLED);
                            customOrderService.updateCustomOrder(customOrder);
                            
                            model.addAttribute("paymentStatus", "PAYMENT_FAILED");
                            model.addAttribute("paymentMessage", "Thanh toán thất bại. Mã lỗi: " + vnp_ResponseCode);
                            model.addAttribute("customOrder", customOrder);
                        }
                        
                        // Clear session
                        session.removeAttribute("customOrderId");
                        session.removeAttribute("customOrderTotal");
                        session.removeAttribute("isCustomOrder");
                    }
                }
            } else if (customOrderId != null) {
                // Direct access with customOrderId (COD payment)
                Optional<CustomOrder> customOrderOptional = customOrderService.findById(customOrderId);
                if (customOrderOptional.isPresent() && customOrderOptional.get().getUser().getId() == user.getId()) {
                    CustomOrder customOrder = customOrderOptional.get();
                    model.addAttribute("paymentStatus", "PAYMENT_SUCCEED");
                    model.addAttribute("paymentMessage", "Đơn hàng custom đã được đặt thành công! Bạn sẽ thanh toán khi nhận hàng.");
                    model.addAttribute("customOrder", customOrder);
                }
            }
            
            return "client/custom/thanks";
            
        } catch (Exception e) {
            model.addAttribute("paymentStatus", "PAYMENT_FAILED");
            model.addAttribute("paymentMessage", "Có lỗi xảy ra: " + e.getMessage());
            return "client/custom/thanks";
        }
    }
    
    @GetMapping("/orders")
    public String showCustomOrders(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }
        
        String email = authentication.getName();
        User user = this.userService.getUserByEmail(email);
        
        List<CustomOrder> allCustomOrders = customOrderService.findByUser(user);
        
        // Simple pagination
        int totalOrders = allCustomOrders.size();
        int totalPages = (int) Math.ceil((double) totalOrders / size);
        
        // Ensure page is within bounds
        if (page < 0) page = 0;
        if (page >= totalPages) page = totalPages - 1;
        if (page < 0) page = 0; // In case totalPages is 0
        
        int startIndex = page * size;
        int endIndex = Math.min(startIndex + size, totalOrders);
        
        List<CustomOrder> customOrders = allCustomOrders.subList(startIndex, endIndex);
        
        model.addAttribute("customOrders", customOrders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalOrders", totalOrders);
        model.addAttribute("pageSize", size);
        model.addAttribute("hasNext", page < totalPages - 1);
        model.addAttribute("hasPrevious", page > 0);
        
        return "client/custom/orders";
    }
    
    @PostMapping("/cancel/{customOrderId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> cancelCustomOrder(@PathVariable Long customOrderId) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
                response.put("success", false);
                response.put("message", "Bạn cần đăng nhập để thực hiện chức năng này");
                return ResponseEntity.badRequest().body(response);
            }
            
            String email = authentication.getName();
            User user = this.userService.getUserByEmail(email);
            
            Optional<CustomOrder> customOrderOptional = customOrderService.findById(customOrderId);
            if (!customOrderOptional.isPresent()) {
                response.put("success", false);
                response.put("message", "Đơn hàng không tồn tại");
                return ResponseEntity.badRequest().body(response);
            }
            
            CustomOrder customOrder = customOrderOptional.get();
            
            // Check if user owns this order
            if (customOrder.getUser().getId() != user.getId()) {
                response.put("success", false);
                response.put("message", "Bạn không có quyền hủy đơn hàng này");
                return ResponseEntity.badRequest().body(response);
            }
            
            // Check if order can be cancelled
            if (!customOrder.getStatus().equals(CustomOrderStatus.PENDING)) {
                response.put("success", false);
                response.put("message", "Chỉ có thể hủy đơn hàng đang chờ xử lý");
                return ResponseEntity.badRequest().body(response);
            }
            
            // Cancel the order
            customOrder.setStatus(CustomOrderStatus.CANCELLED);
            customOrderService.updateCustomOrder(customOrder);
            
            response.put("success", true);
            response.put("message", "Đơn hàng đã được hủy thành công");
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @PostMapping("/copy/{customOrderId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> copyCustomOrder(@PathVariable Long customOrderId) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
                response.put("success", false);
                response.put("message", "Bạn cần đăng nhập để thực hiện chức năng này");
                return ResponseEntity.badRequest().body(response);
            }
            
            String email = authentication.getName();
            User user = this.userService.getUserByEmail(email);
            
            Optional<CustomOrder> originalOrderOptional = customOrderService.findById(customOrderId);
            if (!originalOrderOptional.isPresent()) {
                response.put("success", false);
                response.put("message", "Đơn hàng gốc không tồn tại");
                return ResponseEntity.badRequest().body(response);
            }
            
            CustomOrder originalOrder = originalOrderOptional.get();
            
            // Check if user owns this order
            if (originalOrder.getUser().getId() != user.getId()) {
                response.put("success", false);
                response.put("message", "Bạn không có quyền sao chép đơn hàng này");
                return ResponseEntity.badRequest().body(response);
            }
            
            // Create new custom order based on original
            CustomOrder newOrder = new CustomOrder(user, originalOrder.getBaseKeyboard());
            newOrder.setSelectedKeycap(originalOrder.getSelectedKeycap());
            newOrder.setSelectedSwitchType(originalOrder.getSelectedSwitchType());
            newOrder.setSelectedKit(originalOrder.getSelectedKit());
            newOrder.setLubingService(originalOrder.isLubingService());
            newOrder.setStabilizerTuning(originalOrder.isStabilizerTuning());
            newOrder.setKeycapCustomization(originalOrder.isKeycapCustomization());
            newOrder.setCableCustomization(originalOrder.isCableCustomization());
            newOrder.setCaseModding(originalOrder.isCaseModding());
            newOrder.setCustomNotes(originalOrder.getCustomNotes());
            newOrder.setStatus(CustomOrderStatus.PENDING);
            
            // Save and calculate total price
            newOrder = customOrderService.updateCustomOrder(newOrder);
            
            response.put("success", true);
            response.put("message", "Đã tạo đơn hàng mới thành công");
            response.put("newOrderId", newOrder.getId());
            response.put("keyboardId", originalOrder.getBaseKeyboard().getId());
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @GetMapping("/orders/data")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getCustomOrdersData(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(required = false) String status,
            @RequestParam(defaultValue = "newest") String sort,
            @RequestParam(required = false) String search) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
                response.put("success", false);
                response.put("message", "Bạn cần đăng nhập");
                return ResponseEntity.status(401).body(response);
            }
            
            String email = authentication.getName();
            User user = this.userService.getUserByEmail(email);
            
            List<CustomOrder> allCustomOrders = customOrderService.findByUser(user);
            
            // Apply filters
            List<CustomOrder> filteredOrders = allCustomOrders.stream()
                .filter(order -> {
                    // Status filter
                    if (status != null && !status.isEmpty() && !order.getStatus().toString().equals(status)) {
                        return false;
                    }
                    
                    // Search filter
                    if (search != null && !search.isEmpty()) {
                        String searchLower = search.toLowerCase();
                        boolean matchesKeyboard = order.getBaseKeyboard().getName().toLowerCase().contains(searchLower);
                        boolean matchesOrderId = String.valueOf(order.getId()).contains(search);
                        if (!matchesKeyboard && !matchesOrderId) {
                            return false;
                        }
                    }
                    
                    return true;
                })
                .collect(Collectors.toList());
            
            // Apply sorting
            filteredOrders.sort((a, b) -> {
                switch (sort) {
                    case "oldest":
                        return a.getCreatedAt().compareTo(b.getCreatedAt());
                    case "price-high":
                        return b.getTotalPrice().compareTo(a.getTotalPrice());
                    case "price-low":
                        return a.getTotalPrice().compareTo(b.getTotalPrice());
                    case "newest":
                    default:
                        return b.getCreatedAt().compareTo(a.getCreatedAt());
                }
            });
            
            // Apply pagination
            int totalOrders = filteredOrders.size();
            int totalPages = (int) Math.ceil((double) totalOrders / size);
            
            // Ensure page is within bounds
            if (page < 0) page = 0;
            if (page >= totalPages) page = totalPages - 1;
            if (page < 0) page = 0; // In case totalPages is 0
            
            int startIndex = page * size;
            int endIndex = Math.min(startIndex + size, totalOrders);
            
            List<CustomOrder> paginatedOrders = filteredOrders.subList(startIndex, endIndex);
            
            // Convert to DTOs for JSON response
            List<Map<String, Object>> orderData = paginatedOrders.stream()
                .map(this::convertToOrderDTO)
                .collect(Collectors.toList());
            
            // Pagination info
            Map<String, Object> pagination = new HashMap<>();
            pagination.put("currentPage", page);
            pagination.put("totalPages", totalPages);
            pagination.put("totalOrders", totalOrders);
            pagination.put("currentSize", paginatedOrders.size());
            pagination.put("hasNext", page < totalPages - 1);
            pagination.put("hasPrevious", page > 0);
            
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
    
    private Map<String, Object> convertToOrderDTO(CustomOrder order) {
        Map<String, Object> dto = new HashMap<>();
        dto.put("id", order.getId());
        dto.put("status", order.getStatus().toString());
        dto.put("totalPrice", order.getTotalPrice());
        dto.put("createdAt", order.getCreatedAt().toString());
        dto.put("customNotes", order.getCustomNotes());
        dto.put("selectedSwitchType", order.getSelectedSwitchType());
        dto.put("lubingService", order.isLubingService());
        dto.put("stabilizerTuning", order.isStabilizerTuning());
        dto.put("keycapCustomization", order.isKeycapCustomization());
        dto.put("cableCustomization", order.isCableCustomization());
        dto.put("caseModding", order.isCaseModding());
        
        // Base keyboard info
        Map<String, Object> keyboard = new HashMap<>();
        keyboard.put("id", order.getBaseKeyboard().getId());
        keyboard.put("name", order.getBaseKeyboard().getName());
        keyboard.put("image", order.getBaseKeyboard().getImage());
        keyboard.put("price", order.getBaseKeyboard().getPrice());
        dto.put("baseKeyboard", keyboard);
        
        // Selected keycap info
        if (order.getSelectedKeycap() != null) {
            Map<String, Object> keycap = new HashMap<>();
            keycap.put("id", order.getSelectedKeycap().getId());
            keycap.put("name", order.getSelectedKeycap().getName());
            dto.put("selectedKeycap", keycap);
        }
        
        // Selected kit info
        if (order.getSelectedKit() != null) {
            Map<String, Object> kit = new HashMap<>();
            kit.put("id", order.getSelectedKit().getId());
            kit.put("name", order.getSelectedKit().getName());
            dto.put("selectedKit", kit);
        }
        
        return dto;
    }
} 