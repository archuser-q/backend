package com.sannha.backend.repository;

import com.sannha.backend.entity.PriceRule;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PriceRuleRepository extends JpaRepository<PriceRule, Long> {

    List<PriceRule> findByCourtId(Long courtId);
}