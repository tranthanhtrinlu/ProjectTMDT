package tri.java.keyboardshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tri.java.keyboardshop.domain.Review;

import java.util.List;
import java.util.Optional;

public interface ReviewRepository extends JpaRepository<Review, Long> {
    Optional<Review> findByProductIdAndUserId(Long productId, Long userId);
    boolean existsByProductIdAndUserId(Long productId, Long userId);
    List<Review> findByProductId(Long productId);
}
