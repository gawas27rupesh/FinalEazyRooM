package com.eazyroom.web.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class Statedto {
	private Integer sid;
	private String sname;
	@Override
	public String toString() {
		return "Statedto [sid=" + sid + ", sname=" + sname + "]";
	}
	
	
}
