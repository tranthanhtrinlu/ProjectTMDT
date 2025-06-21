package tri.java.keyboardshop.controller.client;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
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
import org.springframework.web.bind.annotation.RequestParam;
import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.Product;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.domain.dto.RegisterDTO;
import tri.java.keyboardshop.service.EmailService;
import tri.java.keyboardshop.service.OrderService;
import tri.java.keyboardshop.service.ProductService;
import tri.java.keyboardshop.service.UserService;

import java.util.List;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;
    private final EmailService emailService;

    public HomePageController(
            ProductService productService,
            UserService userService,
            PasswordEncoder passwordEncoder,
            OrderService orderService,
            EmailService emailService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
        this.emailService = emailService;
    }


    @GetMapping("/forgot-password")
    public String getForgotPasswordPage(Model model) {
        model.addAttribute("email", "");
        return "client/auth/forgot-password";
    }
    @PostMapping("/forgot-password")
    public String handleForgotPassword(
            @RequestParam("email") String email,
            Model model,
            HttpSession session) throws MessagingException {

        System.out.println("Processing forgot password for email: " + email); // Debug log

        User user = userService.getUserByEmail(email);
        if (user == null) {
            model.addAttribute("error", "Email not found.");
            model.addAttribute("email", email);
            return "client/auth/forgot-password";
        }

        String verificationCode = userService.generateVerificationCode();
        user.setVerificationCode(verificationCode);
        userService.handleSaveUser(user); // Cập nhật mã xác nhận

        try {
            emailService.sendVerificationEmail(email, verificationCode, "forgot-password");
            System.out.println("Verification email sent to: " + email); // Debug log
        } catch (MessagingException e) {
            System.out.println("Failed to send verification email: " + e.getMessage()); // Debug log
            model.addAttribute("error", "Failed to send verification email. Please try again later. Error: " + e.getMessage());
            model.addAttribute("email", email);
            return "client/auth/forgot-password";
        }

        session.setAttribute("forgotEmail", email);
        model.addAttribute("email", email);
        model.addAttribute("verificationCode", "");
        return "client/auth/verify-forgot-password"; // Chuyển hướng
    }

    @PostMapping("/verify-forgot-password")
    public String handleVerifyForgotPassword(
            @RequestParam("email") String email,
            @RequestParam("verificationCode") String verificationCode,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            Model model,
            HttpSession session) {

        String forgotEmail = (String) session.getAttribute("forgotEmail");
        if (!email.equals(forgotEmail)) {
            model.addAttribute("error", "Invalid email.");
            model.addAttribute("email", email);
            model.addAttribute("verificationCode", verificationCode);
            return "client/auth/verify-forgot-password";
        }

        User user = userService.getUserByEmail(email);
        if (user == null || !user.getVerificationCode().equals(verificationCode)) {
            model.addAttribute("error", "Invalid verification code.");
            model.addAttribute("email", email);
            model.addAttribute("verificationCode", verificationCode);
            return "client/auth/verify-forgot-password";
        }

        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            model.addAttribute("email", email);
            model.addAttribute("verificationCode", verificationCode);
            return "client/auth/verify-forgot-password";
        }

        String hashedPassword = passwordEncoder.encode(newPassword);
        user.setPassword(hashedPassword);
        user.setVerificationCode(null); // Xóa mã xác nhận sau khi reset
        userService.handleSaveUser(user);

        model.addAttribute("message", "Password reset successfully. Please login with your new password.");
        session.removeAttribute("forgotEmail");
        return "client/auth/verify-forgot-password";
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

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(
            @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult,
            HttpSession session) throws MessagingException {

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));

        // Lưu user vào DB
        this.userService.handleSaveUser(user);

        // Gửi email xác nhận
        this.emailService.sendVerificationEmail(user.getEmail(), user.getVerificationCode(), "registration");

        // Lưu email vào session để sử dụng ở bước xác nhận
        session.setAttribute("email", user.getEmail());

        return "redirect:/verify";
    }

    @GetMapping("/verify")
    public String getVerifyPage(Model model) {
        model.addAttribute("email", "");
        model.addAttribute("verificationCode", "");
        return "client/auth/verify";
    }

    @PostMapping("/verify")
    public String handleVerify(
            @RequestParam("email") String email,
            @RequestParam("verificationCode") String verificationCode,
            Model model) {
        boolean isVerified = userService.verifyUser(email, verificationCode);
        if (isVerified) {
            return "redirect:/";
        } else {
            model.addAttribute("error", "Mã xác nhận hoặc email không đúng.");
            model.addAttribute("email", email);
            model.addAttribute("verificationCode", verificationCode);
            return "client/auth/verify";
        }
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

}
