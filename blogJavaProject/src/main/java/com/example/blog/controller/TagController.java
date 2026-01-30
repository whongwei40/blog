package com.example.blog.controller;

import com.example.blog.model.ApiResponse;
import com.example.blog.model.Tag;
import com.example.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tags")
public class TagController {
    @Autowired
    private TagService tagService;

    @GetMapping
    public ApiResponse<List<Tag>> getAllTags() {
        List<Tag> tags = tagService.getAllTags();
        return ApiResponse.success(tags);
    }

    @GetMapping("/{id}")
    public ApiResponse<Tag> getTagById(@PathVariable Long id) {
        Tag tag = tagService.getTagById(id);
        return tag != null ? ApiResponse.success(tag) : ApiResponse.notFound("Tag not found");
    }

    @PostMapping
    public ApiResponse<Tag> createTag(@RequestBody Tag tag) {
        Tag createdTag = tagService.createTag(tag);
        return ApiResponse.success(createdTag);
    }

    @PutMapping("/{id}")
    public ApiResponse<Tag> updateTag(@PathVariable Long id, @RequestBody Tag tag) {
        Tag existingTag = tagService.getTagById(id);
        if (existingTag != null) {
            tag.setId(id);
            Tag updatedTag = tagService.updateTag(tag);
            return ApiResponse.success(updatedTag);
        } else {
            return ApiResponse.notFound("Tag not found");
        }
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteTag(@PathVariable Long id) {
        Tag tag = tagService.getTagById(id);
        if (tag != null) {
            tagService.deleteTag(id);
            return ApiResponse.success();
        } else {
            return ApiResponse.notFound("Tag not found");
        }
    }
}
