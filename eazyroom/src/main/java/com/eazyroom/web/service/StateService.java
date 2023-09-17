package com.eazyroom.web.service;

import java.util.List;
import java.util.Optional;

import com.eazyroom.web.entities.State;

public interface StateService {

	List<State> getAllState();

	Optional<State> getAllStateCities(String sname);

}
