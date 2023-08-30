//package com.eazyroom.web.interceptor;
//
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@Component
//public class GeneralInterceptor implements HandlerInterceptor {
//
//	private static final Logger log = LoggerFactory.getLogger(GeneralInterceptor.class);
//
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		log.info("preHandle invoked..." + request.getRequestURL(), request.getMethod());
//		return true;
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		log.info("postHandle invoked..." + request.getRequestURL(), request.getMethod());
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		log.info("afterCompletion invoked..." + request.getRequestURL(), request.getMethod());
//	}
//}
//
