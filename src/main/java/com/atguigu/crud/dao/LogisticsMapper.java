package com.atguigu.crud.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.atguigu.crud.bean.Logistics;

public interface LogisticsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Logistics record);

    int insertSelective(Logistics record);

    Logistics selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Logistics record);

    int updateByPrimaryKey(Logistics record);
    
    List<Logistics> selectForPage(@Param("start") Integer start, @Param("size") Integer size);
    
    List<Logistics> selectAll();
}