package com.eazyroom.web.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazyroom.web.entities.login;
import com.eazyroom.web.repository.LoginRepo;
import com.eazyroom.web.service.LoginService;


@Service
public class LoginImpl implements LoginService {

	@Autowired
	private LoginRepo loginRepository;
	
	@Override
	public void registerAct(login login) {
		this.loginRepository.save(login);
	}

	@Override
	public List<login> getAll() {
		List<login> findAll = this.loginRepository.findAll();
		return findAll;
	}

}
