package com.atguigu.crud.dao;

import java.util.List;

import com.atguigu.crud.bean.CarMessage;

public interface CarMessageMapper {
    int deleteByPrimaryKey(Integer code);

    int insert(CarMessage record);

    int insertSelective(CarMessage record);

    CarMessage selectByPrimaryKey(Integer code);
    
    List<CarMessage> findAll();

    int updateByPrimaryKeySelective(CarMessage record);

    int updateByPrimaryKey(CarMessage record);
}