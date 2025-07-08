package tri.java.keyboardshop.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tri.java.keyboardshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    Page<Product> findAll(Pageable page);

    Page<Product> findAll(Specification<Product> spec, Pageable page);
    
    @Modifying
    @Transactional
    @Query("UPDATE Product p SET p.quantity = :quantity WHERE p.id = :productId")
    void updateProductQuantity(@Param("productId") long productId, @Param("quantity") long quantity);
    
    java.util.List<Product> findByType(Product.ProductType type);
    
    // Lấy sản phẩm bán chạy nhất (sắp xếp theo số lượng đã bán giảm dần)
    @Query("SELECT p FROM Product p WHERE p.quantity > 0 ORDER BY p.sold DESC")
    java.util.List<Product> findBestSellingProducts(Pageable pageable);
    
    // Lấy sản phẩm mới nhất (sắp xếp theo ID giảm dần - giả định ID tăng theo thời gian)
    @Query("SELECT p FROM Product p WHERE p.quantity > 0 ORDER BY p.id DESC")
    java.util.List<Product> findNewestProducts(Pageable pageable);
}
