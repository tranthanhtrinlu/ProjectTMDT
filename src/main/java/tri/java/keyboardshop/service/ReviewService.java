package tri.java.keyboardshop.service;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.Order.OrderStatus;
import tri.java.keyboardshop.domain.Product;
import tri.java.keyboardshop.domain.Review;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.repository.OrderRepository;
import tri.java.keyboardshop.repository.ReviewRepository;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

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
            throw new IllegalStateException("Bạn đã đánh giá sản phẩm này rồi.");
        }
        
        if (!hasUserPurchasedProduct(user.getId(), product.getId())) {
            throw new IllegalStateException("Bạn cần mua sản phẩm này trước khi có thể đánh giá.");
        }
        
        review.setUser(user);
        review.setProduct(product);
        return reviewRepository.save(review);
    }

    public boolean canUserReview(Long userId, Long productId) {
        // Kiểm tra user đã đánh giá chưa và đã mua sản phẩm chưa
        boolean hasNotReviewed = !reviewRepository.existsByProductIdAndUserId(productId, userId);
        boolean hasPurchased = hasUserPurchasedProduct(userId, productId);
        return hasNotReviewed && hasPurchased;
    }
    
    public boolean hasUserPurchasedProduct(Long userId, Long productId) {
        // Kiểm tra xem user đã mua sản phẩm này trong các đơn hàng hoàn thành chưa
        return orderRepository.existsByUserIdAndProductIdAndStatus(
            userId, productId, OrderStatus.COMPLETE
        );
    }

    public List<Review> getReviewsByProduct(Long productId) {
        List<Review> reviews = reviewRepository.findByProductId(productId);
        
        // Format ngày tháng cho từng review
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        for (Review review : reviews) {
            if (review.getCreatedAt() != null) {
                review.setFormattedCreatedAt(formatter.format(java.sql.Timestamp.valueOf(review.getCreatedAt())));
            }
        }
        
        return reviews;
    }

    /**
     * Tính điểm trung bình của sản phẩm
     */
    public double getAverageRating(Long productId) {
        List<Review> reviews = reviewRepository.findByProductId(productId);
        if (reviews.isEmpty()) {
            return 0.0;
        }
        
        double sum = reviews.stream().mapToInt(Review::getRating).sum();
        return Math.round((sum / reviews.size()) * 10.0) / 10.0; // Làm tròn 1 chữ số thập phân
    }

    /**
     * Đếm tổng số đánh giá của sản phẩm
     */
    public long getTotalReviews(Long productId) {
        return reviewRepository.findByProductId(productId).size();
    }

    /**
     * Thống kê đánh giá theo từng mức sao (1-5 sao)
     */
    public Map<Integer, Long> getRatingStatistics(Long productId) {
        List<Review> reviews = reviewRepository.findByProductId(productId);
        Map<Integer, Long> stats = new HashMap<>();
        
        // Khởi tạo cho tất cả các mức từ 1-5 sao
        for (int i = 1; i <= 5; i++) {
            stats.put(i, 0L);
        }
        
        // Đếm số lượng đánh giá cho từng mức
        for (Review review : reviews) {
            int rating = review.getRating();
            stats.put(rating, stats.get(rating) + 1);
        }
        
        return stats;
    }

    /**
     * Tính phần trăm cho từng mức sao
     */
    public Map<Integer, Double> getRatingPercentages(Long productId) {
        Map<Integer, Long> stats = getRatingStatistics(productId);
        long total = getTotalReviews(productId);
        Map<Integer, Double> percentages = new HashMap<>();
        
        for (int i = 1; i <= 5; i++) {
            if (total > 0) {
                double percentage = (stats.get(i) * 100.0) / total;
                percentages.put(i, Math.round(percentage * 10.0) / 10.0);
            } else {
                percentages.put(i, 0.0);
            }
        }
        
        return percentages;
    }
}