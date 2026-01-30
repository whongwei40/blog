package com.example.blog.controller;

import com.example.blog.model.ApiResponse;
import com.example.blog.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/likes")
public class LikeController {
    @Autowired
    private LikeService likeService;

    @PostMapping("/toggle")
    public ApiResponse<Map<String, Object>> toggleLike(
            @RequestParam Long userId,
            @RequestParam String targetType,
            @RequestParam Long targetId) {
        boolean isLiked = likeService.toggleLike(userId, targetType, targetId);
        int likeCount = likeService.getLikeCount(targetType, targetId);
        Map<String, Object> result = new HashMap<>();
        result.put("liked", isLiked);
        result.put("likeCount", likeCount);
        return ApiResponse.success(result);
    }

    @GetMapping("/status")
    public ApiResponse<Map<String, Object>> getLikeStatus(
            @RequestParam Long userId,
            @RequestParam String targetType,
            @RequestParam Long targetId) {
        boolean isLiked = likeService.isLikedByUser(userId, targetType, targetId);
        int likeCount = likeService.getLikeCount(targetType, targetId);
        Map<String, Object> result = new HashMap<>();
        result.put("liked", isLiked);
        result.put("likeCount", likeCount);
        return ApiResponse.success(result);
    }

    @GetMapping("/count")
    public ApiResponse<Map<String, Integer>> getLikeCount(
            @RequestParam String targetType,
            @RequestParam Long targetId) {
        int likeCount = likeService.getLikeCount(targetType, targetId);
        Map<String, Integer> result = new HashMap<>();
        result.put("likeCount", likeCount);
        return ApiResponse.success(result);
    }
}
