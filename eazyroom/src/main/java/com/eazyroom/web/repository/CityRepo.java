package com.eazyroom.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.eazyroom.web.entities.City;

public interface CityRepo extends JpaRepository<City, Integer> {

	@Query(nativeQuery = true, value =  "SELECT * FROM city WHERE sid=:sid")	                         
	List<City> findAllById(Integer sid);
}
