package com.eazyroom.web.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eazyroom.web.constants.AttributeName;
import com.eazyroom.web.constants.TemplatePage;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.dto.UserLoginDto;
import com.eazyroom.web.entities.login;
import com.eazyroom.web.enums.userType;
import com.eazyroom.web.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping(URLConstants.LOGIN_PAGE)
	public String loginPage(HttpServletRequest request, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		if (Objects.nonNull(userData)) {
			if(userData.getUtype().equalsIgnoreCase(userType.admin.toString()))
				return URLConstants.REDIRECT + URLConstants.HOME;
			else if(userData.getUtype().equalsIgnoreCase(userType.owner.toString()))
				return URLConstants.OWNER;	
			else if(userData.getUtype().equalsIgnoreCase(userType.tetant.toString()))
				return URLConstants.TENANT;
		}
		return TemplatePage.LOGIN_PAGE;
	}
	
	
	
	@GetMapping(URLConstants.LOGINSUCCESS)
	public String loginsuccess(@RequestParam("mobile") String mobile, @RequestParam("password") String password,RedirectAttributes red,
			HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		UserLoginDto userData = new UserLoginDto();
		List<login> alList=this.loginService.getAll();
		for (login eazy : alList) {			
			if(mobile.equals(eazy.getMobile())&&password.equals(eazy.getPswd())) {
				userData.setMobile(eazy.getMobile());
				userData.setPswd(eazy.getPswd());
				userData.setUtype(eazy.getUtype());
				userData.setName(eazy.getName());
				session.setAttribute(AttributeName.USERDATA, userData);
				session.setMaxInactiveInterval(60 * 60 * 1);
				return URLConstants.REDIRECT + URLConstants.HOME;
			}
		}
		String str = "Sorry! Mobile Number or Password Is Incorrect...!";
		red.addFlashAttribute("message", str);
		return URLConstants.REDIRECT + URLConstants.MAIN;
	}
	
	@GetMapping(URLConstants.REGISTER)
	public String register() {
		return TemplatePage.REGISTER_PAGE;	
	}
	
	@PostMapping(URLConstants.REGISTERSUCCESS)
	public String registersuccess(@ModelAttribute login login, @RequestParam("pswd") String pswd,@RequestParam("name") String name,
			@RequestParam("cpswd") String cpswd, @RequestParam("mobile") String mobile, @RequestParam("utype") String utype,HttpSession session) {
		UserLoginDto userData = new UserLoginDto();
		if(pswd.equals(cpswd)) {
		this.loginService.registerAct(login);
		userData.setMobile(mobile);
		userData.setPswd(pswd);
		userData.setUtype(utype);
		userData.setName(name);
		session.setAttribute("userData", userData);
		session.setMaxInactiveInterval(60 * 60 * 1);
		return URLConstants.REDIRECT + URLConstants.HOME;
		}
		return TemplatePage.REGISTER_PAGE;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session,RedirectAttributes red) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		if (Objects.isNull(userData)) {
			return URLConstants.REDIRECT + URLConstants.MAIN;
		}
		session.invalidate();
		String str = "Logout Successful...!";
		red.addFlashAttribute("msg", str);
		return URLConstants.REDIRECT + URLConstants.MAIN;
	}	
}
