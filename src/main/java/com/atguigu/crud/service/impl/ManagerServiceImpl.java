package com.atguigu.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.Manager;
import com.atguigu.crud.dao.ManagerMapper;
import com.atguigu.crud.service.IManagerService;

@Service
public class ManagerServiceImpl implements IManagerService {

	@Autowired
	private ManagerMapper managerMapper;
	
	@Override
	public int managerLogin(Manager manager) {
		Manager exit = managerMapper.selectByName(manager.getName());
		int i = 0;
		if (exit != null && manager.getPassword().equals(exit.getPassword())) {
			i = 200;
		}
		return i;
	}

	@Override
	public int managerInsert(Manager manager) {
		Manager exit = managerMapper.selectByName(manager.getName());
		int i = 0;
		if (exit == null) {
			managerMapper.insert(manager);
			i = 200;
		}
		
		return i;
	}

	@Override
	public void updateRecord(Manager record) {
		managerMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Manager> getAll() {
		List<Manager> list = managerMapper.getAll();
		return list;
	}

	@Override
	public void removeRecord(Integer id) {
		managerMapper.deleteByPrimaryKey(id);
	}

}
