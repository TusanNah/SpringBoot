package com.management.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.management.demo.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
