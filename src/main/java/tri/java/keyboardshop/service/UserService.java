package tri.java.keyboardshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tri.java.keyboardshop.domain.Role;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.domain.dto.RegisterDTO;
import tri.java.keyboardshop.repository.CustomOrderRepository;
import tri.java.keyboardshop.repository.OrderRepository;
import tri.java.keyboardshop.repository.ProductRepository;
import tri.java.keyboardshop.repository.RoleRepository;
import tri.java.keyboardshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;
    private final CustomOrderRepository customOrderRepository;

    public UserService(UserRepository userRepository,
            RoleRepository roleRepository,
            ProductRepository productRepository,
            OrderRepository orderRepository,
            CustomOrderRepository customOrderRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
        this.customOrderRepository = customOrderRepository;
    }

    public Page<User> getAllUsers(Pageable page) {
        return this.userRepository.findAll(page);
    }
    
    public Page<User> getAllUsersWithFilters(Pageable pageable, String search, String role, String status) {
        return this.userRepository.findUsersWithFilters(search, role, status, pageable);
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        User eric = this.userRepository.save(user);
        System.out.println(eric);
        return eric;
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countProducts() {
        return this.productRepository.count();
    }

    public long countOrders() {
        // Count from both regular orders and custom orders
        long regularOrders = this.orderRepository.count();
        long customOrders = this.customOrderRepository.count();
        return regularOrders + customOrders;
    }
    
    public long countActiveUsers() {
        return this.userRepository.countByEnabled(true);
    }
    
    public long countAdminUsers() {
        return this.userRepository.countByRoleName("ADMIN");
    }
    
    public long countTodayRegistrations() {
        // TODO: This should count actual today registrations
        // For now return a placeholder value since User entity doesn't have createdAt field
        // To implement properly, add createdAt field to User entity and update the query
        return Math.min(3, this.userRepository.count()); // Return max 3 or total users if less
    }
}
