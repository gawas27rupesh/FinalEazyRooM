package com.eazyroom.web.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eazyroom.web.entities.State;

public interface StateRepo extends JpaRepository<State,Integer>{

	Optional<State> findBySname(String sname);

}
