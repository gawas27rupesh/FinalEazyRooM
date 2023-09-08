package com.eazyroom.web.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazyroom.web.dto.StateDto;
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
	public List<StateDto> getAllStateName() {
		List<StateDto> statedto=new ArrayList<StateDto>();
		List<State> findAll = this.stateRepo.findAll();
		for(State state:findAll) {
			StateDto stateDto = modelMapper.map(state, StateDto.class);
			statedto.add(stateDto);
		}
		return statedto;
	}

	@Override
	public List<State> getAllState() {
		List<State> findAll = this.stateRepo.findAll();
		return findAll;
	}	

}
