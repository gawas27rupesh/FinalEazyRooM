package com.eazyroom.web.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazyroom.web.dto.EazyDto;
import com.eazyroom.web.entities.Eazy;
import com.eazyroom.web.repository.EazyRooMRepo;
import com.eazyroom.web.service.EazyRoomService;


@Service
public class EazyRooServiceImpl implements EazyRoomService{
	
	@Autowired
	private EazyRooMRepo eazyRooMRepo;
	
	@Autowired
	ModelMapper modelMapper;

	@Override
	public List<Eazy> getUserByCity(String state,String city,String utype) {
		List<Eazy> listOfOwner=eazyRooMRepo.findByStateAndCityAndUtypeOrderByDateDesc(state,city, utype);
		return listOfOwner;
	}

	

	@Override
	public  void createAcnt(Eazy eazy) {
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
	public EazyDto getEazyDto(int eazyId) {
		Eazy byId = this.eazyRooMRepo.getById(eazyId);
		EazyDto eazyDto=modelMapper.map(byId, EazyDto.class);
		return eazyDto;
	}

	@Override
	public List<Eazy> seeyourpost(String contno, String pswd, String utype) {
		List<Eazy> list=this.eazyRooMRepo.findByContnoAndPswdAndUtype(contno,pswd,utype);
		return list;
	}

	

	@Override
	public List<Eazy> getAll() {
		List<Eazy> findAll = this.eazyRooMRepo.findAll();
		return findAll;
	}


	@Override
	public Eazy getAccountByMobileOrPassword(String mobile, String pswd) {
		//Eazy accountByMobileAndPassword = this.eazyRooMRepo.findByMobileAndPswd(mobile,pswd);
		//return accountByMobileAndPassword;
		return null;
	}



	@Override
	public List<Eazy> getUserByCity(String city) {
		return null;
	}



	@Override
	public List<Eazy> getUserByCitygender(String city, String utype, String gender) {
		return null;
	}



	@Override
	public List<Eazy> getUsercount(long contno) {
		return null;
	}



	@Override
	public Eazy showpro(long cd) {
		return null;
	}



	@Override
	public List<Eazy> showAllUser() {
		return null;
	}



	@Override
	public List<Eazy> getByUtype(String utype) {
		List<Eazy> byUtype = this.eazyRooMRepo.getByUtypeOrderByDateDesc(utype);
		return byUtype;
	}



	@Override
	public void save(Eazy ez) {
		this.eazyRooMRepo.save(ez);
	}



	@Override
	public void updateUser(EazyDto eazyDto, Integer id) {
		System.out.println(eazyDto);
		Optional<Eazy> eazy=this.eazyRooMRepo.findById(id);
		Eazy dtoToEntity=modelMapper.map(eazyDto, Eazy.class);
		System.out.println("date "+eazy.get().getDate());
		dtoToEntity.setDate(eazy.get().getDate());
		this.eazyRooMRepo.save(dtoToEntity);
	}
	
}
