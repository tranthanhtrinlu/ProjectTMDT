package tri.java.keyboardshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;
import jakarta.servlet.DispatcherType;
import tri.java.keyboardshop.service.CustomUserDetailsService;
import tri.java.keyboardshop.service.UserService;
import tri.java.keyboardshop.service.userinfo.CustomOAuth2UserService;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }

    @Bean
    public DaoAuthenticationProvider authProvider(
            PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        return authProvider;
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler() {
        return new CustomSuccessHandler();
    }

    @Bean
    public SpringSessionRememberMeServices rememberMeServices() {
        SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
        rememberMeServices.setAlwaysRemember(true);
        return rememberMeServices;
    }

    @Bean
    SecurityFilterChain filterChain(
            HttpSecurity http,
            UserService userService) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE)
                        .permitAll()

                        .requestMatchers("/", "/login", "/product/**", "/register",
                                "/verify", "/products/**", "/forgot-password", "/verify-forgot-password",
                                "/client/**", "/css/**", "/js/**", "/images/**")
                        .permitAll()

                        .requestMatchers("/admin/**").hasRole("ADMIN")

                        .requestMatchers("/order/**", "/product/*/comment", "/product/*/review")
                        .authenticated()

                        .anyRequest().authenticated())

                .oauth2Login(oauth2 -> oauth2
                        .loginPage("/login")
                        .successHandler(customSuccessHandler())
                        .failureUrl("/login?error")
                        .userInfoEndpoint(user -> user
                                .userService(new CustomOAuth2UserService(userService))))

                .sessionManagement(sessionManagement -> sessionManagement
                        .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                        .invalidSessionUrl("/logout?expired")
                        .maximumSessions(1)
                        .maxSessionsPreventsLogin(false))

                .logout(logout -> logout
                        .deleteCookies("JSESSIONID")
                        .invalidateHttpSession(true))

                .rememberMe(r -> r.rememberMeServices(rememberMeServices()))

                .formLogin(formLogin -> formLogin
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .successHandler(customSuccessHandler())
                        .permitAll())

                .exceptionHandling(ex -> ex
                        .accessDeniedPage("/access-deny"));

        return http.build();
    }
}