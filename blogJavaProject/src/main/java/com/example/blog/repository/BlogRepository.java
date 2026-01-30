package com.example.blog.repository;

import com.example.blog.model.Blog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BlogRepository extends JpaRepository<Blog, Long> {
    List<Blog> findByStatusOrderByCreatedAtDesc(Integer status);
    List<Blog> findByAuthorIdAndStatusOrderByCreatedAtDesc(Long authorId, Integer status);
    List<Blog> findByTypeAndStatusOrderByCreatedAtDesc(String type, Integer status);
    
    @Query(value = "SELECT b.* FROM blog b WHERE b.status = 1 ORDER BY b.created_at DESC LIMIT ?1 OFFSET ?2", nativeQuery = true)
    List<Blog> findLatestBlogs(int limit, int offset);
    
    @Query(value = "SELECT COUNT(*) FROM blog b WHERE b.status = 1", nativeQuery = true)
    long countActiveBlogs();
    
    @Query(value = "SELECT b.* FROM blog b WHERE (b.title LIKE %?1% OR ?1 IS NULL) AND (b.created_at >= ?2 OR ?2 IS NULL) AND (b.created_at <= ?3 OR ?3 IS NULL) ORDER BY b.created_at DESC LIMIT ?4 OFFSET ?5", nativeQuery = true)
    List<Blog> searchBlogs(String keyword, LocalDateTime startTime, LocalDateTime endTime, int limit, int offset);
    
    @Query(value = "SELECT COUNT(*) FROM blog b WHERE (b.title LIKE %?1% OR ?1 IS NULL) AND (b.created_at >= ?2 OR ?2 IS NULL) AND (b.created_at <= ?3 OR ?3 IS NULL)", nativeQuery = true)
    long countSearchBlogs(String keyword, LocalDateTime startTime, LocalDateTime endTime);
}
