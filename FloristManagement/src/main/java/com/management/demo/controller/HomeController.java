package com.management.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.management.demo.model.Category;
import com.management.demo.service.CategoryService;

@Controller
@RequestMapping("/")
public class HomeController {
	private CategoryService categoryService;

	public HomeController(CategoryService categoryService) {
		super();
		this.categoryService = categoryService;
	}
	
	@GetMapping("/")
	public String home(Model model) {
		List<Category> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		Category category = new Category();
		model.addAttribute("category", category);
		//use th:object=${category} in form
		//in @PostMapping("/category/update"), use <@ModelAttribute("category") Category category> to get data from form
		return "home";
	}
	
}
