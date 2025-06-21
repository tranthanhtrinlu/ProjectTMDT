package tri.java.keyboardshop.service;

import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.User;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserService userService;

    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = this.userService.getUserByEmail(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with email: " + username);
        }
        if (!user.isEnabled()) {
            throw new DisabledException("User account is not verified. Please check your email for the verification code.");
        }
        if (user.getRole() == null) {
            throw new UsernameNotFoundException("User role is not assigned.");
        }

        return new CustomUserDetails(user); // ✅ Trả về custom user
    }
}
