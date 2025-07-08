package tri.java.keyboardshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
<<<<<<< Updated upstream
=======
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
>>>>>>> Stashed changes
import org.springframework.stereotype.Repository;

import tri.java.keyboardshop.domain.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

<<<<<<< Updated upstream
}
=======
    @Query("SELECT p.target, SUM(od.price * od.quantity) " +
            "FROM OrderDetail od " +
            "JOIN od.product p " +
            "JOIN od.order o " +
            "WHERE YEAR(o.createdAt) = :year AND MONTH(o.createdAt) = :month " +
            "AND o.paymentStatus = 'PAYMENT_SUCCEED' " +
            "GROUP BY p.target")
    List<Object[]> findRevenueByCategory(int year, int month);
    
    // Combined category revenue from both Order and CustomOrder
    @Query(value = "SELECT combined_category, SUM(combined_revenue) FROM (" +
            "SELECT COALESCE(p.target, 'Custom Order') as combined_category, SUM(od.price * od.quantity) as combined_revenue " +
            "FROM order_detail od " +
            "JOIN products p ON od.product_id = p.id " +
            "JOIN orders o ON od.order_id = o.id " +
            "WHERE YEAR(o.created_at) = :year AND MONTH(o.created_at) = :month " +
            "AND o.payment_status = 'PAYMENT_SUCCEED' " +
            "GROUP BY p.target " +
            "UNION ALL " +
            "SELECT 'Custom Order' as combined_category, SUM(co.total_price) as combined_revenue " +
            "FROM custom_orders co " +
            "WHERE YEAR(co.created_at) = :year AND MONTH(co.created_at) = :month " +
            "AND co.status IN ('READY', 'SHIPPED') " +
            ") combined " +
            "GROUP BY combined_category " +
            "ORDER BY SUM(combined_revenue) DESC", nativeQuery = true)
    List<Object[]> findCombinedRevenueByCategory(@Param("year") int year, @Param("month") int month);
}
>>>>>>> Stashed changes
