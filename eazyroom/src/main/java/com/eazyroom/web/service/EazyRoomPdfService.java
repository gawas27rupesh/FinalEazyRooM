package com.eazyroom.web.service;

import java.util.List;

import com.eazyroom.web.entities.Eazy;

public interface EazyRoomPdfService {
	
	List<Eazy> getUserByCity(String city, String utype);	
	
}
