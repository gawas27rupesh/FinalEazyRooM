package com.eazyroom.web.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazyroom.web.entities.Eazy;
import com.eazyroom.web.repository.PdfRepo;
import com.eazyroom.web.service.EazyRooMpdfService;

@Service
public class EazyRooMpdfserviceImpl implements EazyRooMpdfService {

	@Autowired
	private PdfRepo pdfRepo;
	
	@Override
	public List<Eazy> getUserByCity(String city, String utype) {
		List<Eazy> listOfOwner = pdfRepo.getUserbyCty(city, utype);
		return listOfOwner;
	}

}
