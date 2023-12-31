package com.eazyroom.web.controller;

import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.eazyroom.web.constants.AttributeName;
import com.eazyroom.web.constants.TemplatePage;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.dto.UserLoginDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class EazyRoom {
	
	@GetMapping(URLConstants.HOME)
	public String home(HttpSession session,Model model) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.nonNull(userData)) {	
			if(userData.getUtype().equalsIgnoreCase(AttributeName.ADMIN)) {
				model.addAttribute(AttributeName.UTYPE, userData.getUtype());
				model.addAttribute("username", userData.getName());
				return TemplatePage.INDEX_PAGE;
			}
			if(userData.getUtype().equalsIgnoreCase(AttributeName.OWNER)) {
				model.addAttribute(AttributeName.UTYPE, userData.getUtype());
				model.addAttribute("username", userData.getName());
				return TemplatePage.OWNER_PAGE;
			}
			if(userData.getUtype().equalsIgnoreCase(AttributeName.TENANT)) {
				model.addAttribute(AttributeName.UTYPE, userData.getUtype());
				model.addAttribute("username", userData.getName());
				return TemplatePage.TEN;
			}
		}
		return TemplatePage.LOGIN_PAGE;
	}	
}
