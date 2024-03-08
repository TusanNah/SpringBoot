package com.springboot.springbootbackend;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StudentController {
	
	//GET, localhost:8080/student
	@GetMapping("/student")
	public Student getStudent() {
		return new Student("Anh", "Tuan");
	}
	
	//GET, localhost:8080/students
	@GetMapping("/students")
	public List<Student> getStudents() {
		List<Student> students = new ArrayList<Student>();
		students.add(new Student("Tey", "Beo"));
		students.add(new Student("Tuan", "DepTrai"));
		students.add(new Student("Tey", "Cute"));
		students.add(new Student("Tey", "Ko Cute"));
		return students;
	}
	
	//GET, localhost:8080/student/firstname/lastname
	@GetMapping("/student/{firstname}/{lastname}")
	public Student studentPathVariable(@PathVariable("firstname") String first,@PathVariable("lastname") String last) {
		return new Student(first, last);
	}
	
	//Build rest API to handle query parameters
	// localhost:8080/student?firstname=Ramesh&lastname=Tuan
	@GetMapping("/student/query")
	public Student studentQueryParam(@RequestParam(name = "firstname") String firstName, @RequestParam(name = "lastname") String lastName) {
		return new Student(firstName, lastName);
	}
}
