package com.example.blog.service;

import com.example.blog.model.Book;
import com.example.blog.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;

    public List<Book> getAllBooks() {
        return bookRepository.findAllByOrderByCreatedAtDesc();
    }

    public List<Book> getAllBooksWithPagination(int limit, int offset) {
        return bookRepository.findAllBooksWithPagination(limit, offset);
    }

    public List<Book> getBooksByCategory(String category) {
        return bookRepository.findByCategoryAndStatusOrderByCreatedAtDesc(category, "完结");
    }

    public List<Book> getBooksByCategoryWithPagination(String category, int limit, int offset) {
        return bookRepository.findBooksByCategoryAndStatusWithPagination(category, "完结", limit, offset);
    }

    public List<Book> getBooksByStatus(String status) {
        return bookRepository.findByStatusOrderByCreatedAtDesc(status);
    }

    public List<Book> getBooksByStatusWithPagination(String status, int limit, int offset) {
        return bookRepository.findBooksByStatusWithPagination(status, limit, offset);
    }

    public Optional<Book> getBookById(Long id) {
        return bookRepository.findById(id);
    }

    public List<Book> searchBooks(String keyword) {
        return bookRepository.findByTitleContainingOrDescriptionContainingOrderByCreatedAtDesc(keyword, keyword);
    }

    public List<Book> getBooksByAuthor(String author) {
        return bookRepository.findByAuthorOrderByCreatedAtDesc(author);
    }

    public Book createBook(Book book) {
        return bookRepository.save(book);
    }

    public Book updateBook(Book book) {
        return bookRepository.save(book);
    }

    public void deleteBook(Long id) {
        bookRepository.deleteById(id);
    }
    
    public long countAllBooks() {
        return bookRepository.countAllBooks();
    }
    
    public long countBooksByCategory(String category) {
        return bookRepository.countBooksByCategory(category);
    }
}
