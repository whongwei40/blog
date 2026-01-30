package com.example.blog.repository;

import com.example.blog.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findByStatusOrderByCreatedAtDesc(String status);
    List<Book> findByCategoryAndStatusOrderByCreatedAtDesc(String category, String status);
    List<Book> findByAuthorOrderByCreatedAtDesc(String author);
    List<Book> findByTitleContainingOrDescriptionContainingOrderByCreatedAtDesc(String title, String description);
    List<Book> findAllByOrderByCreatedAtDesc();
    
    @Query(value = "SELECT b.* FROM book b WHERE b.status = ?1 ORDER BY b.created_at DESC LIMIT ?2 OFFSET ?3", nativeQuery = true)
    List<Book> findBooksByStatusWithPagination(String status, int limit, int offset);
    
    @Query(value = "SELECT b.* FROM book b WHERE b.category = ?1 AND b.status = ?2 ORDER BY b.created_at DESC LIMIT ?3 OFFSET ?4", nativeQuery = true)
    List<Book> findBooksByCategoryAndStatusWithPagination(String category, String status, int limit, int offset);
    
    @Query(value = "SELECT b.* FROM book b ORDER BY b.created_at DESC LIMIT ?1 OFFSET ?2", nativeQuery = true)
    List<Book> findAllBooksWithPagination(int limit, int offset);
    
    @Query(value = "SELECT COUNT(*) FROM book b", nativeQuery = true)
    long countAllBooks();
    
    @Query(value = "SELECT COUNT(*) FROM book b WHERE b.category = ?1", nativeQuery = true)
    long countBooksByCategory(String category);
}
