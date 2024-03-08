package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.model.Employee;
import com.example.demo.respository.EmployeeRepository;
import com.example.demo.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	
	private EmployeeRepository employeeRepository;
	
	public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
		super();
		this.employeeRepository = employeeRepository;
	}


	@Override
	public Employee saveEmployee(Employee employee) {
		// TODO Auto-generated method stub
		return employeeRepository.save(employee);
	}


	@Override
	public List<Employee> getAllEmployees() {
		return employeeRepository.findAll();
	}


	@Override
	public Employee getEmployeeById(long id) {
		// TODO Auto-generated method stub
		Optional<Employee> emOptional = employeeRepository.findById(id);
		if (emOptional.isPresent()) {
			return emOptional.get();
		}
		else {
			throw new ResourceNotFoundException("Employee", "ID", id);
		}
		
//		return employeeRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Employee", "ID", id));
	}


	@Override
	public Employee updateEmployee(Employee employee, long id) {
		 //Check employee with id
		System.out.println(employee.toString());
		Employee exstingEmployee = employeeRepository.findById(id).orElseThrow(
				()-> new ResourceNotFoundException("Employee", "ID", id));
//		exstingEmployee = employee;
		long existingId = exstingEmployee.getId();
		exstingEmployee = employee;
		exstingEmployee.setId(existingId);
		
		employeeRepository.save(exstingEmployee);
		return exstingEmployee;
	}


	@Override
	public void deleteEmployee(long id) {
		//Check that employee with id
		employeeRepository.findById(id).orElseThrow(()-> new ResourceNotFoundException("Employee", "ID", id));
		employeeRepository.deleteById(id);
		
	}



}
