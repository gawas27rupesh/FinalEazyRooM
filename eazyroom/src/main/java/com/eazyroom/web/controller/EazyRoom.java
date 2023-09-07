package com.eazyroom.web.controller;

import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eazyroom.web.constants.AttributeName;
import com.eazyroom.web.constants.TemplatePage;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.dto.UserLoginDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class EazyRoom {
	
	@RequestMapping(URLConstants.HOME)
	public String home(HttpSession session,Model model) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.nonNull(userData)) {	
			if(userData.getUtype().equalsIgnoreCase(AttributeName.ADMIN)) {
				model.addAttribute(AttributeName.UTYPE, userData.getUtype());
				return TemplatePage.INDEX_PAGE;
			}
			if(userData.getUtype().equalsIgnoreCase(AttributeName.OWNER)) {
				model.addAttribute(AttributeName.UTYPE, userData.getUtype());
				return TemplatePage.OWNER_PAGE;
			}
			if(userData.getUtype().equalsIgnoreCase(AttributeName.TENANT)) {
				model.addAttribute(AttributeName.UTYPE, userData.getUtype());
				return TemplatePage.TEN;
			}
		}
		return TemplatePage.LOGIN_PAGE;
	}	
}
