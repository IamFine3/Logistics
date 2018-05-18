package com.atguigu.crud.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.User;
import com.atguigu.crud.dao.UserMapper;
import com.atguigu.crud.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> getAll() {
		return userMapper.getAll();
	}
	
	//员工添加
	@Override
	public void saveUser(User user) {
		Date createdTime = new Date();
		user.setCreatedtime(createdTime);
		userMapper.insertSelective(user);
	}
	
	
	//会员注册
	@Override
	public int register(User user) {
		// 查看当前用户名是否已经注册  已注册--不能再次注册, 不存在-注册成功
		User exit = userMapper.selectByName(user.getName());
		int i = 0;
		if (exit == null) {
			Date createdTime = new Date();
			user.setCreatedtime(createdTime);
			i = 200;
			userMapper.insertSelective(user);
		} 
		return i;
	}

	// 会员登录
	@Override
	public int login(User user) {
		User exit = userMapper.selectByName(user.getName());
		int i = 0;
		if (exit != null && user.getPassword().equals(exit.getPassword())) {
			i = 200;
		}
		return i;
	}
	
	// 删除用户
	@Override
	public void removeRecord(Integer id) {
		userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateRecord(User record) {
		Date createdTime = new Date();
		record.setCreatedtime(createdTime);
		userMapper.updateByPrimaryKey(record);
	}
}
