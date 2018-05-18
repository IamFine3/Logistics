package com.atguigu.crud.service;

import java.util.List;

import com.atguigu.crud.bean.CarMessage;

public interface ICarMessageService {
	
	List<CarMessage> findAll();

	CarMessage findById(Integer id);
	
	void saveRecord(CarMessage record);
	
	void updateRecord(CarMessage record);
	
	void removeRecord(Integer code);
}
