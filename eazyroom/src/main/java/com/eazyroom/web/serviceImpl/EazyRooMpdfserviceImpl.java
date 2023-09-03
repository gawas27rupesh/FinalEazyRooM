package com.eazyroom.web.serviceImpl;



import java.io.ByteArrayInputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eazyroom.web.service.EazyRooMpdfService;


@Service
public class EazyRooMpdfserviceImpl implements EazyRooMpdfService{
	
	private Logger logger=LoggerFactory.getLogger(EazyRooMpdfService.class);

	@Override
	public ByteArrayInputStream createPdf() {
		
		return null;
	}

}
