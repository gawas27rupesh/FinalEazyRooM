package com.eazyroom.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.eazyroom.web.entities.State;

public interface StateRepo extends JpaRepository<State,Integer>{

	@Query(nativeQuery = true, value =  "select * from city where sid=26;")	                         
	State getState(Integer sid);

}
