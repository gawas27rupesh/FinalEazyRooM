package com.eazyroom.web.service;

import java.util.List;

import com.eazyroom.web.entities.Eazy;



public interface EazyRoomService {
	List<Eazy> getUserByCity(String city);

	List<Eazy> getUserByCitygender(String city, String utype, String gender);

	List<Eazy> getUsercount(long contno);

	void CreateAcnt(Eazy eazy);

	void deleteEazy(int eazyId);

	Eazy getEazy(int eazyId);

	List<Eazy> seeyourpost(String string, String string2, String utype);

	Eazy showpro(long cd);

	List<Eazy> showAllUser();

	List<Eazy> getAll();

	List<Eazy> getUserByCity(String city, String utype);

	Eazy getAccountByMobileAndPassword(String mobile, String pswd);

}
