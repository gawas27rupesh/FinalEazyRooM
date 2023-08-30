package com.eazyroom.web;

import org.modelmapper.ModelMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@SpringBootApplication
@ComponentScan({"com.eazyroom.web.constants,com.eazyroom.web.controller,com.eazyroom.web.interceptor,com.eazyroom.web.utility,com.eazyroom.web.serviceImpl,com.eazyroom.web.service,com.eazyroom.web.dto,com.eazyroom.web.entities,com.eazyroom.web.repository"})
public class EazyroomApplication {

	public static void main(String[] args) {
		SpringApplication.run(EazyroomApplication.class, args);
	}
	
	@Bean
	public ModelMapper modelMapper() {
		return new ModelMapper();
	}

}
