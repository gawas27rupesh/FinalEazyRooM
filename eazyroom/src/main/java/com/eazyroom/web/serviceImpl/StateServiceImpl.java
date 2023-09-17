package com.eazyroom.web.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazyroom.web.entities.State;
import com.eazyroom.web.repository.StateRepo;
import com.eazyroom.web.service.StateService;

@Service
public class StateServiceImpl implements StateService{

	@Autowired
	private StateRepo stateRepo;
	
	@Autowired
	private ModelMapper modelMapper;


	@Override
	public List<State> getAllState() {
		List<State> findAll = this.stateRepo.findAll();
		return findAll;
	}

	@Override
	public Optional<State> getAllStateCities(String sname) {
		Optional<State> byId = this.stateRepo.findBySname(sname);
		return byId;
	}	

}
