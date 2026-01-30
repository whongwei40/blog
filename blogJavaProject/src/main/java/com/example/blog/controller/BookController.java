package com.example.blog.controller;

import com.example.blog.model.ApiResponse;
import com.example.blog.model.Book;
import com.example.blog.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/books")
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping
    public ApiResponse<List<Book>> getAllBooks(
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String status,
            @RequestParam(defaultValue = "10") int limit,
            @RequestParam(defaultValue = "0") int offset) {
        List<Book> books;
        if (category != null) {
            books = bookService.getBooksByCategoryWithPagination(category, limit, offset);
        } else if (status != null) {
            books = bookService.getBooksByStatusWithPagination(status, limit, offset);
        } else {
            books = bookService.getAllBooksWithPagination(limit, offset);
        }
        return ApiResponse.success(books);
    }

    @GetMapping("/{id}")
    public ApiResponse<Book> getBookById(@PathVariable Long id) {
        return bookService.getBookById(id)
                .map(ApiResponse::success)
                .orElse(ApiResponse.notFound("Book not found"));
    }

    @PostMapping
    public ApiResponse<Book> createBook(@RequestBody Book book) {
        Book createdBook = bookService.createBook(book);
        return ApiResponse.success(createdBook);
    }

    @PutMapping("/{id}")
    public ApiResponse<Book> updateBook(@PathVariable Long id, @RequestBody Book book) {
        return bookService.getBookById(id)
                .map(existingBook -> {
                    book.setId(id);
                    Book updatedBook = bookService.updateBook(book);
                    return ApiResponse.success(updatedBook);
                })
                .orElse(ApiResponse.notFound("Book not found"));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteBook(@PathVariable Long id) {
        if (bookService.getBookById(id).isPresent()) {
            bookService.deleteBook(id);
            return ApiResponse.success();
        } else {
            return ApiResponse.notFound("Book not found");
        }
    }

    @GetMapping("/search")
    public ApiResponse<List<Book>> searchBooks(@RequestParam String keyword) {
        List<Book> books = bookService.searchBooks(keyword);
        return ApiResponse.success(books);
    }

    @GetMapping("/author/{author}")
    public ApiResponse<List<Book>> getBooksByAuthor(@PathVariable String author) {
        List<Book> books = bookService.getBooksByAuthor(author);
        return ApiResponse.success(books);
    }

    @GetMapping("/count")
    public ApiResponse<Long> getBookCount(@RequestParam(required = false) String category) {
        long count;
        if (category != null) {
            count = bookService.countBooksByCategory(category);
        } else {
            count = bookService.countAllBooks();
        }
        return ApiResponse.success(count);
    }
}
