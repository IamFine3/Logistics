package com.atguigu.crud.service;

import java.util.List;

import com.atguigu.crud.bean.GoodsMeg;

public interface IGoodsMegService {
	List<GoodsMeg> getAll();
	
	void removeGoodsMeg(Integer id);
	
	int saveE(GoodsMeg record);
	
	GoodsMeg findById(Integer id);
	
	void updateRecord(GoodsMeg record);
}
