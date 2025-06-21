package tri.java.keyboardshop.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.Order_;
import tri.java.keyboardshop.service.OrderService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

    private final OrderService orderService;

    public AdminOrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping
    public String getDashboard(Model model,
                               @RequestParam("page") Optional<String> pageOptional) {

        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            // page = 1
        }

        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by(Order_.ID).descending());
        Page<Order> ordersPage = this.orderService.fetchAllOrders(pageable);
        List<Order> orders = ordersPage.getContent();

        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ordersPage.getTotalPages());
        return "admin/order/show";
    }

    @GetMapping("/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Order order = this.orderService.fetchOrderById(id)
                .orElseThrow(() -> new IllegalArgumentException("Đơn hàng không tồn tại"));
        model.addAttribute("order", order);
        model.addAttribute("id", id);
        model.addAttribute("orderDetails", order.getOrderDetails());
        return "admin/order/detail";
    }

    @GetMapping("/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newOrder", new Order());
        return "admin/order/delete";
    }

    @PostMapping("/delete")
    public String postDeleteOrder(@ModelAttribute("newOrder") Order order) {
        this.orderService.deleteOrderById(order.getId());
        return "redirect:/admin/order";
    }

    @GetMapping("/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Optional<Order> currentOrder = this.orderService.fetchOrderById(id);
        model.addAttribute("newOrder", currentOrder.orElseThrow(() -> new IllegalArgumentException("Đơn hàng không tồn tại")));
        return "admin/order/update";
    }

    @PostMapping("/update")
    public String handleUpdateOrder(@ModelAttribute("newOrder") Order order) {
        this.orderService.updateOrder(order);
        return "redirect:/admin/order";
    }

    @PostMapping("/confirm/{id}")
    public String confirmOrder(@PathVariable("id") Long orderId) {
        this.orderService.confirmOrder(orderId);
        return "redirect:/admin/order";
    }
}