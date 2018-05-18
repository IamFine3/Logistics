package com.atguigu.crud.dao;

import com.atguigu.crud.bean.Placard;

public interface PlacardMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Placard record);

    int insertSelective(Placard record);

    Placard selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Placard record);

    int updateByPrimaryKey(Placard record);
}