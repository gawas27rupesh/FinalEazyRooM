package com.eazyroom.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.eazyroom.web.downloadExcel.ExcelDownloadOwner;
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
		log.info("o1");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		model.addAttribute(AttributeName.UTYPE, userData.getUtype());
		model.addAttribute("username", userData.getName());
		return TemplatePage.OWNER_PAGE;
	}

	@GetMapping(URLConstants.OWNERADD)
	public String owneradd(HttpSession session, Model model) {
		log.info("o2");
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
		log.info("o3");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		this.eazyRoomService.createAcnt(eazy);
		return "redirect:" + URLConstants.POSTDELETEOWN;
	}

	@GetMapping(URLConstants.POSTDELETEOWN)
	public String postdeleteown(Model m, HttpSession session) {
		log.info("o4");
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
		int uid = 1;
		for (Eazy eazy2 : eazy) {
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date date = inputFormat.parse(eazy2.getDate().toString());
				SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
				String formattedDate = outputFormat.format(date);
				eazy2.setPostdate(formattedDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (eazy2.getUtype().equals("tenent"))
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
		return "postdeleteown";
	}

	@GetMapping(URLConstants.DELETEOWNBYID)
	public String deleteown(@PathVariable("eazyId") int eazyId, HttpServletRequest request, HttpSession session) {
		log.info("o5");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return URLConstants.MAIN;
		}
		this.eazyRoomService.deleteEazy(eazyId);
		return "redirect:/postdeleteown";
	}

	@GetMapping("/updateown/{eid}")
	public String updateForm1(@PathVariable("eid") int eid, Model m, HttpSession session) {
		log.info("o6");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		Eazy eazy = this.eazyRoomService.getEazy(eid);
		m.addAttribute(eazy);
		return "updateown";
	}

	@PostMapping("/updateowner")
	public String pdateOwner(@ModelAttribute EazyDto eazyDto, @RequestParam Integer id, HttpSession session) {
		log.info("o7");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		this.eazyRoomService.updateUser(eazyDto, id);
		return "redirect:/postdeleteown";
	}

	@GetMapping("/seealltenant")
	public String seealltenant(HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		log.info("o8");
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN_PAGE;
		}
		return TemplatePage.SEE_ALL_TEN;
	}

	@GetMapping("/seetenant")
	public String seetenant(@RequestParam("state") String state, @RequestParam("city") String city,
			@RequestParam("utype") String utype, Model m, HttpSession session) {
		log.info("o9");
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
		m.addAttribute("state", state);
		m.addAttribute("utype", utype);
		return "postdeletetenant";
	}

	@GetMapping("/seetenantpdf/{state}/{city}/{utype}")
	public String seetenantpdf(@PathVariable("state") String state, @PathVariable("city") String city,
			@PathVariable("utype") String utype, Model m, HttpSession session) {
		log.info("o10");
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
		return "pdf";
	}

	@GetMapping("/pdf")
	public String pdf(Model m, HttpSession session) {
		log.info("o11");
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
		m.addAttribute("utype", "TENANT");
		m.addAttribute(AttributeName.EAZY, eazy);
		return "pdf";
	}

	@GetMapping("/ownerexcel")
	public ModelAndView excelOwner(ModelMap mp, HttpSession session) {
		log.info("o12");
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		List<Eazy> eazy = null;
		if (userData.getUtype().equals(AttributeName.ADMIN)) {
			eazy = eazyRoomService.getByUtype("owner");
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
		mp.put("utype", "OWNER");
		mp.put("User Name", userData.getName());
		mp.put("User Mobile", userData.getMobile());
		mp.put("User Designation", userData.getUtype());
		mp.put(AttributeName.EAZY, eazy);

		return new ModelAndView(new ExcelDownloadOwner());
	}
}
