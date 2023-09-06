package com.eazyroom.web.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazyroom.web.entities.Eazy;
import com.eazyroom.web.repository.EazyRooMRepo;
import com.eazyroom.web.service.EazyRoomService;


@Service
public class EazyRooServiceImpl implements EazyRoomService{
	
	@Autowired
	private EazyRooMRepo eazyRooMRepo;

	@Override
	public List<Eazy> getUserByCity(String city,String utype) {
		List<Eazy> listOfOwner=eazyRooMRepo.getUserbyCty(city, utype);
		return listOfOwner;
	}

	

	@Override
	public  void CreateAcnt(Eazy eazy) {
		this.eazyRooMRepo.save(eazy);
	}

	@Override
	public void deleteEazy(int eazyId) {
		this.eazyRooMRepo.deleteById(eazyId);	
	}

	@Override
	public Eazy getEazy(int eazyId) {
		Eazy byId = this.eazyRooMRepo.getById(eazyId);
		return byId;
	}

	@Override
	public List<Eazy> seeyourpost(String contno, String pswd, String utype) {
		List<Eazy> getpost=this.eazyRooMRepo.getYourPost(contno,pswd,utype);
		return getpost;
	}

	

	@Override
	public List<Eazy> getAll() {
		List<Eazy> findAll = this.eazyRooMRepo.findAll();
		return findAll;
	}


	@Override
	public Eazy getAccountByMobileAndPassword(String mobile, String pswd) {
		Eazy accountByMobileAndPassword = this.eazyRooMRepo.getAccountByMobileAndPassword(mobile,pswd);
		return accountByMobileAndPassword;
	}



	@Override
	public List<Eazy> getUserByCity(String city) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<Eazy> getUserByCitygender(String city, String utype, String gender) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<Eazy> getUsercount(long contno) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Eazy showpro(long cd) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<Eazy> showAllUser() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
