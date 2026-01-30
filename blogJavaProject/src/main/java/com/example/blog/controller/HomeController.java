package com.example.blog.controller;

import com.example.blog.model.ApiResponse;
import com.example.blog.model.Blog;
import com.example.blog.model.Book;
import com.example.blog.model.Chapter;
import com.example.blog.service.BlogService;
import com.example.blog.service.BookService;
import com.example.blog.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class HomeController {
    @Autowired
    private BlogService blogService;
    
    @Autowired
    private BookService bookService;
    
    @Autowired
    private ChapterService chapterService;
    
    /**
     * 获取按时间排序的所有活动数据（博客、书籍、章节）
     * @param limit 限制返回数量
     * @param offset 偏移量
     * @return 按时间排序的活动数据
     */
    @GetMapping("/activities")
    public ApiResponse<List<Map<String, Object>>> getActivities(
            @RequestParam(defaultValue = "10") int limit,
            @RequestParam(defaultValue = "0") int offset) {
        
        // 获取所有博客
        List<Blog> blogs = blogService.getLatestBlogs(Integer.MAX_VALUE, 0);
        
        // 获取所有书籍
        List<Book> books = bookService.getAllBooks();
        
        // 获取所有章节
        List<Chapter> chapters = chapterService.getAllChapters();
        
        // 转换为统一的活动格式
        List<Map<String, Object>> activities = new ArrayList<>();
        
        // 添加博客活动
        for (Blog blog : blogs) {
            Map<String, Object> activity = new HashMap<>();
            activity.put("id", blog.getId());
            activity.put("type", "blog");
            activity.put("title", blog.getTitle() != null ? blog.getTitle() : "无标题");
            activity.put("content", blog.getContent() != null ? blog.getContent() : "无内容");
            activity.put("author", blog.getAuthorName() != null ? blog.getAuthorName() : "管理员");
            activity.put("createdAt", blog.getCreatedAt() != null ? blog.getCreatedAt() : LocalDateTime.now());
            activity.put("image", blog.getImage() != null ? blog.getImage() : "");
            activity.put("likeCount", blog.getLikeCount() != null ? blog.getLikeCount() : 0);
            activity.put("commentCount", blog.getCommentCount() != null ? blog.getCommentCount() : 0);
            activities.add(activity);
        }
        
        // 添加书籍活动
        for (Book book : books) {
            Map<String, Object> activity = new HashMap<>();
            activity.put("id", book.getId());
            activity.put("type", "book");
            activity.put("title", book.getTitle() != null ? book.getTitle() : "无标题");
            activity.put("content", book.getDescription() != null ? book.getDescription() : "无描述");
            activity.put("author", book.getAuthor() != null ? book.getAuthor() : "管理员");
            activity.put("createdAt", book.getCreatedAt() != null ? book.getCreatedAt() : LocalDateTime.now());
            activity.put("image", book.getCover() != null ? book.getCover() : "");
            activity.put("likeCount", book.getLikeCount() != null ? book.getLikeCount() : 0);
            activity.put("commentCount", book.getCommentCount() != null ? book.getCommentCount() : 0);
            activities.add(activity);
        }
        
        // 添加章节活动
        for (Chapter chapter : chapters) {
            Map<String, Object> activity = new HashMap<>();
            activity.put("id", chapter.getId());
            activity.put("type", "chapter");
            activity.put("title", chapter.getTitle() != null ? chapter.getTitle() : "无标题");
            activity.put("content", chapter.getContent() != null ? chapter.getContent() : "无内容");
            activity.put("author", "管理员"); // 使用默认值
            activity.put("createdAt", chapter.getCreatedAt() != null ? chapter.getCreatedAt() : LocalDateTime.now());
            activity.put("image", "");
            activity.put("likeCount", 0); // 使用默认值
            activity.put("commentCount", 0); // 使用默认值
            activity.put("bookId", chapter.getBookId() != null ? chapter.getBookId() : 0); // 添加书籍ID
            activities.add(activity);
        }
        
        // 按创建时间排序（最新的在前）
        activities.sort((a, b) -> {
            LocalDateTime dateA = (LocalDateTime) a.get("createdAt");
            LocalDateTime dateB = (LocalDateTime) b.get("createdAt");
            return dateB.compareTo(dateA);
        });
        
        // 应用分页
        int endIndex = Math.min(offset + limit, activities.size());
        List<Map<String, Object>> paginatedActivities = activities.subList(
                Math.min(offset, activities.size()), 
                endIndex
        );
        
        return ApiResponse.success(paginatedActivities);
    }
}
