package tri.java.keyboardshop.controller.client;

import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import tri.java.keyboardshop.service.ProductService;

import org.springframework.http.ResponseEntity;
<<<<<<< Updated upstream
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
=======
import org.springframework.web.bind.annotation.*;
import tri.java.keyboardshop.service.ProductService;
import java.util.HashMap;
import java.util.Map;
>>>>>>> Stashed changes

class CartRequest {
    private long quantity;
    private long productId;

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }
}

@RestController
public class CartAPI {

    private final ProductService productService;

    public CartAPI(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/api/add-product-to-cart")
    public ResponseEntity<?> addProductToCart(
            @RequestBody() CartRequest cartRequest,
            HttpServletRequest request) {

        try {
            HttpSession session = request.getSession(false);
            String email = (String) session.getAttribute("email");
            this.productService.handleAddProductToCart(email, cartRequest.getProductId(), session,
                    cartRequest.getQuantity());

            int sum = (int) session.getAttribute("sum");
            
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("sum", sum);
            response.put("message", "Sản phẩm đã được thêm vào giỏ hàng!");

            return ResponseEntity.ok().body(response);
        } catch (IllegalStateException e) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(response);
        } catch (Exception e) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng!");
            return ResponseEntity.badRequest().body(response);
        }
    }

    @DeleteMapping("/api/remove-cart-product/{id}")
    public ResponseEntity<?> removeCartProduct(
            @PathVariable long id, 
            HttpServletRequest request) {
        
        try {
            HttpSession session = request.getSession(false);
            this.productService.handleRemoveCartDetail(id, session);
            
            int sum = (int) session.getAttribute("sum");
            
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("sum", sum);
            response.put("message", "Sản phẩm đã được xóa khỏi giỏ hàng!");
            
            return ResponseEntity.ok().body(response);
        } catch (Exception e) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra khi xóa sản phẩm khỏi giỏ hàng!");
            return ResponseEntity.badRequest().body(response);
        }
    }
}
