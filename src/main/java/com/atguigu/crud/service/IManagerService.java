package com.atguigu.crud.service;

import java.util.List;

import com.atguigu.crud.bean.Manager;

public interface IManagerService {
	
	List<Manager> getAll();
	
	int managerLogin(Manager manager);
	
	int managerInsert(Manager manager);
	
	void updateRecord(Manager record);
	
	void removeRecord(Integer id);
}
