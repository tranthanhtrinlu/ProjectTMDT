package tri.java.keyboardshop.service;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.Comment;
import tri.java.keyboardshop.domain.Product;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.repository.CommentRepository;

import java.util.List;
import java.util.Optional;

@Service
public class CommentService {

    private final CommentRepository commentRepository;

    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    @Transactional
    public Comment saveComment(Comment comment, User user, Product product) {
        if (user == null) {
            throw new IllegalStateException("Bạn phải đăng nhập để bình luận.");
        }
        comment.setUser(user);
        comment.setProduct(product);
        return commentRepository.save(comment);
    }

    public Optional<Comment> getCommentById(Long id) {
        return commentRepository.findById(id);
    }

    public void save(Comment comment) {
        commentRepository.save(comment);
    }

    /**
     * Trả về danh sách các bình luận gốc (parent == null) theo product.
     */
    public List<Comment> getCommentsByProduct(Long productId) {
        return commentRepository.findByProductIdAndParentIsNull(productId);
    }

    /**
     * Trả về danh sách trả lời (reply) của 1 comment.
     */
    public List<Comment> getReplies(Long parentId) {
        return commentRepository.findByParentId(parentId);
    }

    /**
     * Trả về danh sách trả lời (reply) của 1 comment cho admin.
     */
    public List<Comment> getRepliesByParentId(Long parentId) {
        return commentRepository.findByParentId(parentId);
    }

    /**
     * Xóa bình luận theo ID.
     */
    @Transactional
    public void deleteComment(Long commentId) {
        commentRepository.deleteById(commentId);
    }

    public List<Comment> getAllTopLevelComments() {
        return commentRepository.findByParentIsNullOrderByCreatedAtDesc();
    }
    
    public List<Comment> getAllComments() {
        return commentRepository.findAllByOrderByCreatedAtDesc();
    }
}
