package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringbootWarDemo1Application {
	
	public static void main(String[] args) {
		SpringApplication.run(SpringbootWarDemo1Application.class, args);
		Student student = new Student();
		student.setFirstname("asdasd");
		student.setLastname("asdasdasdasd");
		System.out.println(student.toString());
	}

}
