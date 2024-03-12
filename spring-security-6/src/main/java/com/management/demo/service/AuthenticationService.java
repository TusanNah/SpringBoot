package com.management.demo.service;

import java.util.HashSet;
import java.util.Set;

import javax.naming.AuthenticationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.management.demo.models.ApplicationUser;
import com.management.demo.models.LoginResponseDTO;
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
	
	@Autowired //@Bean in SecurityConfiguration
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private TokenService tokenService;
	
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
	public LoginResponseDTO loginUser(String username, String password) {
		System.out.println("Login user " + password);
		Authentication auth = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(username, password));
		String token = tokenService.generateJwt(auth);
		System.out.println("Token");
		return new LoginResponseDTO(userRepository.findByUsername(username).get(), token);
	}
	
	
	

}
