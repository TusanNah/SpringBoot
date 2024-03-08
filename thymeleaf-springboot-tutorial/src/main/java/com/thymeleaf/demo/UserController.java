package com.thymeleaf.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/if-unless")
	public String ifUnless(Model model) {
		List<User> users = new ArrayList<>();
		users.add(new User("a", "a@gmail.com", "ADMIN"));
		users.add(new User("b", "b@gmail.com", "USER"));
		users.add(new User("c", "c@gmail.com", "ADMIN"));
		users.add(new User("d", "d@gmail.com", "USER"));
		model.addAttribute("users", users);
		return "if-unless";
	}
	
}
