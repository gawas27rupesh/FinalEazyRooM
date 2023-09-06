package com.eazyroom.web.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazyroom.web.entities.City;
import com.eazyroom.web.entities.State;
import com.eazyroom.web.repository.CityRepo;
import com.eazyroom.web.repository.StateRepo;
import com.eazyroom.web.service.CityService;

@Service
public class CityImpl implements CityService {
	
	@Autowired
	private CityRepo cityRepo;
	
	@Autowired
	private StateRepo stateRepo;
	

	@Override
	public List<City> getAllCity() {
		List<City> findAll = this.cityRepo.findAll();
		return findAll;
	}

	@Override
	public State getAllCity(Integer sid) {
		State allCity=this.stateRepo.getById(sid);
		return allCity;
	}

}
