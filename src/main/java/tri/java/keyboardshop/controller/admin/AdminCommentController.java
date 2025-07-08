package tri.java.keyboardshop.controller.admin;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tri.java.keyboardshop.domain.Comment;
import tri.java.keyboardshop.service.CommentService;
import tri.java.keyboardshop.service.CustomUserDetails;
import tri.java.keyboardshop.service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/admin/comment")
public class AdminCommentController {

    private final CommentService commentService;
    private final UserService userService;

    public AdminCommentController(CommentService commentService, UserService userService) {
        this.commentService = commentService;
        this.userService = userService;
    }

    @GetMapping
    public String showAllComments(Model model) {
        List<Comment> comments = commentService.getAllComments();
        model.addAttribute("comments", comments);
        return "admin/comment/show";
    }

    @PostMapping("/reply/{commentId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> replyToComment(@PathVariable("commentId") Long parentId,
                                                             @RequestParam("replyContent") String content,
                                                             @AuthenticationPrincipal CustomUserDetails userDetails) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // Kiểm tra nội dung trước khi xử lý
            if (content == null || content.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "Nội dung phản hồi không được để trống.");
                return ResponseEntity.badRequest().body(response);
            }

            Optional<Comment> parentCommentOpt = commentService.getCommentById(parentId);
            if (!parentCommentOpt.isPresent()) {
                response.put("success", false);
                response.put("message", "Bình luận không tồn tại.");
                return ResponseEntity.badRequest().body(response);
            }

            Comment parentComment = parentCommentOpt.get();
            Comment reply = new Comment();
            reply.setContent(content.trim());
            reply.setProduct(parentComment.getProduct());
            reply.setUser(userDetails.getUser()); // Admin trả lời
            reply.setParent(parentComment);

            commentService.save(reply);
            
            response.put("success", true);
            response.put("message", "Phản hồi đã được gửi thành công");
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

    @PostMapping("/delete/{commentId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteComment(@PathVariable("commentId") Long commentId) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            Optional<Comment> commentOpt = commentService.getCommentById(commentId);
            if (!commentOpt.isPresent()) {
                response.put("success", false);
                response.put("message", "Bình luận không tồn tại.");
                return ResponseEntity.badRequest().body(response);
            }

            Comment comment = commentOpt.get();
            
            // Xóa tất cả các phản hồi của bình luận này trước
            List<Comment> replies = commentService.getRepliesByParentId(commentId);
            for (Comment reply : replies) {
                commentService.deleteComment(reply.getId());
            }
            
            // Sau đó xóa bình luận gốc
            commentService.deleteComment(commentId);
            
            response.put("success", true);
            response.put("message", "Bình luận đã được xóa thành công");
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
}