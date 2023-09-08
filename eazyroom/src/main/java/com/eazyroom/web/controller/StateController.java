package com.eazyroom.web.controller;

import java.util.List;

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
		public State getAllCityBySid(@PathVariable("sid") Integer sid) {
			List<State> allState = this.stateService.getAllState();
			State s = null;
			for (State state : allState) {
				if (state.getSid() == sid) {
					s = state;
				}
			}
			return s;
		}
}
