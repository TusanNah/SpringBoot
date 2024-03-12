package com.management.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.management.demo.models.ApplicationUser;



public interface UserRepository extends JpaRepository<ApplicationUser, Integer> {
	
	Optional<ApplicationUser> findByUsername(String username);
}
