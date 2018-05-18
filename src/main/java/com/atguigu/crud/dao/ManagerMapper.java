package com.atguigu.crud.dao;

import java.util.List;

import com.atguigu.crud.bean.Manager;

public interface ManagerMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
    
    Manager selectByName(String name);
    
    List<Manager> getAll();
}