package com.eazyroom.web.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eazyroom.web.constants.AttributeName;
import com.eazyroom.web.constants.TemplatePage;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.dto.EazyDto;
import com.eazyroom.web.dto.UserLoginDto;
import com.eazyroom.web.entities.Eazy;
import com.eazyroom.web.service.EazyRoomService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EazyRoomTenant {

	@Autowired
	private EazyRoomService eazyRoomService;

	@RequestMapping(URLConstants.TENANT)
	public String tenant(HttpSession session, Model model) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		model.addAttribute(AttributeName.UTYPE, userData.getUtype());
		model.addAttribute("username", userData.getName());
		return "tenant";
	}

	@RequestMapping("/tenantadd")
	public String tenantadd(HttpSession session, Model model) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		model.addAttribute(AttributeName.CONTNO, userData.getMobile());
		model.addAttribute(AttributeName.PSWD, userData.getPswd());
		return TemplatePage.TEN_ADD;
	}

	@PostMapping("/donetenant")
	public String donetenant(@ModelAttribute Eazy eazy, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		this.eazyRoomService.CreateAcnt(eazy);
		return "redirect:/postdeletetenant";
	}
	
	@GetMapping("/postdeletetenant")
	public String postdeletetenant(Model m, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		List<Eazy> eazy = null;
		if (userData.getUtype().equals(AttributeName.ADMIN)) {
			eazy = eazyRoomService.getByUtype("tenant");
		} else {
			eazy = eazyRoomService.seeyourpost(userData.getMobile(), userData.getPswd(), userData.getUtype());
		}
		if (eazy.isEmpty()) {
			m.addAttribute(AttributeName.MSG, "Invalid Contact Number and Password...!");
			return TemplatePage.TENANT_DELETE;
		}
		m.addAttribute(AttributeName.EAZY, eazy);
		return TemplatePage.POST_DELETE_TEN;
	}

	@RequestMapping("/deletetenant/{eazyId}")
	public String deletetenant(@PathVariable("eazyId") int eazyId, HttpServletRequest request, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return URLConstants.MAIN;
		}
		this.eazyRoomService.deleteEazy(eazyId);
		return "redirect:/postdeletetenant";
	}

	@RequestMapping("/updatetenant/{eid}")
	public String updateForm2(@PathVariable("eid") int eid, Model m, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		Eazy eazy = this.eazyRoomService.getEazy(eid);
		m.addAttribute(eazy);
		return TemplatePage.UPDATE_TENANT;
	}
	
	@PostMapping("/updatetenant")
	public String pdateOwner(@ModelAttribute EazyDto eazyDto,@RequestParam Integer id,HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		System.out.println("yes");
		this.eazyRoomService.updateUser(eazyDto, id);	
		return "redirect:/postdeletetenant";
	}
	
	//done
	
	@RequestMapping("/seealltenant")
	public String seealltenant(HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		return TemplatePage.SEE_ALL_TEN;
	}

	@GetMapping("/seetenant")
	public String seetenant(@RequestParam("city") String city, @RequestParam("utype") String utype, Model m,
			HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		List<Eazy> eazy = eazyRoomService.getUserByCity(city, utype);
		m.addAttribute(AttributeName.EAZY, eazy);
		m.addAttribute(AttributeName.CITY, city);
		return TemplatePage.SEE_TENANT_PAGE;
	}

	
	@GetMapping("/all")
	public List<Eazy> all() {
		List<Eazy> all = eazyRoomService.getAll();
		return all;
	}
}
