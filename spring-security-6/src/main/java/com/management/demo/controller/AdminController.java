package com.management.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.management.demo.models.ApplicationUser;
import com.management.demo.repository.UserRepository;

@RestController
@RequestMapping("/admin")
@CrossOrigin("*")
public class AdminController {

	UserRepository userRepository;
	public AdminController(UserRepository repository) {

		this.userRepository = repository;
	}
	
	
	@GetMapping("")
	public UserDetails helloUserController(Authentication authentication) {
		return userRepository.findByUsername(authentication.getName()).get() ;
	}

}
