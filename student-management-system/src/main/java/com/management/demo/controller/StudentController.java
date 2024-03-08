package com.management.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.management.demo.entity.Student;
import com.management.demo.service.StudentService;

@Controller
public class StudentController {
	
	private StudentService studentService;

	//We can omit @Autowired annotation if we have only one fields constructor
	public StudentController(StudentService studentService) {
		super();
		this.studentService = studentService;
	}
	
	//GET 
	@GetMapping( value = "/students")
	public String listStudents(Model model) {
		List<Student> students = studentService.getAllStudents();
		model.addAttribute("students", students);
		return "students";
	}
	
	@GetMapping("/students/new")
	public String createStudentForm(Model model) {
		Student student = new Student();
		model.addAttribute("student", student);
		return "create_student";
	}
	
	@PostMapping("/students")
	public String saveStudent(@ModelAttribute("student") Student student) {
		studentService.saveStudent(student);
		return "redirect:/students";
	}
	
	@GetMapping("/students/edit/{id}")
	public String editStudentForm(Model model, @PathVariable(name = "id") Long id) {
		Student student = studentService.getStudentById(id);
		model.addAttribute("student", student);
		return "edit_student";
	}
	
	@PostMapping("/students/{id}")
	public String updateStudent(@PathVariable Long id, @ModelAttribute("student") Student student, Model model) {
		
		//get student from database by id
		Student existingStudent = studentService.getStudentById(id);
		System.out.println(student.toString());
		Long existingId = existingStudent.getId();
		existingStudent = student;
		existingStudent.setId(existingId);
		studentService.saveStudent(existingStudent);
		
		return "redirect:/students";
	}
	
	@DeleteMapping("/students/{id}")
	public String deleteStudent(@PathVariable Long id) {
		studentService.deleteStudentById(id);
		return "redirtect:/students";
	}
	
	@GetMapping("/students/delete/{id}")
	public String deleteStudent3(@PathVariable Long id) {
		studentService.deleteStudentById(id);
		return "redirect:/students";
	}
}
