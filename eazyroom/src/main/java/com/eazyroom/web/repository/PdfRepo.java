package com.eazyroom.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.eazyroom.web.entities.Eazy;

public interface PdfRepo extends JpaRepository<Eazy, Integer> {

	@Query(nativeQuery = true, value =  "SELECT * FROM eazy WHERE city=:city AND utype=:utype")	                         
	List<Eazy> getUserbyCty(String city,String utype);
	
}
