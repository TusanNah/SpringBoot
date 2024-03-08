package com.management.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.management.demo.entity.Student;



public interface StudentRepository extends JpaRepository<Student, Long>{

}
