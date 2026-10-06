package com.sannha.backend.repository;

import com.sannha.backend.entity.Court;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CourtRepository extends JpaRepository<Court, Long> {

    @EntityGraph(attributePaths = "venue")
    List<Court> findByVenueIdOrderByNameAsc(Long venueId);

    @EntityGraph(attributePaths = "venue")
    List<Court> findByVenueIdAndActiveTrueOrderByNameAsc(Long venueId);

    @EntityGraph(attributePaths = {"venue", "venue.owner"})
    Optional<Court> findWithVenueById(Long id);
}