//
//package com.eazyroom.web.interceptor;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//@Configuration
//public class InterceptorConfig implements WebMvcConfigurer {
//	
//	@Autowired
//	private GeneralInterceptor generalInterceptor;
//
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(generalInterceptor);
//		//.addPathPatterns("/**");
//		//.excludePathPatterns("/", "/login/**","/images/**","/fonts/**", "/css/**", "/js/**","/home","/logout");
//	}	
//}
//	
