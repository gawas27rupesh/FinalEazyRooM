package com.eazyroom.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eazyroom.web.constants.AttributeName;
import com.eazyroom.web.constants.TemplatePage;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.downloadExcel.ExcelDownloadTenant;
import com.eazyroom.web.dto.EazyDto;
import com.eazyroom.web.dto.UserLoginDto;
import com.eazyroom.web.entities.Eazy;
import com.eazyroom.web.enums.userType;
import com.eazyroom.web.service.EazyRoomService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EazyRoomTenant {
	

	@Autowired
	private EazyRoomService eazyRoomService;

	@Autowired
	ModelMapper modelMapper;
	
	@GetMapping(URLConstants.TENANT)
	public String tenant(HttpSession session, Model model) {
		log.info("t1");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		model.addAttribute(AttributeName.UTYPE, userData.getUtype());
		model.addAttribute(AttributeName.PSWD,userData.getPswd());
		model.addAttribute("username", userData.getName());
		model.addAttribute("contno",userData.getMobile());
		return "tenant";
	}

	@GetMapping("/tenantadd")
	public String tenantadd(HttpSession session, Model model) {
		log.info("t2");
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
		log.info("t3");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		this.eazyRoomService.createAcnt(eazy);
		return "redirect:/postdeletetenant";
	}

	@GetMapping("/postdeletetenant")
	public String postdeletetenant(Model m, HttpSession session) {
		log.info("t4");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		List<Eazy> eazy = null;
		if (userData.getUtype().equals(AttributeName.ADMIN)) {
			eazy = eazyRoomService.getByUtypeTenant("tenant");
			System.out.println("data++>"+eazy);
		} else {
			eazy = eazyRoomService.seeyourpost(userData.getMobile(), userData.getPswd(), userData.getUtype());
		}
		
		int uid = 1;
		for (Eazy eazy2 : eazy) {
			SimpleDateFormat inputFormat=new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date date=inputFormat.parse(eazy2.getDate().toString());
				SimpleDateFormat outputFormat=new SimpleDateFormat("dd-MM-yyyy"); 
				String formatDate = outputFormat.format(date);
				eazy2.setPostdate(formatDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (eazy2.getUtype().equals(userType.tetant.toString()))
				eazy2.setUid("T.No-" + uid);
			else
				eazy2.setUid("O.No-" + uid);
			uid++;
			LocalDate createdDate = eazy2.getDate();
			LocalDate today = LocalDate.now();
			long daysBetween = ChronoUnit.DAYS.between(createdDate, today);
			if (daysBetween <= 2) {
				eazy2.setNewTag("New");
			} else {
				eazy2.setNewTag("End");
			}
		}
		m.addAttribute(AttributeName.EAZY, eazy);
		return TemplatePage.POST_DELETE_TEN;
	}

	@GetMapping("/deletetenant/{eazyId}")
	public String deletetenant(@PathVariable("eazyId") int eazyId, HttpServletRequest request, HttpSession session) {
		log.info("t5");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return URLConstants.MAIN;
		}
		this.eazyRoomService.deleteEazy(eazyId);
		return "redirect:/postdeletetenant";
	}

	@GetMapping("/updatetenant/{eid}")
	public String updateForm2(@PathVariable("eid") int eid, Model m, HttpSession session) {
		log.info("t6");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		Eazy eazy = this.eazyRoomService.getEazy(eid);
		m.addAttribute(eazy);
		return TemplatePage.UPDATE_TENANT;
	}

	@PostMapping("/updatetenant")
	public String pdateOwner(@ModelAttribute EazyDto eazyDto, @RequestParam Integer id, HttpSession session) {
		log.info("t6");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		this.eazyRoomService.updateUser(eazyDto, id);
		return "redirect:/postdeletetenant";
	}

	@GetMapping(URLConstants.SEEALLOWNER)
	public String seeallowner(HttpSession session) {
		log.info("t7");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		return TemplatePage.SEE_ALL_OWNER_PAGE;
	}

	@GetMapping(URLConstants.SEEOWNER)
	public String seeowner(@RequestParam("state") String state, @RequestParam("city") String city,
			@RequestParam("utype") String utype, Model m, HttpSession session) {
		log.info("t8");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		List<Eazy> eazy = eazyRoomService.getUserByCity(state, city, utype);
		int uid = 1;
		for (Eazy eazy2 : eazy) {
			SimpleDateFormat inputFormat=new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date date = inputFormat.parse(eazy2.getDate().toString());
				SimpleDateFormat outputFormat=new SimpleDateFormat("dd-MM-yyyy");
				String formatDate = outputFormat.format(date);
				eazy2.setPostdate(formatDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (eazy2.getUtype().equals("tenant"))
				eazy2.setUid("T.No-" + uid);
			else
				eazy2.setUid("O.No-" + uid);
			uid++;
			LocalDate createdDate = eazy2.getDate();
			LocalDate today = LocalDate.now();
			long daysBetween = ChronoUnit.DAYS.between(createdDate, today);
			if (daysBetween <= 2) {
				eazy2.setNewTag("New");
			} else {
				eazy2.setNewTag("End");
			}
		}
		m.addAttribute(AttributeName.EAZY, eazy);
		m.addAttribute(AttributeName.CITY, city);
		return "seeowner";
	}
	
	@GetMapping("/tenantexcel")
	public ModelAndView excelTenant(ModelMap mp, HttpSession session) {
		log.info("t9");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		List<Eazy> eazy = null;
		if (userData.getUtype().equals(AttributeName.ADMIN)) {
			eazy = eazyRoomService.getByUtypeTenant("tenant");
		} else {
			eazy = eazyRoomService.seeyourpost(userData.getMobile(), userData.getPswd(), userData.getUtype());
		}
		if (eazy.isEmpty()) {
			mp.put(AttributeName.MSG, "Invalid Contact Number and Password...!");
			return null;
		}
		int uid = 1;
		for (Eazy eazy2 : eazy) {
			SimpleDateFormat inputFormat=new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date date = inputFormat.parse(eazy2.getDate().toString());
				SimpleDateFormat outputFormat=new SimpleDateFormat("dd-MM-yyyy");
				String formatDate = outputFormat.format(date);
				eazy2.setPostdate(formatDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (eazy2.getUtype().equals("tenent"))
				eazy2.setUid("T.No-" + uid);
			else
				eazy2.setUid("O.No-" + uid);
			uid++;
		}
		mp.put("utype","TENANT");
		mp.put("User Name", userData.getName());
		mp.put("User Mobile", userData.getMobile());
		mp.put("User Designation", userData.getUtype());
		mp.put(AttributeName.EAZY, eazy);
		
		return new ModelAndView(new ExcelDownloadTenant());
		
	}

	@GetMapping("/all")
	public List<Eazy> all() {
		List<Eazy> all = eazyRoomService.getAll();
		return all;
	}
}
