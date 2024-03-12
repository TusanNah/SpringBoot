package com.management.demo;

import java.util.HashSet;
import java.util.Set;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.management.demo.models.ApplicationUser;
import com.management.demo.models.Role;
import com.management.demo.repository.RoleRepository;
import com.management.demo.repository.UserRepository;

@SpringBootApplication
public class SpringSecurity6Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringSecurity6Application.class, args);
	}
	
	@Bean
	CommandLineRunner run(RoleRepository roleRepository, UserRepository userRepository, PasswordEncoder passwordEncoder) {
		return args -> {
			if (roleRepository.findByAuthority("ADMIN").isPresent()) return;
			Role adminRole = roleRepository.save( new Role("ADMIN"));
			roleRepository.save(new Role("USER"));
			Set<Role> roles = new HashSet<>();
			roles.add(adminRole);
			ApplicationUser admin = new ApplicationUser(1, "admin", passwordEncoder.encode("password"), roles);
			userRepository.save(admin);
			System.out.println(userRepository.findByUsername("admin").get().toString()); 
		};
	}

}
