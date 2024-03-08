package com.management.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.management.demo.model.Category;
import com.management.demo.model.Product;
import com.management.demo.service.ProductService;
import com.management.demo.service.impl.CategoryServiceImpl;

@Controller
@ResponseBody
public class TestController {
	ProductService productService;
	CategoryServiceImpl categoryService;
	
	
	public TestController(ProductService productService, CategoryServiceImpl categoryService) {
		super();
		this.productService = productService;
		this.categoryService = categoryService;
	}


	@GetMapping("/product")
	public List<Product> getAllFlowers() {
		return productService.getAllFlowers();
	}
	
	@GetMapping("/product/{category_id}")
	public List<Product> getAllFlowers(@PathVariable(name = "category_id") Long id) {
		return productService.getFlowersByCategoryId(id);
	}
	
	@GetMapping("/category")
	public List<Category> getAllCategories() {
		return categoryService.getAllCategories();
	}


}
