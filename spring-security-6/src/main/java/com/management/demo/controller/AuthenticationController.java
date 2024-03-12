package com.management.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.management.demo.models.ApplicationUser;
import com.management.demo.models.LoginResponseDTO;
import com.management.demo.models.RegistrationDTO;
import com.management.demo.service.AuthenticationService;

@RestController
@RequestMapping("/auth")
@CrossOrigin("*")
public class AuthenticationController {
	
	@Autowired
	private AuthenticationService authenticationService;
	
	@ResponseBody
	@PostMapping("/register")
	public ApplicationUser registerUser(@RequestBody RegistrationDTO body) {
//		System.out.println(body.getUsername());
		ApplicationUser u = authenticationService.registerUser(body.getUsername(), body.getPassword());
		System.out.println("/auth/register" + u.toString());
		return u;
		
	}
	
	@PostMapping("/login")
	public LoginResponseDTO loginuser(@RequestBody RegistrationDTO body) {
		System.out.println("/login");
		return authenticationService.loginUser(body.getUsername(), body.getPassword());
	}
	@GetMapping("/login")
	public String hello() {
//		System.out.println("/login");
		return "123";
	}
}
