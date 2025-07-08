package tri.java.keyboardshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
<<<<<<< Updated upstream
=======
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
>>>>>>> Stashed changes
import org.springframework.stereotype.Repository;

import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.User;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);
<<<<<<< Updated upstream
}
=======
    
    // Phân trang cho đơn hàng theo user
    Page<Order> findByUser(User user, Pageable pageable);
    
    // Phân trang với filter theo status
    Page<Order> findByUserAndStatus(User user, Order.OrderStatus status, Pageable pageable);

    Optional<Order> findByPaymentRef(String paymentRef);

    @Query("SELECT new tri.java.keyboardshop.domain.dto.RevenueStatsDTO(" +
            "FUNCTION('DATE_FORMAT', o.createdAt, '%Y-%m-%d'), SUM(o.totalPrice)) " +
            "FROM Order o " +
            "WHERE o.createdAt BETWEEN :startDate AND :endDate " +
            "AND o.paymentStatus = 'PAYMENT_SUCCEED' " +
            "GROUP BY FUNCTION('DATE_FORMAT', o.createdAt, '%Y-%m-%d')")
    List<RevenueStatsDTO> findRevenueByDay(LocalDate startDate, LocalDate endDate);

    @Query("SELECT new tri.java.keyboardshop.domain.dto.RevenueStatsDTO(" +
            "FUNCTION('DATE_FORMAT', o.createdAt, '%Y-%m'), SUM(o.totalPrice)) " +
            "FROM Order o " +
            "WHERE o.createdAt BETWEEN :startDate AND :endDate " +
            "AND o.paymentStatus = 'PAYMENT_SUCCEED' " +
            "GROUP BY FUNCTION('DATE_FORMAT', o.createdAt, '%Y-%m')")
    List<RevenueStatsDTO> findRevenueByMonth(LocalDate startDate, LocalDate endDate);

    @Query("SELECT new tri.java.keyboardshop.domain.dto.RevenueStatsDTO(" +
            "FUNCTION('DATE_FORMAT', o.createdAt, '%Y'), SUM(o.totalPrice)) " +
            "FROM Order o " +
            "WHERE o.createdAt BETWEEN :startDate AND :endDate " +
            "AND o.paymentStatus = 'PAYMENT_SUCCEED' " +
            "GROUP BY FUNCTION('DATE_FORMAT', o.createdAt, '%Y')")
    List<RevenueStatsDTO> findRevenueByYear(LocalDate startDate, LocalDate endDate);

    List<Order> findByUserAndStatus(User user, Order.OrderStatus status);

    @Query("SELECT COUNT(o) > 0 FROM Order o JOIN o.orderDetails od WHERE o.user.id = :userId AND od.product.id = :productId AND o.status = :status")
    boolean existsByUserIdAndProductIdAndStatus(Long userId, Long productId, Order.OrderStatus status);
    
    // Combined revenue queries for both Order and CustomOrder tables
    @Query(value = "SELECT combined_date as date, SUM(combined_revenue) as revenue FROM (" +
            "SELECT DATE_FORMAT(o.created_at, '%Y-%m-%d') as combined_date, SUM(o.total_price) as combined_revenue " +
            "FROM orders o " +
            "WHERE DATE(o.created_at) BETWEEN :startDate AND :endDate " +
            "AND o.payment_status = 'PAYMENT_SUCCEED' " +
            "GROUP BY DATE_FORMAT(o.created_at, '%Y-%m-%d') " +
            "UNION ALL " +
            "SELECT DATE_FORMAT(co.created_at, '%Y-%m-%d') as combined_date, SUM(co.total_price) as combined_revenue " +
            "FROM custom_orders co " +
            "WHERE DATE(co.created_at) BETWEEN :startDate AND :endDate " +
            "AND co.status IN ('READY', 'SHIPPED') " +
            "GROUP BY DATE_FORMAT(co.created_at, '%Y-%m-%d')" +
            ") combined " +
            "GROUP BY combined_date " +
            "ORDER BY combined_date", nativeQuery = true)
    List<Object[]> findCombinedRevenueByDay(@Param("startDate") String startDate, @Param("endDate") String endDate);
    
    @Query(value = "SELECT combined_date as date, SUM(combined_revenue) as revenue FROM (" +
            "SELECT DATE_FORMAT(o.created_at, '%Y-%m') as combined_date, SUM(o.total_price) as combined_revenue " +
            "FROM orders o " +
            "WHERE DATE(o.created_at) BETWEEN :startDate AND :endDate " +
            "AND o.payment_status = 'PAYMENT_SUCCEED' " +
            "GROUP BY DATE_FORMAT(o.created_at, '%Y-%m') " +
            "UNION ALL " +
            "SELECT DATE_FORMAT(co.created_at, '%Y-%m') as combined_date, SUM(co.total_price) as combined_revenue " +
            "FROM custom_orders co " +
            "WHERE DATE(co.created_at) BETWEEN :startDate AND :endDate " +
            "AND co.status IN ('READY', 'SHIPPED') " +
            "GROUP BY DATE_FORMAT(co.created_at, '%Y-%m')" +
            ") combined " +
            "GROUP BY combined_date " +
            "ORDER BY combined_date", nativeQuery = true)
    List<Object[]> findCombinedRevenueByMonth(@Param("startDate") String startDate, @Param("endDate") String endDate);
    
    @Query(value = "SELECT combined_date as date, SUM(combined_revenue) as revenue FROM (" +
            "SELECT DATE_FORMAT(o.created_at, '%Y') as combined_date, SUM(o.total_price) as combined_revenue " +
            "FROM orders o " +
            "WHERE DATE(o.created_at) BETWEEN :startDate AND :endDate " +
            "AND o.payment_status = 'PAYMENT_SUCCEED' " +
            "GROUP BY DATE_FORMAT(o.created_at, '%Y') " +
            "UNION ALL " +
            "SELECT DATE_FORMAT(co.created_at, '%Y') as combined_date, SUM(co.total_price) as combined_revenue " +
            "FROM custom_orders co " +
            "WHERE DATE(co.created_at) BETWEEN :startDate AND :endDate " +
            "AND co.status IN ('READY', 'SHIPPED') " +
            "GROUP BY DATE_FORMAT(co.created_at, '%Y')" +
            ") combined " +
            "GROUP BY combined_date " +
            "ORDER BY combined_date", nativeQuery = true)
    List<Object[]> findCombinedRevenueByYear(@Param("startDate") String startDate, @Param("endDate") String endDate);
}
>>>>>>> Stashed changes
