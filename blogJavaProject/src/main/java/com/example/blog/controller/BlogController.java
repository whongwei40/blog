package com.example.blog.controller;

import com.example.blog.model.ApiResponse;
import com.example.blog.model.Blog;
import com.example.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/blogs")
public class BlogController {
    @Autowired
    private BlogService blogService;

    @GetMapping
    public ApiResponse<Map<String, Object>> getBlogs(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime) {
        
        LocalDateTime start = null;
        LocalDateTime end = null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        if (startTime != null && !startTime.isEmpty()) {
            start = LocalDateTime.parse(startTime + "T00:00:00");
        }
        
        if (endTime != null && !endTime.isEmpty()) {
            end = LocalDateTime.parse(endTime + "T23:59:59");
        }
        
        List<Blog> blogs = blogService.searchBlogs(keyword, start, end, page, size);
        long total = blogService.countSearchBlogs(keyword, start, end);
        
        Map<String, Object> response = new HashMap<>();
        response.put("data", blogs);
        response.put("total", total);
        response.put("page", page);
        response.put("size", size);
        
        return ApiResponse.success(response);
    }

    @GetMapping("/latest")
    public ApiResponse<List<Blog>> getLatestBlogs(
            @RequestParam(defaultValue = "10") int limit,
            @RequestParam(defaultValue = "0") int offset) {
        List<Blog> blogs = blogService.getLatestBlogs(limit, offset);
        return ApiResponse.success(blogs);
    }

    @GetMapping("/{id}")
    public ApiResponse<Blog> getBlogById(@PathVariable Long id) {
        return blogService.getBlogById(id)
                .map(ApiResponse::success)
                .orElse(ApiResponse.notFound("Blog not found"));
    }

    @PostMapping
    public ApiResponse<Blog> createBlog(@RequestBody Blog blog) {
        Blog createdBlog = blogService.createBlog(blog);
        return ApiResponse.success(createdBlog);
    }

    @PutMapping("/{id}")
    public ApiResponse<Blog> updateBlog(@PathVariable Long id, @RequestBody Blog blog) {
        return blogService.getBlogById(id)
                .map(existingBlog -> {
                    blog.setId(id);
                    Blog updatedBlog = blogService.updateBlog(blog);
                    return ApiResponse.success(updatedBlog);
                })
                .orElse(ApiResponse.notFound("Blog not found"));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteBlog(@PathVariable Long id) {
        if (blogService.getBlogById(id).isPresent()) {
            blogService.deleteBlog(id);
            return ApiResponse.success();
        } else {
            return ApiResponse.notFound("Blog not found");
        }
    }

    @GetMapping("/author/{authorId}")
    public ApiResponse<List<Blog>> getBlogsByAuthor(@PathVariable Long authorId) {
        List<Blog> blogs = blogService.getBlogsByAuthor(authorId);
        return ApiResponse.success(blogs);
    }

    @GetMapping("/type/{type}")
    public ApiResponse<List<Blog>> getBlogsByType(@PathVariable String type) {
        List<Blog> blogs = blogService.getBlogsByType(type);
        return ApiResponse.success(blogs);
    }

    @GetMapping("/count")
    public ApiResponse<Long> getBlogCount() {
        long count = blogService.countActiveBlogs();
        return ApiResponse.success(count);
    }
}
