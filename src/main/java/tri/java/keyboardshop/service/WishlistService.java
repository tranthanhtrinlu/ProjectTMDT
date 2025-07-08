package tri.java.keyboardshop.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tri.java.keyboardshop.domain.Product;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.domain.Wishlist;
import tri.java.keyboardshop.repository.WishlistRepository;

import java.util.List;
import java.util.Optional;

@Service
public class WishlistService {
    
    private final WishlistRepository wishlistRepository;
    
    public WishlistService(WishlistRepository wishlistRepository) {
        this.wishlistRepository = wishlistRepository;
    }
    
    @Transactional
    public Wishlist addToWishlist(User user, Product product) {
        // Kiểm tra xem sản phẩm đã có trong wishlist chưa
        if (wishlistRepository.existsByUserAndProduct(user, product)) {
            throw new IllegalStateException("Sản phẩm đã có trong danh sách yêu thích!");
        }
        
        Wishlist wishlist = new Wishlist(user, product);
        return wishlistRepository.save(wishlist);
    }
    
    @Transactional
    public void removeFromWishlist(User user, Product product) {
        wishlistRepository.deleteByUserAndProduct(user, product);
    }
    
    @Transactional
    public void toggleWishlist(User user, Product product) {
        if (wishlistRepository.existsByUserAndProduct(user, product)) {
            wishlistRepository.deleteByUserAndProduct(user, product);
        } else {
            Wishlist wishlist = new Wishlist(user, product);
            wishlistRepository.save(wishlist);
        }
    }
    
    public List<Wishlist> getUserWishlist(User user) {
        return wishlistRepository.findByUserOrderByCreatedAtDesc(user);
    }
    
    public boolean isInWishlist(User user, Product product) {
        return wishlistRepository.existsByUserAndProduct(user, product);
    }
    
    public long getWishlistCount(User user) {
        return wishlistRepository.countByUser(user);
    }
    
    public Optional<Wishlist> findByUserAndProduct(User user, Product product) {
        return wishlistRepository.findByUserAndProduct(user, product);
    }
} 