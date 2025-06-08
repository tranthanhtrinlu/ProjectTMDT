package tri.java.keyboardshop.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.Product;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.domain.dto.RegisterDTO;
import tri.java.keyboardshop.service.OrderService;
import tri.java.keyboardshop.service.ProductService;
import tri.java.keyboardshop.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;

    public HomePageController(
            ProductService productService,
            UserService userService,
            PasswordEncoder passwordEncoder,
            OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        // List<Product> products = this.productService.fetchProducts();
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> products = prs.getContent();

        model.addAttribute("products", products);
        return "client/homepage/show";
    }
    @GetMapping("/show")
    public String getShowPage(Model model) {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> products = prs.getContent();
        model.addAttribute("products", products);
        return "client/product/show"; // Sử dụng cùng view với trang chủ nếu muốn
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(
            @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        // validate
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        // save
        this.userService.handleSaveUser(user);
        return "redirect:/login";

    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {

        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {

        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = this.orderService.fetchOrderByUser(currentUser);
        model.addAttribute("orders", orders);

        return "client/cart/order-history";
    }
    @GetMapping("/profile/edit")
    public String showEditProfilePage(Model model, HttpSession session) {
        return "client/profile/edit-profile";
    }
    @GetMapping("/profile/change-password")
    public String showChangePasswordPage(HttpSession session) {
        if (session.getAttribute("id") == null) {
            return "redirect:/login"; // Chuyển hướng nếu chưa đăng nhập
        }
       return "client/profile/change-password";
    }

    @GetMapping("/custom")
    public String showCustomKeyboardPage(Model model) {
        return "client/service/custom-keyboard";
    }

    @GetMapping("/about-us")
    public String showAboutUsPage(Model model) {
        return "client/service/about-us";
    }

    @GetMapping("/support")
    public String showSupportPage(Model model) {
        return "client/service/support";
    }

    @PostMapping("/custom/submit")
    public String submitCustomRequest(
            Model model) {
        // Logic xử lý yêu cầu tùy chỉnh (lưu vào database hoặc gửi email)
        model.addAttribute("success", "Yêu cầu của bạn đã được gửi thành công!");
        return "redirect:/custom";
    }
    @GetMapping("/contact")
    public String showContactPage(Model model) {
        return "client/service/contact";
    }

    @PostMapping("/contact/submit")
    public String submitContactForm() {
            return "client/service/thank-you"; // Chuyển hướng đến trang cảm ơn
    }


}
