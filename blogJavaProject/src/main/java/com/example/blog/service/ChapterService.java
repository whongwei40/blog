package com.example.blog.service;

import com.example.blog.model.Chapter;
import com.example.blog.repository.ChapterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ChapterService {
    @Autowired
    private ChapterRepository chapterRepository;

    public List<Chapter> getChaptersByBookId(Long bookId) {
        return chapterRepository.findByBookIdOrderByChapterNumberAsc(bookId);
    }

    public Optional<Chapter> getChapterById(Long id) {
        return chapterRepository.findById(id);
    }

    public Optional<Chapter> getChapterByBookIdAndChapterNumber(Long bookId, Integer chapterNumber) {
        return Optional.ofNullable(chapterRepository.findByBookIdAndChapterNumber(bookId, chapterNumber));
    }

    public Chapter createChapter(Chapter chapter) {
        return chapterRepository.save(chapter);
    }

    public Chapter updateChapter(Chapter chapter) {
        return chapterRepository.save(chapter);
    }

    public void deleteChapter(Long id) {
        chapterRepository.deleteById(id);
    }

    public Integer getChapterCountByBookId(Long bookId) {
        return chapterRepository.countByBookId(bookId);
    }
    
    /**
     * 获取所有章节
     * @return 所有章节列表
     */
    public List<Chapter> getAllChapters() {
        return chapterRepository.findAllByOrderByCreatedAtDesc();
    }
}
