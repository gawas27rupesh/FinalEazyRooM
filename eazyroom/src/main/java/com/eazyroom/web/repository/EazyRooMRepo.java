package com.eazyroom.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.eazyroom.web.entities.Eazy;



public interface EazyRooMRepo extends JpaRepository<Eazy, Integer> {

	@Query(nativeQuery = true, value =  "SELECT * FROM eazy WHERE city=:city AND utype=:utype")	                         
	List<Eazy> getUserbyCty(String city,String utype);
	

	@Query(nativeQuery = true, value =  "SELECT * FROM eazy WHERE contno=:contno AND pswd=:pswd AND utype=:utype")                         
	List<Eazy> getYourPost(long contno, int pswd, String utype);

	@Query(nativeQuery = true, value =  "SELECT * FROM eazy WHERE mobile=:mobile AND pswd=:pswd")                         
	Eazy getAccountByMobileAndPassword(String mobile, String pswd);
	
}
