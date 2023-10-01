package com.eazyroom.web.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
public class login {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int lid;
	
	@NotEmpty
	private String name;
	
	@NotEmpty
	private String mobile;
	
	@NotEmpty
	private String email;
	
	@NotEmpty
	private String pswd;
	
	@NotNull
	private String cpswd;

	@NotEmpty
	private String utype;
}
