package com.atguigu.crud.dao;

import com.atguigu.crud.bean.KnowLedge;

public interface KnowLedgeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(KnowLedge record);

    int insertSelective(KnowLedge record);

    KnowLedge selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(KnowLedge record);

    int updateByPrimaryKey(KnowLedge record);
}