package com.example.blog.repository;

import com.example.blog.model.Chapter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChapterRepository extends JpaRepository<Chapter, Long> {
    List<Chapter> findByBookIdOrderByChapterNumberAsc(Long bookId);
    Chapter findByBookIdAndChapterNumber(Long bookId, Integer chapterNumber);
    Integer countByBookId(Long bookId);
    List<Chapter> findAllByOrderByCreatedAtDesc();
}
