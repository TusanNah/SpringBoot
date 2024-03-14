package com.management.demo;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.management.demo.models.ApplicationUser;
import com.management.demo.models.Role;
import com.management.demo.repository.RoleRepository;
import com.management.demo.repository.UserRepository;
import com.management.demo.service.TokenService;

@SpringBootApplication
public class SpringSecurity6Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringSecurity6Application.class, args);
	}
	
	@Autowired
	TokenService tokenService;
	
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
			String token = "eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJzZWxmIiwic3ViIjoiMTIzIiwiaWF0IjoxNzEwMjk5NTIyLCJyb2xlcyI6IkFETUlOIn0.ugYBU6h9ULynuJ3-LEavnZX3VsVL1sGg8673io1IE6_fDP1CQE2QkI-2Di9nR-UfWB0aB4yaTmdZnBzVPt6WYZlgXdOPzYIWkMGsjE15kP_fZPRgUjtw6-HJsArwN9zybBJbv7vLRgoz2JNribix55LYtPQd2vX1QZgI7tpcwtVGGhNtNKyc1-opHPSxJEpdxN5h99Z_-S4wzi2Ok_FQztUL4XxggdgVKPQDfSr10lqrVCyc4P5ZmU9eyGNxuaTraK26jedm5R6-f76Jud1QduAhh1QU1ubllUzAUI5LjZd8GZSXM_MW0p9nD4kzX3nXMdfjqOdVkFYB95pM4owsjw";
//			tokenService.decodeJwt(token);
		};
	}

}
