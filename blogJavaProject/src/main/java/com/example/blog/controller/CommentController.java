package com.example.blog.controller;

import com.example.blog.model.ApiResponse;
import com.example.blog.model.Comment;
import com.example.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/comments")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @GetMapping
    public ApiResponse<List<Comment>> getCommentsByTarget(
            @RequestParam String targetType,
            @RequestParam Long targetId) {
        List<Comment> comments = commentService.getCommentsByTarget(targetType, targetId);
        return ApiResponse.success(comments);
    }

    @GetMapping("/replies/{parentId}")
    public ApiResponse<List<Comment>> getRepliesByParentId(@PathVariable Long parentId) {
        List<Comment> replies = commentService.getRepliesByParentId(parentId);
        return ApiResponse.success(replies);
    }

    @PostMapping
    public ApiResponse<Comment> createComment(@RequestBody Comment comment) {
        Comment createdComment = commentService.createComment(comment);
        return ApiResponse.success(createdComment);
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteComment(@PathVariable Long id) {
        commentService.deleteComment(id);
        return ApiResponse.success();
    }

    @GetMapping("/count")
    public ApiResponse<Integer> getCommentCount(
            @RequestParam String targetType,
            @RequestParam Long targetId) {
        Integer count = commentService.getCommentCountByTarget(targetType, targetId);
        return ApiResponse.success(count);
    }
}
