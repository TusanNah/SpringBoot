package com.management.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.management.demo.model.Category;
import com.management.demo.repository.CategoryRepository;

@Service
public class CategoryService {
	CategoryRepository categoryRepository;
	
	
	
	public CategoryService(CategoryRepository categoryRepository) {
		super();
		this.categoryRepository = categoryRepository;
	}

	public List<Category> getAllCategories() {
		return categoryRepository.findAll();
	}

}
