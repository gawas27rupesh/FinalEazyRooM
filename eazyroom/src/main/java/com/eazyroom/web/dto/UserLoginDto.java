package com.eazyroom.web.dto;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class UserLoginDto implements Serializable  {

	private static final long serialVersionUID = 5441835380220287414L;

	public static final List<String> ROLENAMEVALICATION = Arrays.asList("EazyRooM Admin","Owner","Tenant");

	public static final String OWNER = "Owner";
	public static final String TENANT = "Tenant";	
	
	private String mobile;	
	private String pswd;	
	private String utype;
	private String name;
}
