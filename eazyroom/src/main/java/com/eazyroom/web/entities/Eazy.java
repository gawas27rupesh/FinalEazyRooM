package com.eazyroom.web.entities;


import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Eazy
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	@NotEmpty
	private String utype;
	
	@NotEmpty
	private String name;
	
	@NotEmpty
	private String contno;
	
	@NotEmpty
	private String rent;
	
	@NotEmpty
	private String State;
	
	@NotEmpty
	private String city;
	
	@NotNull
	private String pswd;
	
	@NotEmpty
	private String gender;
	
	@NotEmpty
	private String address;
	
	@CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
}
