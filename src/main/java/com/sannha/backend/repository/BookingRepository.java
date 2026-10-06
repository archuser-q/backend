package com.sannha.backend.repository;

import com.sannha.backend.entity.Booking;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {

    @Query("""
            SELECT COUNT(b) > 0 FROM Booking b
            WHERE b.court.id = :courtId
              AND b.status <> com.sannha.backend.entity.BookingStatus.CANCELLED
              AND b.startTime < :endTime
              AND b.endTime > :startTime
            """)
    boolean existsOverlap(@Param("courtId") Long courtId,
                          @Param("startTime") LocalDateTime startTime,
                          @Param("endTime") LocalDateTime endTime);

    @Query("""
            SELECT b FROM Booking b
            WHERE b.court.id = :courtId
              AND b.status <> com.sannha.backend.entity.BookingStatus.CANCELLED
              AND b.startTime < :to
              AND b.endTime > :from
            ORDER BY b.startTime
            """)
    List<Booking> findActiveInRange(@Param("courtId") Long courtId,
                                    @Param("from") LocalDateTime from,
                                    @Param("to") LocalDateTime to);

    @EntityGraph(attributePaths = {"court", "court.venue"})
    List<Booking> findByCustomerIdOrderByStartTimeDesc(Long customerId);
}