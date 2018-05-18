package com.atguigu.crud.dao;

import com.atguigu.crud.bean.EnterPrise;

public interface EnterPriseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EnterPrise record);

    int insertSelective(EnterPrise record);

    EnterPrise selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EnterPrise record);

    int updateByPrimaryKey(EnterPrise record);
}