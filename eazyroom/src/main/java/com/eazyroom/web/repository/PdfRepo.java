package com.eazyroom.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eazyroom.web.entities.Eazy;

public interface PdfRepo extends JpaRepository<Eazy, Integer> {

	List<Eazy> getByCityAndUtype(String city, String utype);
	
}
