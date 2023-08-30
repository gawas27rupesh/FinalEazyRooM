package com.eazyroom.web.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class CityDto {
	private Integer cid;
	private String cname;
	@Override
	public String toString() {
		return "CityDto [cid=" + cid + ", cname=" + cname + "]";
	}
	
	
}
