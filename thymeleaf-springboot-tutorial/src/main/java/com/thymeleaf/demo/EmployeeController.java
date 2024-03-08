package com.thymeleaf.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmployeeController {
	@GetMapping("/iteration")
	public String bootstrap(Model model) {
		List<Employee> employees = new ArrayList<>();
		employees.add(new Employee("a", "b", "ab@gmail.com"));
		employees.add(new Employee("c", "d", "cd@gmail.com"));
		employees.add(new Employee("e", "f", "ef@gmail.com"));
		model.addAttribute("employees", employees);
		return "iteration";
	}

}
