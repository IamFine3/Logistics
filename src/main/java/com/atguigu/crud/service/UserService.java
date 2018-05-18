package com.atguigu.crud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.User;

@Service
public interface UserService {

	List<User> getAll();

	void saveUser(User user);

	int register(User user);
	
	int login(User user);
	
	void removeRecord(Integer id);
	
	void updateRecord(User record);
}
