package com.example.blog.controller;

import com.example.blog.model.ApiResponse;
import com.example.blog.model.Chapter;
import com.example.blog.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/chapters")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    @GetMapping("/book/{bookId}")
    public ApiResponse<List<Chapter>> getChaptersByBookId(@PathVariable Long bookId) {
        List<Chapter> chapters = chapterService.getChaptersByBookId(bookId);
        return ApiResponse.success(chapters);
    }

    @GetMapping("/{id}")
    public ApiResponse<Chapter> getChapterById(@PathVariable Long id) {
        return chapterService.getChapterById(id)
                .map(ApiResponse::success)
                .orElse(ApiResponse.notFound("Chapter not found"));
    }

    @GetMapping("/book/{bookId}/chapter/{chapterNumber}")
    public ApiResponse<Chapter> getChapterByBookIdAndChapterNumber(
            @PathVariable Long bookId,
            @PathVariable Integer chapterNumber) {
        return chapterService.getChapterByBookIdAndChapterNumber(bookId, chapterNumber)
                .map(ApiResponse::success)
                .orElse(ApiResponse.notFound("Chapter not found"));
    }

    @PostMapping
    public ApiResponse<Chapter> createChapter(@RequestBody Chapter chapter) {
        Chapter createdChapter = chapterService.createChapter(chapter);
        return ApiResponse.success(createdChapter);
    }

    @PutMapping("/{id}")
    public ApiResponse<Chapter> updateChapter(@PathVariable Long id, @RequestBody Chapter chapter) {
        return chapterService.getChapterById(id)
                .map(existingChapter -> {
                    chapter.setId(id);
                    Chapter updatedChapter = chapterService.updateChapter(chapter);
                    return ApiResponse.success(updatedChapter);
                })
                .orElse(ApiResponse.notFound("Chapter not found"));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteChapter(@PathVariable Long id) {
        if (chapterService.getChapterById(id).isPresent()) {
            chapterService.deleteChapter(id);
            return ApiResponse.success();
        } else {
            return ApiResponse.notFound("Chapter not found");
        }
    }

    @GetMapping("/book/{bookId}/count")
    public ApiResponse<Integer> getChapterCountByBookId(@PathVariable Long bookId) {
        Integer count = chapterService.getChapterCountByBookId(bookId);
        return ApiResponse.success(count);
    }
}
