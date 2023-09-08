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
import org.springframework.web.servlet.view.RedirectView;

import com.eazyroom.web.constants.AttributeName;
import com.eazyroom.web.constants.TemplatePage;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.dto.UserLoginDto;
import com.eazyroom.web.entities.Eazy;
import com.eazyroom.web.service.EazyRoomService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EazyRoomOwner {

	@Autowired
	private EazyRoomService eazyRoomService;
	
	
	@RequestMapping(URLConstants.OWNER)
	public String owner(HttpSession session, Model model) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		model.addAttribute(AttributeName.UTYPE, userData.getUtype());
		return TemplatePage.OWNER_PAGE;
	}

	@RequestMapping(URLConstants.OWNERADD)
	public String owneradd(HttpSession session, Model model) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		model.addAttribute(AttributeName.CONTNO, userData.getMobile());
		model.addAttribute(AttributeName.PSWD, userData.getPswd());
		return TemplatePage.OWNER_ADD_PAGE;
	}

	@RequestMapping(URLConstants.OWNERDELETE)
	public String ownerdelete(HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		return TemplatePage.OWNER_DELETE_PAGE;
	}

	@RequestMapping(URLConstants.SEEALLOWNER)
	public String seeallowner(HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		return TemplatePage.SEE_ALL_OWNER_PAGE;
	}

	@PostMapping(URLConstants.DONEOWNER)
	public String doneowner(@ModelAttribute Eazy eazy, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		this.eazyRoomService.CreateAcnt(eazy);
		return TemplatePage.DONE_OWNER_PAGE;
	}

	@GetMapping(URLConstants.SEEOWNER)
	public String seeowner(@RequestParam("city") String city, @RequestParam("utype") String utype, Model m,
			HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		List<Eazy> eazy = eazyRoomService.getUserByCity(city, utype);
		m.addAttribute(AttributeName.EAZY, eazy);
		m.addAttribute(AttributeName.CITY, city);
		return TemplatePage.SEE_OWNER_PAGE;
	}

	@GetMapping(URLConstants.POSTDELETEOWN)
	public String postdeleteown(Model m, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		List<Eazy> eazy = null;
		if (userData.getUtype().equals(AttributeName.ADMIN)) {
			eazy = eazyRoomService.getAll();
		} else {
			eazy = eazyRoomService.seeyourpost(userData.getMobile(), userData.getPswd(), userData.getUtype());
		}
		if (eazy.isEmpty()) {
			m.addAttribute(AttributeName.MSG, "Invalid Contact Number and Password...!");
			return URLConstants.OWNERDELETE;
		}
		m.addAttribute(AttributeName.EAZY, eazy);
		return URLConstants.POSTDELETEOWN;
	}

	@RequestMapping(URLConstants.DELETEOWNBYID)
	public RedirectView deleteown(@PathVariable("eazyId") int eazyId, HttpServletRequest request, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl(URLConstants.MAIN);
			return redirectView;
		}
		this.eazyRoomService.deleteEazy(eazyId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + URLConstants.OWNERDELETE);
		return redirectView;
	}

	@RequestMapping(URLConstants.UPDATEOWNBYID)
	public String updateForm1(@PathVariable("eid") int eid, Model m, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		Eazy eazy = this.eazyRoomService.getEazy(eid);
		m.addAttribute(eazy);
		return TemplatePage.UPDATE_TENANT;
	}
}
