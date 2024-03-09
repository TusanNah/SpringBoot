package com.management.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.management.demo.model.Product;
import com.management.demo.repository.ProductRepository;
import com.management.demo.service.ProductService;

@Service
public class ProductService{
	ProductRepository productRepository;
	
	//Dependency Injection
	public ProductService(ProductRepository productRepository) {
		super();
		this.productRepository = productRepository;
	}


	public List<Product> getAllFlowers() {
		return productRepository.findAll();
	}


	public List<Product> getFlowersByCategoryId(Long id) {
		return productRepository.findByCategoryId(id);
	}
	
}
