package tri.java.keyboardshop.controller.admin;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tri.java.keyboardshop.domain.Comment;
import tri.java.keyboardshop.service.CommentService;
import tri.java.keyboardshop.service.CustomUserDetails;
import tri.java.keyboardshop.service.UserService;

import java.util.List;

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
    public String replyToComment(@PathVariable("commentId") Long parentId,
                                 @RequestParam("replyContent") String content,
                                 @AuthenticationPrincipal CustomUserDetails userDetails) {

        // ✅ Kiểm tra nội dung trước khi xử lý
        if (content == null || content.trim().isEmpty()) {
            throw new IllegalArgumentException("Nội dung phản hồi không được để trống.");
        }

        Comment parentComment = commentService.getCommentById(parentId)
                .orElseThrow(() -> new IllegalArgumentException("Comment not found"));

        Comment reply = new Comment();
        reply.setContent(content);
        reply.setProduct(parentComment.getProduct());
        reply.setUser(userDetails.getUser()); // Admin trả lời
        reply.setParent(parentComment);

        commentService.save(reply);
        return "redirect:/admin/comment";
    }
}
