package com.eazyroom.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eazyroom.web.entities.login;



public interface LoginRepo extends JpaRepository<login, Integer> {

}
