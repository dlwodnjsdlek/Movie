package com.my.movie;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.my.movie.dao.map")
public class Application {
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}