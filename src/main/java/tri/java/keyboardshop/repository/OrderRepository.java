package tri.java.keyboardshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.User;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);

    Optional<Order> findByPaymentRef(String paymentRef);
}
