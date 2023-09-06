package com.eazyroom.web.service;

import java.util.List;

import com.eazyroom.web.entities.Eazy;

public interface EazyRooMpdfService {
	
	List<Eazy> getUserByCity(String city, String utype);	
	
}
