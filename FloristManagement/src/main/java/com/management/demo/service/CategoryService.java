package com.management.demo.service;

import java.util.List;
import java.util.Optional;

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
	
	public Category save(Category category) {
		return categoryRepository.save(category);
	}
	public Category findCategoryById(Long id) {
		return categoryRepository.findById(id).get();
	}
	
	public void deleteCategoryById(Long id) {
		Optional<Category> category = categoryRepository.findById(id);
		if (category.isEmpty()) {
			return;
		}
		Category existingCategory = category.get();
		categoryRepository.delete(existingCategory);
	}

}
