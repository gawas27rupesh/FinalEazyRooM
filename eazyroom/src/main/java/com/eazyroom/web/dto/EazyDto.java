package com.eazyroom.web.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class EazyDto {
	
	private int eid;
	private String utype;
	private String name;
	private String contno;
	private String rent;
	private String state;
	private String city;
	private String pswd;
	private String gender;
	private String address;
	private Date date;
	@Override
	public String toString() {
		return "EazyDto [id=" + eid + ", utype=" + utype + ", name=" + name + ", contno=" + contno + ", rent=" + rent
				+ ", state=" + state + ", city=" + city + ", pswd=" + pswd + ", gender=" + gender + ", address="
				+ address + ", date=" + date + "]";
	}
	
	
}
