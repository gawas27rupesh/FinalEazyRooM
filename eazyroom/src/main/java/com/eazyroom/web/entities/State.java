package com.eazyroom.web.entities;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class State {
	@Id
	private Integer sid;
	private String sname;
	
	@OneToMany(mappedBy = "state", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	private List<City> city=new ArrayList<>();

}
