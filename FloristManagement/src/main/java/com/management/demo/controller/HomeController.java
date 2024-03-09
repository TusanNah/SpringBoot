package com.management.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.management.demo.model.Category;
import com.management.demo.service.impl.CategoryServiceImpl;

@Controller
@RequestMapping("/")
public class HomeController {
	private CategoryServiceImpl categoryServiceImpl;

	public HomeController(CategoryServiceImpl categoryServiceImpl) {
		super();
		this.categoryServiceImpl = categoryServiceImpl;
	}
	
	@GetMapping("/home")
	public String home(Model model) {
		List<Category> categories = categoryServiceImpl.getAllCategories();
		model.addAttribute("categories", categories);
		return "home";
	}
	
	@GetMapping("")
	@ResponseBody
	public String index() {
		return "Greeting from TOMCAT";
	}
}
