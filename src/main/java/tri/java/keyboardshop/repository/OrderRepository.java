package tri.java.keyboardshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.Product;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.domain.dto.RevenueStatsDTO;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);

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
}