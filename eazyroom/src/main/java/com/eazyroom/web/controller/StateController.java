package com.eazyroom.web.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eazyroom.web.entities.State;
import com.eazyroom.web.service.StateService;

@Controller
public class StateController {
	
	@Autowired
	private StateService stateService;

		@GetMapping("/allState")
		@ResponseBody
		public List<State> getState() {
			List<State> allState = this.stateService.getAllState();
			return allState;
		}

		@GetMapping("/AllCityOfState/{sid}")
		@ResponseBody
		public Optional<State> getAllCityBySid(@PathVariable("sid") Integer sid) {
			Optional<State> allState = this.stateService.getAllStateCities(sid);
			return allState;
		}
}
