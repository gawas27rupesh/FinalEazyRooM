package com.eazyroom.web.service;

import java.util.List;

import com.eazyroom.web.dto.Statedto;
import com.eazyroom.web.entities.City;
import com.eazyroom.web.entities.State;

public interface StateService {


	List<State> getAllState();


	List<Statedto> getAllStateName();




}
