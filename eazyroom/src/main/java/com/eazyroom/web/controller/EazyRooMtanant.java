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

import com.eazyroom.web.constants.TemplatePage;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.dto.UserLoginDto;
import com.eazyroom.web.entities.Eazy;
import com.eazyroom.web.service.EazyRooMService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class EazyRooMtanant {
	
	@Autowired
	private EazyRooMService eazyRooMService;
	
	@RequestMapping(URLConstants.TENANT)
	public String  tenant(HttpSession session,Model model) 
	{
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant "+userData);
		if (Objects.isNull(userData)) {	
			return TemplatePage.LOGIN;
		}
		model.addAttribute("utype", userData.getUtype());
		return TemplatePage.TEN;
	}
	
	@RequestMapping("/tenantadd")
	public String  tenantadd(HttpSession session,Model model) 
	{
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant "+userData);
		if (Objects.isNull(userData)) {	
			return TemplatePage.LOGIN;
		}
		model.addAttribute("contno", userData.getMobile());
		model.addAttribute("pswd", userData.getPswd());
		return "tenantadd";
	}
		
	@RequestMapping("/tenantdelete")
	public String  tenantdelete(HttpSession session) 
	{
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant "+userData);
		if (Objects.isNull(userData)) {	
			return TemplatePage.LOGIN;
		}
		return "tenantdelete";
	}	
	
	@RequestMapping("/seealltenant")
	public String  seealltenant(HttpSession session) 
	{
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant "+userData);
		if (Objects.isNull(userData)) {	
			return TemplatePage.LOGIN;
		}
		return "seealltenant";
	}
	
	@PostMapping("/donetenant")
	public String donetenant(@ModelAttribute Eazy eazy,HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant "+userData);
		if (Objects.isNull(userData)) {	
			return TemplatePage.LOGIN;
		}
		this.eazyRooMService.CreateAcnt(eazy);
		return "donetenant";	
	}
	
	
	@GetMapping("/seetenant")
	public String  seetenant(@RequestParam("city") String city,@RequestParam("utype") String utype,Model m,HttpSession session) 
	{
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant "+userData);
		if (Objects.isNull(userData)) {	
			return TemplatePage.LOGIN;
		}
		List<Eazy> eazy =eazyRooMService.getUserByCity(city,utype);
		m.addAttribute("eazy",eazy);
		m.addAttribute("city",city);
		return "seetenant";
	}
	
	
	@GetMapping("/all")
	public List<Eazy> all(){
		List<Eazy> all = eazyRooMService.getAll();
		return all;
	}
	
	@GetMapping("/postdeletetenant")
	public String postdeletetenant(@RequestParam("contno") long contno, @RequestParam("pswd") int pswd,
			@RequestParam("utype") String utype, Model m,HttpSession session)	{
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant "+userData);
		if (Objects.isNull(userData)) {	
			return TemplatePage.LOGIN;
		}
		List<Eazy> eazy =eazyRooMService.seeyourpost(contno,pswd,utype);
		if(eazy.isEmpty())
		{
			m.addAttribute("msg","Invalid Contact Number and Password...!");
			return "tenantdelete";
		}
		m.addAttribute("eazy",eazy);
		return "postdeletetenant";
	}
	
	@RequestMapping("/deletetenant/{eazyId}")
	public RedirectView deletetenant(@PathVariable("eazyId") int eazyId,HttpServletRequest request,HttpSession session) 
	{
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant "+userData);
		if (Objects.isNull(userData)) {	
			RedirectView redirectView=new RedirectView();
			System.out.println("================>>>"+userData);
			redirectView.setUrl("/");
			return redirectView;
		}
		System.out.println(eazyId);
		this.eazyRooMService.deleteEazy(eazyId);
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/tenantdelete");
		return redirectView;	
	}
	
	@RequestMapping("/updatetenant/{eid}")
	public String updateForm2(@PathVariable("eid") int eid,Model m,HttpSession session) 
	{
		UserLoginDto userData = (UserLoginDto) session.getAttribute("userData");
		System.out.println("tenant "+userData);
		if (Objects.isNull(userData)) {	
			return TemplatePage.LOGIN;
		}
		System.out.println(eid);
		Eazy eazy = this.eazyRooMService.getEazy(eid);
		m.addAttribute(eazy);
		return "updateown";		
	}	
}
