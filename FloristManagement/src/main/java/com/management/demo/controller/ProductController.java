package com.management.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.management.demo.model.Product;
import com.management.demo.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	ProductService productService;

	public ProductController(ProductService productService) {
		super();
		this.productService = productService;
	}
	
	@GetMapping("/{id}")
	public String productsByCategoryId(@PathVariable(name = "id") Long id, Model model) {
		List<Product> products = productService.getFlowersByCategoryId(id);
		model.addAttribute("products", products);
		return "products";
	}
	
}
