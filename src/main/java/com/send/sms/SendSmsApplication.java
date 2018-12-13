package com.send.sms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
@MapperScan("com.send.sms.dao")
public class SendSmsApplication extends SpringBootServletInitializer{
	 @Override
	 protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    return application.sources(SendSmsApplication.class);
	 }

	public static void main(String[] args) {
		SpringApplication.run(SendSmsApplication.class, args);
	}
}
