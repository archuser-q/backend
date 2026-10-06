package com.sannha.backend;

import com.sannha.backend.repository.CourtRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class BackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(BackendApplication.class, args);
    }

    @Bean
    CommandLineRunner checkMapping(CourtRepository courtRepo) {
        return args -> courtRepo.findByVenueIdOrderByNameAsc(1L).forEach(c ->
                System.out.println(">>> " + c.getName() + " | " + c.getVenue().getName()
                        + " | " + c.getType() + " | " + c.getBasePricePerHour()));
    }
}