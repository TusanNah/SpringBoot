package com.management.demo.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.management.demo.models.ApplicationUser;
import com.management.demo.models.Role;
import com.management.demo.repository.RoleRepository;
import com.management.demo.repository.UserRepository;

@Service
@Transactional
public class AuthenticationService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public ApplicationUser registerUser(String username, String password) {
		String encodedPassword = passwordEncoder.encode(password);
		Role userRole = roleRepository.findByAuthority("ADMIN").get();
		Set <Role> authorities = new HashSet<>();
		authorities.add(userRole);
		System.out.println("username in service " + username);
		ApplicationUser u = userRepository.save(new ApplicationUser(0, username, encodedPassword, authorities));
		System.out.println(u.toString());
		return u;
	}
	
	
	

}
