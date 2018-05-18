package com.atguigu.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.GoodsMeg;
import com.atguigu.crud.dao.GoodsMegMapper;
import com.atguigu.crud.service.IGoodsMegService;

@Service
public class GoodsMegServiceImpl implements IGoodsMegService {

	@Autowired
	private GoodsMegMapper goodsMegMapper;
	
	@Override
	public List<GoodsMeg> getAll() {
		List<GoodsMeg> list = goodsMegMapper.selectAll();
		return list;
	}

	@Override
	public void removeGoodsMeg(Integer id) {
		goodsMegMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int saveE(GoodsMeg e) {
		return goodsMegMapper.insert(e);
	}

	@Override
	public GoodsMeg findById(Integer id) {
		GoodsMeg record = goodsMegMapper.selectByPrimaryKey(id);
		return record;
	}

	@Override
	public void updateRecord(GoodsMeg record) {
		goodsMegMapper.updateByPrimaryKey(record);		
	}

}
