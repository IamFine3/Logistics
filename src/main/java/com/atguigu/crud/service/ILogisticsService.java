package com.atguigu.crud.service;

import java.util.List;

import com.atguigu.crud.bean.Logistics;

public interface ILogisticsService {

	List<Logistics> getLogistics(Integer start, Integer size);
	
	List<Logistics> getAll();
	
	void removeRecord(Integer id);
	
	void saveRecord(Logistics record);
	
	void updateRecord(Logistics record);
}
