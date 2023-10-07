package com.eazyroom.web.service;

import java.util.List;

import com.eazyroom.web.dto.EazyDto;
import com.eazyroom.web.entities.Eazy;



public interface EazyRoomService {

	void createAcnt(Eazy eazy);

	void deleteEazy(int eazyId);

	EazyDto getEazyDto(int eazyId);
	
	Eazy getEazy(int eazyId);

	List<Eazy> seeyourpost(String string, String string2, String utype);

	List<Eazy> getAll();

	void save(Eazy ez);

	void updateUser(EazyDto eazyDto, Integer eid);

	List<Eazy> getUserByCity(String state, String city, String utype);

	List<Eazy> getByUtypeTenant(String string);

	List<Eazy> getByUtypeOwner(String string);

}
