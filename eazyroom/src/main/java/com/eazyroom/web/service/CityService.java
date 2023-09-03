package com.eazyroom.web.service;

import java.util.List;

import com.eazyroom.web.dto.CityDto;
import com.eazyroom.web.entities.City;
import com.eazyroom.web.entities.State;

public interface CityService {


	List<City> getAllCity();


	State getAllCity(Integer sid);

}
