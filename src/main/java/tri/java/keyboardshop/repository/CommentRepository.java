package tri.java.keyboardshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tri.java.keyboardshop.domain.Comment;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    // Lấy tất cả bình luận gốc (không phải reply) theo sản phẩm
    List<Comment> findByProductIdAndParentIsNull(Long productId);

    // Lấy tất cả các reply theo comment cha
    List<Comment> findByParentId(Long parentId);

    // Lấy tất cả bình luận của người dùng
    List<Comment> findByUserId(Long userId);

    List<Comment> findByParentIsNullOrderByCreatedAtDesc();

    // Lấy tất cả bình luận sắp xếp theo ngày tạo mới nhất
    List<Comment> findAllByOrderByCreatedAtDesc();

}
