package tri.java.keyboardshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tri.java.keyboardshop.domain.User;
import java.util.List;

//crud: create, read, update, delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User eric);

    void deleteById(long id);

    List<User> findOneByEmail(String email);

    List<User> findAll();

    User findById(long id); // null

    boolean existsByEmail(String email);
<<<<<<< Updated upstream

    User findByEmail(String email);
=======
    User findByEmail(String email); // Giữ nguyên
    
    // Search and filter methods
    @Query("SELECT u FROM User u WHERE " +
           "(:search IS NULL OR :search = '' OR " +
           "LOWER(u.fullName) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
           "LOWER(u.email) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
           "LOWER(u.phone) LIKE LOWER(CONCAT('%', :search, '%'))) AND " +
           "(:role IS NULL OR :role = '' OR u.role.name = :role) AND " +
           "(:status IS NULL OR :status = '' OR " +
           "(:status = 'active' AND u.enabled = true) OR " +
           "(:status = 'inactive' AND u.enabled = false))")
    Page<User> findUsersWithFilters(@Param("search") String search, 
                                  @Param("role") String role, 
                                  @Param("status") String status, 
                                  Pageable pageable);
    
    // Find by role
    Page<User> findByRoleName(String roleName, Pageable pageable);
    
    // Find by enabled status
    Page<User> findByEnabled(boolean enabled, Pageable pageable);
    
    // Search by name or email
    @Query("SELECT u FROM User u WHERE " +
           "LOWER(u.fullName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           "LOWER(u.email) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    Page<User> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);
    
    // Count methods for statistics
    long countByEnabled(boolean enabled);
    
    long countByRoleName(String roleName);
>>>>>>> Stashed changes
}
