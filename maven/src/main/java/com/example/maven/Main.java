package com.example.maven;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

public class Main {
	private static class User {
		private String name;
		private Integer age;

		public User(String name, Integer age) {
			this.name = name;
			this.age = age;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Integer getAge() {
			return age;
		}

		public void setAge(Integer age) {
			this.age = age;
		}

	}

	 public static void main(String[] args) {
	        List<String> list = new ArrayList<>(Arrays.asList("567", "123"));
	        List<User> users = Arrays.asList(new User("John", 30), new User("Julie", 35));

	        List<User> stream = users.parallelStream().collect(Collectors.toList());

	        for (String s : list) {
	            System.out.print(s + " ");
	        }
	        System.out.println(stream);
	    }
}
