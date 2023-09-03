package com.eazyroom.web.serviceImpl;

import java.util.List;

import org.modelmapper.ModelMapper;
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
	
	@Autowired
	private ModelMapper modelMapper;


	@Override
	public List<City> getAllCity() {
		List<City> findAll = this.cityRepo.findAll();
		return findAll;
	}

	//List<Item> items = factory.getIemRepository().findAllById(itemsList);
	@Override
	public State getAllCity(Integer sid) {
		//List<CityDto> cityDtos=new ArrayList<CityDto>();
		State allCity=this.stateRepo.getById(sid);
		System.out.println(allCity);
//		for(City city:allCity) {
//			CityDto stateDto = modelMapper.map(city, CityDto.class);
//			cityDtos.add(stateDto);
//		}
		return allCity;
	}

}
