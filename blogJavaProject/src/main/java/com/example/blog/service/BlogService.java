package com.example.blog.service;

import com.example.blog.model.Blog;
import com.example.blog.repository.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class BlogService {
    @Autowired
    private BlogRepository blogRepository;

    public List<Blog> getLatestBlogs(int limit, int offset) {
        return blogRepository.findLatestBlogs(limit, offset);
    }

    public List<Blog> getAllBlogs() {
        return blogRepository.findByStatusOrderByCreatedAtDesc(1);
    }

    public Optional<Blog> getBlogById(Long id) {
        return blogRepository.findById(id);
    }

    public Blog createBlog(Blog blog) {
        // 设置默认值
        if (blog.getStatus() == null) {
            blog.setStatus(1); // 默认为已发布
        }
        if (blog.getViewCount() == null) {
            blog.setViewCount(0);
        }
        if (blog.getLikeCount() == null) {
            blog.setLikeCount(0);
        }
        if (blog.getCommentCount() == null) {
            blog.setCommentCount(0);
        }
        if (blog.getAuthorId() == null) {
            blog.setAuthorId(1L); // 默认作者ID
        }
        if (blog.getAuthorName() == null) {
            blog.setAuthorName("管理员"); // 默认作者名称
        }
        LocalDateTime now = LocalDateTime.now();
        if (blog.getCreatedAt() == null) {
            blog.setCreatedAt(now);
        }
        if (blog.getUpdatedAt() == null) {
            blog.setUpdatedAt(now);
        }
        // 生成摘要
        if (blog.getSummary() == null && blog.getContent() != null) {
            String content = blog.getContent().replaceAll("<[^>]*>", ""); // 去除HTML标签
            if (content.length() > 100) {
                blog.setSummary(content.substring(0, 100) + "...");
            } else {
                blog.setSummary(content);
            }
        }
        return blogRepository.save(blog);
    }

    public Blog updateBlog(Blog blog) {
        return blogRepository.save(blog);
    }

    public void deleteBlog(Long id) {
        blogRepository.deleteById(id);
    }

    public List<Blog> getBlogsByAuthor(Long authorId) {
        return blogRepository.findByAuthorIdAndStatusOrderByCreatedAtDesc(authorId, 1);
    }

    public List<Blog> getBlogsByType(String type) {
        return blogRepository.findByTypeAndStatusOrderByCreatedAtDesc(type, 1);
    }
    
    public long countActiveBlogs() {
        return blogRepository.countActiveBlogs();
    }
    
    public List<Blog> searchBlogs(String keyword, LocalDateTime startTime, LocalDateTime endTime, int page, int size) {
        int offset = (page - 1) * size;
        return blogRepository.searchBlogs(keyword, startTime, endTime, size, offset);
    }
    
    public long countSearchBlogs(String keyword, LocalDateTime startTime, LocalDateTime endTime) {
        return blogRepository.countSearchBlogs(keyword, startTime, endTime);
    }
}
