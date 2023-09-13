package com.eazyroom.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eazyroom.web.entities.Eazy;



public interface EazyRooMRepo extends JpaRepository<Eazy, Integer> {

	List<Eazy> findByCityAndUtype(String city, String utype);

	List<Eazy> findByContnoAndPswdAndUtype(String contno, String pswd, String utype);

	List<Eazy> getByUtype(String utype);
	
}
