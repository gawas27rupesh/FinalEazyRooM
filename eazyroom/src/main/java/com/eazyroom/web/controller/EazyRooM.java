package com.eazyroom.web.controller;

import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eazyroom.web.constants.TemplatePage;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.dto.UserLoginDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class EazyRooM {
	
	@RequestMapping(URLConstants.HOME)
	public String home(HttpSession session,Model model) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		if (Objects.nonNull(userData)) {	
			if(userData.getUtype().equalsIgnoreCase("admin")) {
				model.addAttribute("utype", userData.getUtype());
				return TemplatePage.INDEX;
			}
			if(userData.getUtype().equalsIgnoreCase("owner")) {
				model.addAttribute("utype", userData.getUtype());
				return TemplatePage.OWN;
			}
			if(userData.getUtype().equalsIgnoreCase("tenant")) {
				model.addAttribute("utype", userData.getUtype());
				return TemplatePage.TEN;
			}
		}
		return TemplatePage.LOGIN;
	}	
}
