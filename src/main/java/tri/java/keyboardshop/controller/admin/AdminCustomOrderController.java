package tri.java.keyboardshop.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tri.java.keyboardshop.domain.CustomOrder;
import tri.java.keyboardshop.domain.CustomOrderStatus;
import tri.java.keyboardshop.service.CustomOrderService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/admin/custom-order")
public class AdminCustomOrderController {

    private final CustomOrderService customOrderService;

    public AdminCustomOrderController(CustomOrderService customOrderService) {
        this.customOrderService = customOrderService;
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

        // Lấy tất cả custom orders và sắp xếp theo ID giảm dần
        List<CustomOrder> allCustomOrders = this.customOrderService.findAllOrders();
        allCustomOrders.sort((a, b) -> Long.compare(b.getId(), a.getId()));
        
        // Simple pagination
        int totalOrders = allCustomOrders.size();
        int totalPages = (int) Math.ceil((double) totalOrders / 10);
        
        // Ensure page is within bounds
        if (page < 1) page = 1;
        if (page > totalPages && totalPages > 0) page = totalPages;
        if (totalPages == 0) page = 1;
        
        int startIndex = (page - 1) * 10;
        int endIndex = Math.min(startIndex + 10, totalOrders);
        
        List<CustomOrder> customOrders;
        if (startIndex < totalOrders) {
            customOrders = allCustomOrders.subList(startIndex, endIndex);
        } else {
            customOrders = List.of(); // Empty list if no orders
        }

        model.addAttribute("customOrders", customOrders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        
        return "admin/custom-order/show";
    }

    @GetMapping("/{id}")
    public String getCustomOrderDetailPage(Model model, @PathVariable long id) {
        Optional<CustomOrder> customOrderOptional = this.customOrderService.findById(id);
        if (!customOrderOptional.isPresent()) {
            throw new IllegalArgumentException("Đơn hàng custom không tồn tại");
        }
        
        CustomOrder customOrder = customOrderOptional.get();
        model.addAttribute("customOrder", customOrder);
        model.addAttribute("id", id);
        
        return "admin/custom-order/detail";
    }

    @PostMapping("/update-status")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateCustomOrderStatus(
            @RequestParam("customOrderId") Long customOrderId, 
            @RequestParam("status") String status) {
        
        Map<String, Object> response = new HashMap<>();
        try {
            Optional<CustomOrder> customOrderOptional = this.customOrderService.findById(customOrderId);
            if (!customOrderOptional.isPresent()) {
                response.put("success", false);
                response.put("message", "Đơn hàng custom không tồn tại");
                return ResponseEntity.badRequest().body(response);
            }
            
            CustomOrder customOrder = customOrderOptional.get();
            CustomOrderStatus newStatus = CustomOrderStatus.valueOf(status);
            customOrder.setStatus(newStatus);
            this.customOrderService.updateCustomOrder(customOrder);
            
            response.put("success", true);
            response.put("message", "Cập nhật trạng thái đơn hàng thành công");
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @PostMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteCustomOrder(@PathVariable("id") Long customOrderId) {
        Map<String, Object> response = new HashMap<>();
        try {
            Optional<CustomOrder> customOrderOptional = this.customOrderService.findById(customOrderId);
            if (!customOrderOptional.isPresent()) {
                response.put("success", false);
                response.put("message", "Đơn hàng custom không tồn tại");
                return ResponseEntity.badRequest().body(response);
            }
            
            this.customOrderService.deleteCustomOrder(customOrderId);
            
            response.put("success", true);
            response.put("message", "Xóa đơn hàng custom thành công");
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
}
