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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.eazyroom.web.constants.TemplatePage;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.dto.CityDto;
import com.eazyroom.web.dto.Statedto;
import com.eazyroom.web.dto.UserLoginDto;
import com.eazyroom.web.entities.City;
import com.eazyroom.web.entities.Eazy;
import com.eazyroom.web.entities.State;
import com.eazyroom.web.service.CityService;
import com.eazyroom.web.service.EazyRooMService;
import com.eazyroom.web.service.StateService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EazyRooMowner {

	@Autowired
	private EazyRooMService eazyRooMService;

	@Autowired
	private StateService stateService;

	@Autowired
	private CityService cityService;

	@RequestMapping(URLConstants.OWNER)
	public String owner(HttpSession session, Model model) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant " + userData);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN;
		}
		model.addAttribute("utype", userData.getUtype());
		return TemplatePage.OWN;
	}

	@RequestMapping(URLConstants.OWNERADD)
	public String owneradd(HttpSession session, Model model) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant " + userData);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN;
		}
		model.addAttribute("contno", userData.getMobile());
		model.addAttribute("pswd", userData.getPswd());
		return TemplatePage.OWNADD;
	}

	@RequestMapping(URLConstants.OWNERDELETE)
	public String ownerdelete(HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant " + userData);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN;
		}
		return TemplatePage.OWNDELETE;
	}

	@RequestMapping(URLConstants.SEEALLOWNER)
	public String seeallowner(HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant " + userData);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN;
		}
		return TemplatePage.SEEALLOWN;
	}

	@PostMapping(URLConstants.DONEOWNER)
	public String doneowner(@ModelAttribute Eazy eazy, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant " + userData);
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN;
		}
		this.eazyRooMService.CreateAcnt(eazy);
		return TemplatePage.DONEOWN;
	}

	@GetMapping(URLConstants.SEEOWNER)
	public String seeowner(@RequestParam("city") String city, @RequestParam("utype") String utype, Model m,
			HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN;
		}
		List<Eazy> eazy = eazyRooMService.getUserByCity(city, utype);
		m.addAttribute("eazy", eazy);
		m.addAttribute("city", city);
		return TemplatePage.SEEOWNERPAGE;
	}

	@GetMapping(URLConstants.POSTDELETEOWN)
	public String postdeleteown(Model m, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN;
		}
		List<Eazy> eazy = null;
		if (userData.getUtype().equals("admin")) {
			eazy = eazyRooMService.getAll();
		} else {
			eazy = eazyRooMService.seeyourpost(userData.getMobile(), userData.getPswd(), userData.getUtype());
		}
		if (eazy.isEmpty()) {
			m.addAttribute("msg", "Invalid Contact Number and Password...!");
			return URLConstants.OWNERDELETE;
		}
		m.addAttribute("eazy", eazy);
		return URLConstants.POSTDELETEOWN;
	}

	@RequestMapping(URLConstants.DELETEOWNBYID)
	public RedirectView deleteown(@PathVariable("eazyId") int eazyId, HttpServletRequest request, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		if (Objects.isNull(userData)) {
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl(URLConstants.MAIN);
			return redirectView;
		}
		this.eazyRooMService.deleteEazy(eazyId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + URLConstants.OWNERDELETE);
		return redirectView;
	}

	@RequestMapping(URLConstants.UPDATEOWNBYID)
	public String updateForm1(@PathVariable("eid") int eid, Model m, HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		if (Objects.isNull(userData)) {
			return TemplatePage.LOGIN;
		}
		System.out.println(eid);
		Eazy eazy = this.eazyRooMService.getEazy(eid);
		m.addAttribute(eazy);
		return TemplatePage.UPDATETENANT;
	}

	@GetMapping("/allState")
	@ResponseBody
	public List<State> getState() {
		List<State> allState = this.stateService.getAllState();
		return allState;
	}

	@GetMapping("/allCity")
	@ResponseBody
	public List<City> getCity() {
		List<City> allCity = this.cityService.getAllCity();
		return allCity;
	}

	@GetMapping("/Statename")
	@ResponseBody
	public List<Statedto> allStateName() {
		List<Statedto> allStateName = this.stateService.getAllStateName();
		return allStateName;
	}

	@GetMapping("/AllCityOfState/{sid}")
	@ResponseBody
	public State getAllCityBySid(@PathVariable("sid") Integer sid) {
		List<State> allState = this.stateService.getAllState();
		State s = null;
		for (State state : allState) {
			if (state.getSid() == sid) {
				s = state;
			}
		}
		return s;
	}
}
