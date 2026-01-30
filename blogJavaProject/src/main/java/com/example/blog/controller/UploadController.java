package com.example.blog.controller;

import com.example.blog.model.ApiResponse;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/api/upload")
public class UploadController {
    
    // 上传目录（使用绝对路径，确保权限正确）
    private static final String UPLOAD_DIR = System.getProperty("user.dir") + File.separator + "uploads";
    
    @PostMapping("/image")
    public ApiResponse<String> uploadImage(@RequestParam("file") MultipartFile file) {
        try {
            // 检查文件是否为空
            if (file.isEmpty()) {
                return ApiResponse.error("文件为空");
            }
            
            // 检查文件类型
            String contentType = file.getContentType();
            if (contentType == null || !contentType.startsWith("image/")) {
                return ApiResponse.error("只支持图片文件");
            }
            
            // 创建上传目录
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                boolean created = uploadDir.mkdirs();
                if (!created) {
                    return ApiResponse.error("无法创建上传目录");
                }
            }
            
            // 生成唯一文件名
            String originalFilename = file.getOriginalFilename();
            String fileExtension = ".jpg"; // 默认扩展名
            if (originalFilename != null && originalFilename.contains(".")) {
                fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            }
            String filename = UUID.randomUUID().toString() + fileExtension;
            
            // 保存文件
            File dest = new File(uploadDir, filename);
            file.transferTo(dest);
            
            // 生成文件URL
            String fileUrl = "/uploads/" + filename;
            
            return ApiResponse.success(fileUrl);
        } catch (Exception e) {
            e.printStackTrace();
            return ApiResponse.error("文件上传失败: " + e.getMessage());
        }
    }
}
