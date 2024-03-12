package com.management.demo.service;


import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.management.demo.models.ApplicationUser;
import com.management.demo.models.Role;
import com.management.demo.repository.UserRepository;

@Service
public class UserService implements UserDetailsService {
	
	
	@Autowired
	private UserRepository userRepository;
	
		
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("In the user details service");
		UserDetails u = userRepository.findByUsername(username).get();
		System.out.println("User is UserService " + u);
		System.out.println(u.getPassword());
		return u;
	}

}
