package com.atguigu.crud.dao;

import java.util.List;

import com.atguigu.crud.bean.GoodsMeg;

public interface GoodsMegMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsMeg record);

    int insertSelective(GoodsMeg record);

    GoodsMeg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsMeg record);

    int updateByPrimaryKey(GoodsMeg record);
    
    List<GoodsMeg> selectAll();
}