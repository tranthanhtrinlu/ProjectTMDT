package tri.java.keyboardshop.service;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.Order.OrderStatus;
import tri.java.keyboardshop.domain.Product;
import tri.java.keyboardshop.domain.Review;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.repository.OrderRepository;
import tri.java.keyboardshop.repository.ReviewRepository;

import java.util.List;

@Service
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final OrderRepository orderRepository;

    public ReviewService(ReviewRepository reviewRepository, OrderRepository orderRepository) {
        this.reviewRepository = reviewRepository;
        this.orderRepository = orderRepository;
    }

    @Transactional
    public Review saveReview(Review review, User user, Product product) {
        if (!canUserReview(user.getId(), product.getId())) {
            throw new IllegalStateException("Bạn chưa mua sản phẩm này hoặc đơn hàng chưa hoàn thành.");
        }
        review.setUser(user);
        review.setProduct(product);
        return reviewRepository.save(review);
    }

    public boolean canUserReview(Long userId, Long productId) {
        return orderRepository.existsByUserIdAndProductIdAndStatus(userId, productId, OrderStatus.COMPLETE)
                && !reviewRepository.existsByProductIdAndUserId(productId, userId);
    }

    public List<Review> getReviewsByProduct(Long productId) {
        return reviewRepository.findByProductId(productId);
    }
}