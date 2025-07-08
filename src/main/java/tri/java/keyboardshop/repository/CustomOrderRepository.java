package tri.java.keyboardshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tri.java.keyboardshop.domain.CustomOrder;
import tri.java.keyboardshop.domain.User;

import java.util.List;

@Repository
public interface CustomOrderRepository extends JpaRepository<CustomOrder, Long> {
    
    List<CustomOrder> findByUserOrderByCreatedAtDesc(User user);
    
    @Query("SELECT co FROM CustomOrder co WHERE co.user.id = :userId ORDER BY co.createdAt DESC")
    List<CustomOrder> findByUserIdOrderByCreatedAtDesc(@Param("userId") Long userId);
    
    @Query("SELECT co FROM CustomOrder co WHERE co.status = :status ORDER BY co.createdAt DESC")
    List<CustomOrder> findByStatusOrderByCreatedAtDesc(@Param("status") String status);
} 