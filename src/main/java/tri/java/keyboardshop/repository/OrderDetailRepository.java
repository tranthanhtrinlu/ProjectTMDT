package tri.java.keyboardshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tri.java.keyboardshop.domain.OrderDetail;

import java.util.List;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

    @Query("SELECT p.target, SUM(od.price * od.quantity) " +
            "FROM OrderDetail od " +
            "JOIN od.product p " +
            "JOIN od.order o " +
            "WHERE YEAR(o.createdAt) = :year AND MONTH(o.createdAt) = :month " +
            "AND o.paymentStatus = 'PAYMENT_SUCCEED' " +
            "GROUP BY p.target")
    List<Object[]> findRevenueByCategory(int year, int month);
}