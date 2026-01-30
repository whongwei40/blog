package com.example.blog.service;

import com.example.blog.model.Comment;
import com.example.blog.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public List<Comment> getCommentsByTarget(String targetType, Long targetId) {
        return commentRepository.findByTargetTypeAndTargetIdAndStatusOrderByCreatedAtAsc(targetType, targetId, 1);
    }

    public List<Comment> getRepliesByParentId(Long parentId) {
        return commentRepository.findByParentIdAndStatusOrderByCreatedAtAsc(parentId, 1);
    }

    public Comment createComment(Comment comment) {
        return commentRepository.save(comment);
    }

    public void deleteComment(Long id) {
        commentRepository.deleteById(id);
    }

    public Integer getCommentCountByTarget(String targetType, Long targetId) {
        return commentRepository.countByTargetTypeAndTargetIdAndStatus(targetType, targetId, 1);
    }
}
