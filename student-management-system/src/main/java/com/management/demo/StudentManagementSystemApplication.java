package com.management.demo;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.management.demo.entity.Student;
import com.management.demo.repository.StudentRepository;

@SpringBootApplication
public class StudentManagementSystemApplication{

	public static void main(String[] args) {
		SpringApplication.run(StudentManagementSystemApplication.class, args);
	}
	
//	@Autowired
//	private StudentRepository studentRepository;
//	@Override
//	public void run(String... args) throws Exception {
//		// TODO Auto-generated method stub
//		Student s1 = new Student("Tuan", "Truong", "tuantruong@gmail.com");
//		studentRepository.save(s1);
//		Student s2 = new Student("Tey", "Beo", "teybeo@gmail.com");
//		studentRepository.save(s2);
//		Student s3 = new Student("Tuan", "Beo", "tuanbeo@gmail.com");
//		studentRepository.save(s3 );
//		
//	}

}
