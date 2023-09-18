package com.eazyroom.web.entities;


import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
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
	
	

	private String utype;
	
	
	private String name;
	
	
	private String contno;
	
	
	private String rent;
	
	
	private String state;
	
	
	private String city;
	
	
	private String pswd;
	
	
	private String gender;
	
	private String postdate;
	
	private String uid;
	
	private String address;
	
	@CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
	private Date date;

	@Override
	public String toString() {
		return "Eazy [id=" + id + ", utype=" + utype + ", name=" + name + ", contno=" + contno + ", rent=" + rent
				+ ", State=" + state + ", city=" + city + ", pswd=" + pswd + ", gender=" + gender + ", address="
				+ address + ", date=" + date + "]";
	}
	
	
	
}
