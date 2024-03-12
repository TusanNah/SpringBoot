package com.management.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.management.demo.models.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
	
	Optional<Role> findByAuthority(String authority);
}
