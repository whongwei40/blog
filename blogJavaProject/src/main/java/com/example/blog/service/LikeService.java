package com.example.blog.service;

import com.example.blog.model.Like;
import com.example.blog.repository.LikeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class LikeService {
    @Autowired
    private LikeRepository likeRepository;

    public boolean toggleLike(Long userId, String targetType, Long targetId) {
        Optional<Like> existingLike = likeRepository.findByUserIdAndTargetTypeAndTargetId(userId, targetType, targetId);
        if (existingLike.isPresent()) {
            likeRepository.deleteByUserIdAndTargetTypeAndTargetId(userId, targetType, targetId);
            return false;
        } else {
            Like like = new Like();
            like.setUserId(userId);
            like.setTargetType(targetType);
            like.setTargetId(targetId);
            likeRepository.save(like);
            return true;
        }
    }

    public boolean isLikedByUser(Long userId, String targetType, Long targetId) {
        return likeRepository.findByUserIdAndTargetTypeAndTargetId(userId, targetType, targetId).isPresent();
    }

    public Integer getLikeCount(String targetType, Long targetId) {
        return likeRepository.countByTargetTypeAndTargetId(targetType, targetId);
    }
}
