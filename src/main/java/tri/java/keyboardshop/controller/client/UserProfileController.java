package tri.java.keyboardshop.controller.client;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.domain.dto.ChangePasswordDTO;
import tri.java.keyboardshop.domain.dto.UserProfileDTO;
import tri.java.keyboardshop.service.CustomUserDetails;
import tri.java.keyboardshop.service.UploadService;
import tri.java.keyboardshop.service.UserService;

@Controller
@RequestMapping("/profile")
public class UserProfileController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserProfileController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // Hiển thị trang profile
    @GetMapping("")
    public String showProfile(Model model, Authentication authentication) {
        if (authentication != null && authentication.getPrincipal() instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
            // Lấy user mới nhất từ database thay vì từ session
            User currentUser = userService.getUserById(userDetails.getUser().getId());
            
            // Debug: In ra avatar từ database
            System.out.println("=== DEBUG PROFILE ===");
            System.out.println("User ID: " + currentUser.getId());
            System.out.println("Avatar from DB: " + currentUser.getAvatar());
            System.out.println("Avatar is null: " + (currentUser.getAvatar() == null));
            System.out.println("Avatar is empty: " + (currentUser.getAvatar() != null && currentUser.getAvatar().isEmpty()));
            
            // Convert User to DTO - chỉ set default khi avatar thực sự null hoặc rỗng
            String avatarToUse = (currentUser.getAvatar() == null || currentUser.getAvatar().trim().isEmpty()) 
                ? "default-avatar.jpg" 
                : currentUser.getAvatar();
            
            UserProfileDTO profileDTO = new UserProfileDTO(
                currentUser.getId(),
                currentUser.getEmail(),
                currentUser.getFullName(),
                currentUser.getAddress(),
                currentUser.getPhone(),
                avatarToUse
            );
            
            System.out.println("Avatar in DTO: " + profileDTO.getAvatar());
            System.out.println("===================");
            
            model.addAttribute("userProfile", profileDTO);
            model.addAttribute("currentUser", currentUser);
            return "client/profile/show";
        }
        return "redirect:/login";
    }

    // Hiển thị form chỉnh sửa profile
    @GetMapping("/edit")
    public String editProfile(Model model, Authentication authentication) {
        if (authentication != null && authentication.getPrincipal() instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
            // Lấy user mới nhất từ database thay vì từ session
            User currentUser = userService.getUserById(userDetails.getUser().getId());
            
            // Debug: In ra avatar từ database
            System.out.println("=== DEBUG EDIT PROFILE ===");
            System.out.println("User ID: " + currentUser.getId());
            System.out.println("Avatar from DB: " + currentUser.getAvatar());
            System.out.println("Avatar is null: " + (currentUser.getAvatar() == null));
            System.out.println("Avatar is empty: " + (currentUser.getAvatar() != null && currentUser.getAvatar().isEmpty()));
            
            // Convert User to DTO - chỉ set default khi avatar thực sự null hoặc rỗng
            String avatarToUse = (currentUser.getAvatar() == null || currentUser.getAvatar().trim().isEmpty()) 
                ? "default-avatar.jpg" 
                : currentUser.getAvatar();
            
            UserProfileDTO profileDTO = new UserProfileDTO(
                currentUser.getId(),
                currentUser.getEmail(),
                currentUser.getFullName(),
                currentUser.getAddress(),
                currentUser.getPhone(),
                avatarToUse
            );
            
            System.out.println("Avatar in DTO: " + profileDTO.getAvatar());
            System.out.println("=========================");
            
            model.addAttribute("userProfile", profileDTO);
            return "client/profile/edit";
        }
        return "redirect:/login";
    }

    // Cập nhật profile
    @PostMapping("/update")
    public String updateProfile(@Valid @ModelAttribute("userProfile") UserProfileDTO profileDTO,
                              BindingResult result,
                              @RequestParam(value = "avatarFile", required = false) MultipartFile file,
                              Authentication authentication,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {
        
        if (result.hasErrors()) {
            return "client/profile/edit";
        }
        
        if (authentication != null && authentication.getPrincipal() instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
            // Lấy user mới nhất từ database để đảm bảo có avatar hiện tại
            User currentUser = userService.getUserById(userDetails.getUser().getId());
            
            // Debug: Kiểm tra avatar trước khi update
            System.out.println("=== DEBUG UPDATE ===");
            System.out.println("Avatar before update: " + currentUser.getAvatar());
            System.out.println("File uploaded: " + (file != null && !file.isEmpty()));
            
            // Cập nhật thông tin
            currentUser.setFullName(profileDTO.getFullName());
            currentUser.setAddress(profileDTO.getAddress());
            currentUser.setPhone(profileDTO.getPhone());
            
            // Xử lý upload avatar nếu có
            if (file != null && !file.isEmpty()) {
                String avatar = uploadService.handleSaveUploadFile(file, "avatar");
                currentUser.setAvatar(avatar);
                
                // Cập nhật session
                session.setAttribute("avatar", avatar);
                System.out.println("New avatar uploaded: " + avatar);
            } else {
                System.out.println("No file uploaded - keeping existing avatar: " + currentUser.getAvatar());
            }
            // Nếu không upload file mới, KHÔNG làm gì với avatar - giữ nguyên avatar hiện tại
            
            // Cập nhật session fullName
            session.setAttribute("fullName", currentUser.getFullName());
            
            // Lưu user
            userService.saveUser(currentUser);
            
            System.out.println("Avatar after save: " + currentUser.getAvatar());
            System.out.println("===================");
            
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thông tin thành công!");
            return "redirect:/profile";
        }
        
        return "redirect:/login";
    }

    // Hiển thị form đổi mật khẩu
    @GetMapping("/change-password")
    public String changePasswordForm(Model model) {
        model.addAttribute("changePasswordDTO", new ChangePasswordDTO());
        return "client/profile/change-password";
    }

    // Xử lý đổi mật khẩu
    @PostMapping("/change-password")
    public String changePassword(@Valid @ModelAttribute("changePasswordDTO") ChangePasswordDTO changePasswordDTO,
                               BindingResult result,
                               Authentication authentication,
                               RedirectAttributes redirectAttributes) {
        
        if (result.hasErrors()) {
            return "client/profile/change-password";
        }
        
        // Kiểm tra mật khẩu mới và xác nhận có khớp không
        if (!changePasswordDTO.getNewPassword().equals(changePasswordDTO.getConfirmPassword())) {
            result.rejectValue("confirmPassword", "error.confirmPassword", "Mật khẩu xác nhận không khớp");
            return "client/profile/change-password";
        }
        
        if (authentication != null && authentication.getPrincipal() instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
            User currentUser = userDetails.getUser();
            
            // Kiểm tra mật khẩu hiện tại
            if (!passwordEncoder.matches(changePasswordDTO.getCurrentPassword(), currentUser.getPassword())) {
                result.rejectValue("currentPassword", "error.currentPassword", "Mật khẩu hiện tại không đúng");
                return "client/profile/change-password";
            }
            
            // Mã hóa và lưu mật khẩu mới
            String newEncodedPassword = passwordEncoder.encode(changePasswordDTO.getNewPassword());
            currentUser.setPassword(newEncodedPassword);
            userService.saveUser(currentUser);
            
            redirectAttributes.addFlashAttribute("successMessage", "Đổi mật khẩu thành công!");
            return "redirect:/profile";
        }
        
        return "redirect:/login";
    }
} 