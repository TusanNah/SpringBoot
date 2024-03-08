package com.management.demo.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.management.demo.model.Category;
import com.management.demo.repository.CategoryRepository;

@Service
public class CategoryServiceImpl {
	CategoryRepository categoryRepository;
	
	
	
	public CategoryServiceImpl(CategoryRepository categoryRepository) {
		super();
		this.categoryRepository = categoryRepository;
	}

	public List<Category> getAllCategories() {
		return categoryRepository.findAll();
	}

}
