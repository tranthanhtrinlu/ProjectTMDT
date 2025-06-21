package tri.java.keyboardshop.service;

import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.Role;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.domain.dto.RegisterDTO;
import tri.java.keyboardshop.repository.OrderRepository;
import tri.java.keyboardshop.repository.ProductRepository;
import tri.java.keyboardshop.repository.RoleRepository;
import tri.java.keyboardshop.repository.UserRepository;
import java.util.UUID;

import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;

    public UserService(UserRepository userRepository,
            RoleRepository roleRepository,
            ProductRepository productRepository,
            OrderRepository orderRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
    }

    public Page<User> getAllUsers(Pageable page) {
        return this.userRepository.findAll(page);
    }

    public List<User> getAllUsersByEmail(String email) {
        return (List<User>) this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        User eric = this.userRepository.save(user);
        System.out.println(eric);
        return eric;
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void saveUser(User user) {
        this.userRepository.save(user);
    }
    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

//    public User registerDTOtoUser(RegisterDTO registerDTO) {
//        User user = new User();
//        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
//        user.setEmail(registerDTO.getEmail());
//        user.setPassword(registerDTO.getPassword());
//        return user;
//    }

    public String generateVerificationCode() {
        return UUID.randomUUID().toString().substring(0, 6); // Mã 6 ký tự
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        user.setVerificationCode(generateVerificationCode());
        user.setEnabled(false); // Chưa kích hoạt
        return user;
    }

    @Transactional
    public boolean verifyUser(String email, String verificationCode) {
        User user = userRepository.findByEmail(email);
        if (user != null && user.getVerificationCode() != null && user.getVerificationCode().equals(verificationCode)) {
            user.setEnabled(true);
            user.setVerificationCode(null);
            userRepository.save(user); // Đảm bảo lưu thay đổi
            return true;
        }
        return false;
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
        return this.orderRepository.count();
    }
}
