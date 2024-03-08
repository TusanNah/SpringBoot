package com.management.demo.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.management.demo.model.Product;
import com.management.demo.repository.ProductRepository;
import com.management.demo.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	ProductRepository productRepository;
	
	//Dependency Injection
	public ProductServiceImpl(ProductRepository productRepository) {
		super();
		this.productRepository = productRepository;
	}


	@Override
	public List<Product> getAllFlowers() {
		return productRepository.findAll();
	}


	@Override
	public List<Product> getFlowersByCategoryId(Long id) {
		return productRepository.findByCategoryId(id);
	}
	

}
