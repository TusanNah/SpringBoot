package com.management.demo.service;

import java.util.List;

import com.management.demo.model.Product;

public interface ProductService  {
	List<Product> getAllFlowers();
	List<Product> getFlowersByCategoryId(Long id);

}
