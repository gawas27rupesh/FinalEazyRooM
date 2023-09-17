package com.eazyroom.web.controller;

import java.io.ByteArrayInputStream;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.eazyroom.web.constants.AttributeName;
import com.eazyroom.web.constants.URLConstants;
import com.eazyroom.web.dto.UserLoginDto;
import com.eazyroom.web.entities.Eazy;
import com.eazyroom.web.service.EazyRoomPdfService;
import com.eazyroom.web.utility.GeneratePdfUtil;

import jakarta.servlet.http.HttpSession;

@RestController
public class EazyRoomPdf {
	
	@Autowired
	private EazyRoomPdfService eazyRooMpdfService;
	

	@GetMapping(value =URLConstants.PDF_OWNER, produces = MediaType.APPLICATION_PDF_VALUE)
	public ResponseEntity<InputStreamResource> ownerReport(@PathVariable("city") String city,HttpSession session) {
		UserLoginDto userData = (UserLoginDto) session.getAttribute(AttributeName.USERDATA);
		if (Objects.isNull(userData)) {	
			return null;
		}else {
		String utype=AttributeName.OWNER;
		List<Eazy> user=this.eazyRooMpdfService.getUserByCity(city, utype);
		ByteArrayInputStream pdf = GeneratePdfUtil.ownerReport(user,utype);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "inline; filename=ownereport.pdf");
		return ResponseEntity
				.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_PDF)
				.body(new InputStreamResource(pdf));
		}
	}
	
	@GetMapping(value = URLConstants.PDF_TENANT, produces = MediaType.APPLICATION_PDF_VALUE)
	public ResponseEntity<InputStreamResource> tenentReport(@PathVariable("city") String city) {
		String utype=AttributeName.TENANT;
		List<Eazy> user=this.eazyRooMpdfService.getUserByCity(city, utype);
		ByteArrayInputStream pdf = GeneratePdfUtil.tenantReport(user,utype);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "inline; filename=ownereport.pdf");
		return ResponseEntity
				.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_PDF)
				.body(new InputStreamResource(pdf));
	}
	
}
