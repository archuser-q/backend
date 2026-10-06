package com.sannha.backend.repository;

import com.sannha.backend.entity.Venue;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface VenueRepository extends JpaRepository<Venue, Long> {

    @EntityGraph(attributePaths = "owner")
    @Query("""
            SELECT v FROM Venue v
            WHERE (:district IS NULL OR v.district = :district)
              AND (:keyword IS NULL OR LOWER(v.name) LIKE LOWER(CONCAT('%', :keyword, '%')))
            """)
    Page<Venue> search(@Param("district") String district,
                       @Param("keyword") String keyword,
                       Pageable pageable);

    @EntityGraph(attributePaths = "owner")
    List<Venue> findByOwnerIdOrderByCreatedAtDesc(Long ownerId);
}