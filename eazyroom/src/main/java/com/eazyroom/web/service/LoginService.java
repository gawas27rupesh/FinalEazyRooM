package com.eazyroom.web.service;

import java.util.List;

import com.eazyroom.web.entities.login;



public interface LoginService {

	void registerAct(login login);

	List<login> getAll();
	
}
