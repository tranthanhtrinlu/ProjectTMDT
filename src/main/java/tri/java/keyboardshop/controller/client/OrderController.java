package tri.java.keyboardshop.controller.client;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.service.CustomUserDetails;
import tri.java.keyboardshop.service.OrderService;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/history")
    public String showOrderHistory(Model model, @AuthenticationPrincipal CustomUserDetails userDetails) {
        List<Order> orders = orderService.fetchOrderByUser(userDetails.getUser());
        model.addAttribute("orders", orders);
        return "client/cart/order-history";
    }

    @PostMapping("/cancel/{id}")
    public String cancelOrder(@PathVariable("id") Long orderId, @AuthenticationPrincipal CustomUserDetails userDetails) {
        orderService.cancelOrder(orderId, userDetails.getUser());
        return "redirect:/order/history";
    }
}