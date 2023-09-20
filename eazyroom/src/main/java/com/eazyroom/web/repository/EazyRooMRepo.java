package com.eazyroom.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eazyroom.web.dto.EazyDto;
import com.eazyroom.web.entities.Eazy;



public interface EazyRooMRepo extends JpaRepository<Eazy, Integer> {

	List<Eazy> findByContnoAndPswdAndUtype(String contno, String pswd, String utype);

	List<Eazy> getByUtype(String utype);

	void save(EazyDto ez);


	List<Eazy> findByStateAndCityAndUtypeOrderByDateDesc(String state, String city, String utype);

	List<Eazy> getByUtypeOrderByDateDesc(String utype);
	
}
