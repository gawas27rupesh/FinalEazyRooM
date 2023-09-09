package com.eazyroom.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eazyroom.web.entities.City;

public interface CityRepo extends JpaRepository<City, Integer> {


}
