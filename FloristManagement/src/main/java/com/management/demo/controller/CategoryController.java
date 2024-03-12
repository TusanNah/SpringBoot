package com.management.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.management.demo.model.Category;
import com.management.demo.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	CategoryService categoryService;
	
	
	public CategoryController(CategoryService categoryService) {
		super();
		this.categoryService = categoryService;
	}


	@PostMapping("/create")
	public String createCategory(@ModelAttribute(name = "Category") Category category) {
		System.out.println(category);
		Category savedCategory =  categoryService.save(category);
		System.out.println(savedCategory);
		return "redirect:/";
	}
	@GetMapping("/update/{id}")
	public String getUpdateCategory(@PathVariable(name = "id") Long id, Model model) {
		Category category = categoryService.findCategoryById(id);
		model.addAttribute("category", category);
		return "update-category";
	}
	@PutMapping()
	public String updateCategory(@ModelAttribute("category") Category category) {
		System.out.println(category);
		categoryService.save(category);
		return "redirect:/";
	}
	
	@DeleteMapping()
	public String deleteCategory(@RequestParam(name = "id") Long id) {
		categoryService.deleteCategoryById(id);
		return "redirect:/";
	}
}
