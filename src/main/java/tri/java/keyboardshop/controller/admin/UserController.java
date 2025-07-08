package tri.java.keyboardshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
<<<<<<< Updated upstream

import jakarta.validation.Valid;
=======
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
>>>>>>> Stashed changes
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.service.UploadService;
import tri.java.keyboardshop.service.UserService;

<<<<<<< Updated upstream
=======
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

>>>>>>> Stashed changes
@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(
            UploadService uploadService,
            UserService userService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("1@gmail.com");
        System.out.println(arrUsers);

        model.addAttribute("tri", "test");
        model.addAttribute("thanhtri", "from controller with model");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model,
            @RequestParam("page") Optional<String> pageOptional,
            @RequestParam("size") Optional<String> sizeOptional,
            @RequestParam("search") Optional<String> searchOptional,
            @RequestParam("role") Optional<String> roleOptional,
            @RequestParam("status") Optional<String> statusOptional,
            @RequestParam("sort") Optional<String> sortOptional,
            @RequestParam("direction") Optional<String> directionOptional) {
        
        // Parse page number
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            page = 1;
        }
        
        // Parse page size
        int size = 10; // Default page size
        try {
            if (sizeOptional.isPresent()) {
                size = Integer.parseInt(sizeOptional.get());
                // Limit max size to prevent performance issues
                size = Math.min(size, 100);
                size = Math.max(size, 5); // Minimum 5 items per page
            }
        } catch (Exception e) {
            size = 10;
        }
        
        // Parse sorting
        String sortField = sortOptional.orElse("id");
        String sortDirection = directionOptional.orElse("asc");
        
        Sort sort = Sort.by(Sort.Direction.fromString(sortDirection), sortField);
        Pageable pageable = PageRequest.of(page - 1, size, sort);
        
        // Get search and filter parameters
        String search = searchOptional.orElse("");
        String role = roleOptional.orElse("");
        String status = statusOptional.orElse("");
        
        // Get users with search and filter
        Page<User> usersPage = this.userService.getAllUsersWithFilters(pageable, search, role, status);
        List<User> users = usersPage.getContent();
        
        // Debug: Log user data
        System.out.println("=== DEBUG: UserController getUserPage ===");
        System.out.println("Total users found: " + users.size());
        for (int i = 0; i < users.size(); i++) {
            User user = users.get(i);
            System.out.println("User " + (i+1) + ": ID=" + user.getId() + 
                             ", Name=" + user.getFullName() + 
                             ", Email=" + user.getEmail() +
                             ", Role=" + (user.getRole() != null ? user.getRole().getName() : "NULL"));
        }
        System.out.println("=== END DEBUG ===");
        
        // Get statistics
        long totalUsers = this.userService.countUsers();
        long activeUsers = this.userService.countActiveUsers();
        long adminUsers = this.userService.countAdminUsers(); 
        long todayRegistrations = this.userService.countTodayRegistrations();
        
        // Add attributes to model
        model.addAttribute("users", users);
        model.addAttribute("currentPage", page - 1); // Convert to 0-based for JSP
        model.addAttribute("totalPages", usersPage.getTotalPages());
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("pageSize", size);
        
        // Add statistics
        model.addAttribute("activeUsers", activeUsers);
        model.addAttribute("adminUsers", adminUsers);
        model.addAttribute("todayRegistrations", todayRegistrations);
        
        // Build search params for pagination links
        StringBuilder searchParams = new StringBuilder();
        if (!search.isEmpty()) {
            searchParams.append("search=").append(search).append("&");
        }
        if (!role.isEmpty()) {
            searchParams.append("role=").append(role).append("&");
        }
        if (!status.isEmpty()) {
            searchParams.append("status=").append(status).append("&");
        }
        if (!sortField.equals("id")) {
            searchParams.append("sort=").append(sortField).append("&");
        }
        if (!sortDirection.equals("asc")) {
            searchParams.append("direction=").append(sortDirection).append("&");
        }
        if (size != 10) {
            searchParams.append("size=").append(size).append("&");
        }
        
        // Remove trailing &
        String searchParamsStr = searchParams.toString();
        if (searchParamsStr.endsWith("&")) {
            searchParamsStr = searchParamsStr.substring(0, searchParamsStr.length() - 1);
        }
        
        model.addAttribute("searchParams", searchParamsStr);
        
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println("=== DEBUG: getUserDetailPage called with ID: " + id + " ===");
        User user = this.userService.getUserById(id);
        if (user == null) {
            System.out.println("ERROR: User not found with ID: " + id);
            return "redirect:/admin/user";
        }
        System.out.println("Found user: " + user.getId() + " - " + user.getFullName() + " - " + user.getEmail());
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }
    
    @GetMapping("/admin/user/{id}/detail")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getUserDetailAjax(@PathVariable long id) {
        Map<String, Object> response = new HashMap<>();
        try {
            System.out.println("Getting user detail for ID: " + id);
            User user = this.userService.getUserById(id);
            if (user != null) {
                StringBuilder html = new StringBuilder();
                html.append("<div class='grid grid-cols-1 md:grid-cols-2 gap-6'>");
                
                // Left column - Profile
                html.append("<div class='text-center'>");
                html.append("<div class='mx-auto w-32 h-32 mb-4'>");
                if (user.getAvatar() != null && !user.getAvatar().isEmpty()) {
                    html.append("<img class='w-32 h-32 rounded-full object-cover border-4 border-blue-500' ");
                    html.append("src='/images/avatar/").append(user.getAvatar()).append("' ");
                    html.append("alt='").append(user.getFullName() != null ? user.getFullName() : "User").append("'>");
                } else {
                    html.append("<div class='w-32 h-32 rounded-full bg-gray-300 flex items-center justify-center border-4 border-blue-500'>");
                    html.append("<i class='fas fa-user text-4xl text-gray-500'></i>");
                    html.append("</div>");
                }
                html.append("</div>");
                html.append("<h4 class='text-xl font-bold text-gray-800'>").append(user.getFullName() != null ? user.getFullName() : "N/A").append("</h4>");
                html.append("<p class='text-gray-600'>").append(user.getEmail() != null ? user.getEmail() : "N/A").append("</p>");
                
                // Role badge
                if (user.getRole() != null && "ADMIN".equals(user.getRole().getName())) {
                    html.append("<span class='inline-block px-3 py-1 text-sm bg-purple-100 text-purple-800 rounded-full mt-2'>");
                    html.append("<i class='fas fa-shield-alt mr-1'></i>Quản trị viên</span>");
                } else {
                    html.append("<span class='inline-block px-3 py-1 text-sm bg-blue-100 text-blue-800 rounded-full mt-2'>");
                    html.append("<i class='fas fa-user mr-1'></i>Khách hàng</span>");
                }
                html.append("</div>");
                
                // Right column - Details
                html.append("<div>");
                html.append("<h5 class='text-lg font-semibold text-gray-800 mb-4'>Thông tin chi tiết</h5>");
                html.append("<div class='space-y-3'>");
                
                html.append("<div class='flex justify-between'>");
                html.append("<span class='text-gray-600'>ID:</span>");
                html.append("<span class='font-medium'>#").append(user.getId()).append("</span>");
                html.append("</div>");
                
                html.append("<div class='flex justify-between'>");
                html.append("<span class='text-gray-600'>Số điện thoại:</span>");
                html.append("<span class='font-medium'>").append(user.getPhone() != null ? user.getPhone() : "Chưa cập nhật").append("</span>");
                html.append("</div>");
                
                html.append("<div class='flex justify-between'>");
                html.append("<span class='text-gray-600'>Địa chỉ:</span>");
                html.append("<span class='font-medium'>").append(user.getAddress() != null ? user.getAddress() : "Chưa cập nhật").append("</span>");
                html.append("</div>");
                
                html.append("<div class='flex justify-between'>");
                html.append("<span class='text-gray-600'>Trạng thái:</span>");
                if (user.isEnabled()) {
                    html.append("<span class='font-medium text-green-600'>Đang hoạt động</span>");
                } else {
                    html.append("<span class='font-medium text-red-600'>Bị khóa</span>");
                }
                html.append("</div>");
                
                html.append("<div class='flex justify-between'>");
                html.append("<span class='text-gray-600'>Ngày tạo:</span>");
                html.append("<span class='font-medium'>12/12/2023</span>");
                html.append("</div>");
                
                html.append("</div>");
                html.append("</div>");
                html.append("</div>");
                
                // Action buttons
                html.append("<div class='mt-6 flex justify-end space-x-3'>");
                html.append("<button onclick='window.editUser(\"").append(user.getId()).append("\"); window.closeViewModal();' ");
                html.append("class='bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600'>");
                html.append("<i class='fas fa-edit mr-2'></i>Chỉnh sửa</button>");
                html.append("</div>");
                
                response.put("success", true);
                response.put("html", html.toString());
                System.out.println("User detail response created successfully");
                return ResponseEntity.ok(response);
            } else {
                System.out.println("User not found with ID: " + id);
                response.put("success", false);
                response.put("message", "Không tìm thấy người dùng");
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            System.out.println("Error getting user detail: " + e.getMessage());
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
    
    @GetMapping("/admin/user/{id}/info")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getUserInfo(@PathVariable long id) {
        Map<String, Object> response = new HashMap<>();
        try {
            System.out.println("Getting user info for ID: " + id);
            User user = this.userService.getUserById(id);
            if (user != null) {
                Map<String, Object> userInfo = new HashMap<>();
                userInfo.put("id", user.getId());
                userInfo.put("fullName", user.getFullName());
                userInfo.put("email", user.getEmail());
                userInfo.put("phone", user.getPhone());
                userInfo.put("address", user.getAddress());
                userInfo.put("enabled", user.isEnabled());
                
                if (user.getRole() != null) {
                    Map<String, Object> roleInfo = new HashMap<>();
                    roleInfo.put("name", user.getRole().getName());
                    userInfo.put("role", roleInfo);
                } else {
                    Map<String, Object> roleInfo = new HashMap<>();
                    roleInfo.put("name", "USER");
                    userInfo.put("role", roleInfo);
                }
                
                response.put("success", true);
                response.put("user", userInfo);
                System.out.println("User info response created successfully");
                return ResponseEntity.ok(response);
            } else {
                System.out.println("User not found with ID: " + id);
                response.put("success", false);
                response.put("message", "Không tìm thấy người dùng");
                return ResponseEntity.status(404).body(response);
            }
        } catch (Exception e) {
            System.out.println("Error getting user info: " + e.getMessage());
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @GetMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

<<<<<<< Updated upstream
    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User thanhtri,
            BindingResult newUserBindingResult,
            @RequestParam("thanhtriFile") MultipartFile file) {
=======
    @PostMapping("/admin/user/create")
    public String createUser(Model model,
            @ModelAttribute("newUser") User user,
            @RequestParam(value = "roleName", required = false) String roleName,
            @RequestParam(value = "keyboardstoreFile", required = false) MultipartFile file,
            RedirectAttributes redirectAttributes) {
>>>>>>> Stashed changes

        try {
            // Validate required fields
            if (user.getFullName() == null || user.getFullName().trim().isEmpty() ||
                user.getEmail() == null || user.getEmail().trim().isEmpty() ||
                user.getPassword() == null || user.getPassword().trim().isEmpty() ||
                roleName == null || roleName.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Vui lòng điền đầy đủ các trường bắt buộc");
                return "redirect:/admin/user/create";
            }

            // Check if email already exists
            if (this.userService.checkEmailExist(user.getEmail())) {
                redirectAttributes.addFlashAttribute("error", "Email đã tồn tại trong hệ thống");
                return "redirect:/admin/user/create";
            }

            // Set user fields
            user.setFullName(user.getFullName().trim());
            user.setEmail(user.getEmail().trim());
            user.setPassword(this.passwordEncoder.encode(user.getPassword()));
            user.setPhone(user.getPhone() != null ? user.getPhone().trim() : null);
            user.setAddress(user.getAddress() != null ? user.getAddress().trim() : null);
            user.setEnabled(true); // Default enabled
            
            // Set role
            user.setRole(this.userService.getRoleByName(roleName));
            
            // Handle avatar upload
            if (file != null && !file.isEmpty()) {
                String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
                user.setAvatar(avatar);
            }

            // Save user
            this.userService.handleSaveUser(user);
            
            redirectAttributes.addFlashAttribute("success", "Tạo người dùng thành công");
            return "redirect:/admin/user";
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            return "redirect:/admin/user/create";
        }
    }

<<<<<<< Updated upstream
        //
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(thanhtri.getPassword());

        thanhtri.setAvatar(avatar);
        thanhtri.setPassword(hashPassword);
        thanhtri.setRole(this.userService.getRoleByName(thanhtri.getRole().getName()));
        // save
        this.userService.handleSaveUser(thanhtri);
        return "redirect:/admin/user";
=======
    @PostMapping(value = "/admin/user/create", consumes = "application/x-www-form-urlencoded")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> createUserAjax(
            @RequestParam("fullName") String fullName,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam(value = "phone", required = false) String phone,
            @RequestParam("role") String roleName,
            @RequestParam(value = "address", required = false) String address,
            @RequestParam(value = "keyboardstoreFile", required = false) MultipartFile file) {

        Map<String, Object> response = new HashMap<>();
        
        try {
            // Validate required fields
            if (fullName == null || fullName.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                roleName == null || roleName.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "Vui lòng điền đầy đủ các trường bắt buộc");
                return ResponseEntity.badRequest().body(response);
            }

            // Check if email already exists
            if (this.userService.checkEmailExist(email)) {
                response.put("success", false);
                response.put("message", "Email đã tồn tại trong hệ thống");
                return ResponseEntity.badRequest().body(response);
            }

            // Create new user
            User newUser = new User();
            newUser.setFullName(fullName.trim());
            newUser.setEmail(email.trim());
            newUser.setPassword(this.passwordEncoder.encode(password));
            newUser.setPhone(phone != null ? phone.trim() : null);
            newUser.setAddress(address != null ? address.trim() : null);
            newUser.setEnabled(true); // Default enabled
            
            // Set role
            newUser.setRole(this.userService.getRoleByName(roleName));
            
            // Handle avatar upload
            if (file != null && !file.isEmpty()) {
                String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
                newUser.setAvatar(avatar);
            }

            // Save user
            this.userService.handleSaveUser(newUser);
            
            response.put("success", true);
            response.put("message", "Tạo người dùng thành công");
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
>>>>>>> Stashed changes
    }

    @RequestMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        if (currentUser == null) {
            return "redirect:/admin/user";
        }
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

<<<<<<< Updated upstream
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User thanhtri) {
        User currentUser = this.userService.getUserById(thanhtri.getId());
        if (currentUser != null) {
            currentUser.setAddress(thanhtri.getAddress());
            currentUser.setFullName(thanhtri.getFullName());
            currentUser.setPhone(thanhtri.getPhone());
=======
    @PostMapping("/admin/user/update/{id}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateUserAjax(
            @PathVariable long id,
            @RequestParam("fullName") String fullName,
            @RequestParam("email") String email,
            @RequestParam(value = "phone", required = false) String phone,
            @RequestParam("role") String roleName,
            @RequestParam(value = "address", required = false) String address,
            @RequestParam("enabled") boolean enabled,
            @RequestParam(value = "keyboardstoreFile", required = false) MultipartFile file) {
>>>>>>> Stashed changes

        Map<String, Object> response = new HashMap<>();
        
        try {
            User currentUser = this.userService.getUserById(id);
            if (currentUser == null) {
                response.put("success", false);
                response.put("message", "Không tìm thấy người dùng");
                return ResponseEntity.badRequest().body(response);
            }

            // Validate required fields
            if (fullName == null || fullName.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                roleName == null || roleName.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "Vui lòng điền đầy đủ các trường bắt buộc");
                return ResponseEntity.badRequest().body(response);
            }

            // Check if email already exists (but not for current user)
            User existingUser = this.userService.getUserByEmail(email.trim());
            if (existingUser != null && existingUser.getId() != id) {
                response.put("success", false);
                response.put("message", "Email đã tồn tại trong hệ thống");
                return ResponseEntity.badRequest().body(response);
            }

            // Update user fields
            currentUser.setFullName(fullName.trim());
            currentUser.setEmail(email.trim());
            currentUser.setPhone(phone != null ? phone.trim() : null);
            currentUser.setAddress(address != null ? address.trim() : null);
            currentUser.setEnabled(enabled);
            
            // Update role
            currentUser.setRole(this.userService.getRoleByName(roleName));
            
            // Handle avatar upload
            if (file != null && !file.isEmpty()) {
                String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
                currentUser.setAvatar(avatar);
            }

            // Save user
            this.userService.handleSaveUser(currentUser);
            
            response.put("success", true);
            response.put("message", "Cập nhật người dùng thành công");
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        if (user == null) {
            return "redirect:/admin/user";
        }
        model.addAttribute("id", id);
        model.addAttribute("user", user);
        model.addAttribute("newUser", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User tri) {
        this.userService.deleteAUser(tri.getId());
        return "redirect:/admin/user";
    }
    
    // API endpoints for AJAX operations
    @PostMapping("/admin/user/{id}/toggle-status")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> toggleUserStatus(@PathVariable long id) {
        Map<String, Object> response = new HashMap<>();
        try {
            User user = this.userService.getUserById(id);
            if (user != null) {
                // Toggle active status
                user.setEnabled(!user.isEnabled());
                this.userService.handleSaveUser(user);
                
                String status = user.isEnabled() ? "kích hoạt" : "khóa";
                response.put("success", true);
                response.put("message", "Đã " + status + " tài khoản người dùng thành công");
                response.put("newStatus", user.isEnabled());
                return ResponseEntity.ok(response);
            } else {
                response.put("success", false);
                response.put("message", "Không tìm thấy người dùng");
                return ResponseEntity.badRequest().body(response);
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @DeleteMapping("/admin/user/{id}/delete")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteUserAjax(@PathVariable long id) {
        Map<String, Object> response = new HashMap<>();
        try {
            User user = this.userService.getUserById(id);
            if (user != null) {
                this.userService.deleteAUser(id);
                response.put("success", true);
                response.put("message", "Người dùng đã được xóa thành công");
                return ResponseEntity.ok(response);
            } else {
                response.put("success", false);
                response.put("message", "Không tìm thấy người dùng");
                return ResponseEntity.badRequest().body(response);
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
}
