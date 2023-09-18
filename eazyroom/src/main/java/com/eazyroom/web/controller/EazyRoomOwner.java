package com.eazyroom.web.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Objects;

import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class EazyRoomOwner {

	Logger log = LoggerFactory.getLogger(EazyRoomOwner.class);

	@Autowired
	private EazyRoomService eazyRoomService;

	@Autowired
	ModelMapper modelMapper;

	@GetMapping(URLConstants.OWNER)
	public String owner(HttpSession session, Model model) {
		log.info("1");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		model.addAttribute(AttributeName.UTYPE, userData.getUtype());
		model.addAttribute("username", userData.getName());
		return TemplatePage.OWNER_PAGE;
	}

	@RequestMapping(URLConstants.OWNERADD)
	public String owneradd(HttpSession session, Model model) {
		log.info("2");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		model.addAttribute(AttributeName.CONTNO, userData.getMobile());
		model.addAttribute(AttributeName.PSWD, userData.getPswd());
		return TemplatePage.OWNER_ADD_PAGE;
	}

	@PostMapping(URLConstants.DONEOWNER)
	public String doneowner(@ModelAttribute Eazy eazy, HttpSession session) {
		log.info("5");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		this.eazyRoomService.createAcnt(eazy);
		return "redirect:" + URLConstants.POSTDELETEOWN;
	}

	@GetMapping(URLConstants.POSTDELETEOWN)
	public String postdeleteown(Model m, HttpSession session) {
		log.info("777");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		List<Eazy> eazy = null;
		if (userData.getUtype().equals(AttributeName.ADMIN)) {
			eazy = eazyRoomService.getByUtype("owner");
		} else {
			eazy = eazyRoomService.seeyourpost(userData.getMobile(), userData.getPswd(), userData.getUtype());
		}
		if (eazy.isEmpty()) {
			m.addAttribute(AttributeName.MSG, "Invalid Contact Number and Password...!");
			return null;
		}
		int oid=1;
		for (Eazy eazy2 : eazy) {
			SimpleDateFormat desiredFormat = new SimpleDateFormat("dd-MM-yyyy");
			String formattedDate = desiredFormat.format(eazy2.getDate());
			eazy2.setPostdate(formattedDate);
			eazy2.setUid("OID-"+oid);
			oid++;
		}
		m.addAttribute(AttributeName.EAZY, eazy);
		return "postdeleteown";
	}
	
	@RequestMapping(URLConstants.DELETEOWNBYID)
	public String deleteown(@PathVariable("eazyId") int eazyId, HttpServletRequest request, HttpSession session) {
		log.info("8");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return URLConstants.MAIN;
		}
		this.eazyRoomService.deleteEazy(eazyId);
		return "redirect:/postdeleteown";
	}
	
	@GetMapping("/updateown/{eid}")
	public String updateForm1(@PathVariable("eid") int eid, Model m, HttpSession session) {
		log.info("9");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		Eazy eazy = this.eazyRoomService.getEazy(eid);
		System.out.println(eazy);
		m.addAttribute(eazy);
		return "updateown";
	}
	
	@PostMapping("/updateowner")
	public String pdateOwner(@ModelAttribute EazyDto eazyDto,@RequestParam Integer id,HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		System.out.println("yes");
		this.eazyRoomService.updateUser(eazyDto, id);	
		return "redirect:/postdeleteown";
	}
	//done
	
	

	@RequestMapping(URLConstants.SEEALLOWNER)
	public String seeallowner(HttpSession session) {
		log.info("4");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		return TemplatePage.SEE_ALL_OWNER_PAGE;
	}


	@GetMapping(URLConstants.SEEOWNER)
	public String seeowner(@RequestParam("city") String city, @RequestParam("utype") String utype, Model m,
			HttpSession session) {
		log.info("6");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		List<Eazy> eazy = eazyRoomService.getUserByCity(city, utype);
		m.addAttribute(AttributeName.EAZY, eazy);
		m.addAttribute(AttributeName.CITY, city);
		return TemplatePage.SEE_OWNER_PAGE;
	}
	
}
