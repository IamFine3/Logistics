package com.atguigu.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.Logistics;
import com.atguigu.crud.dao.LogisticsMapper;
import com.atguigu.crud.service.ILogisticsService;

@Service
public class LogisticsServiceImpl implements ILogisticsService{

	@Autowired
	private LogisticsMapper logisticsMapper;
	
	@Override
	public List<Logistics> getLogistics(Integer start, Integer size) {
		List<Logistics> list = logisticsMapper.selectForPage(start, size);
		return list;
	}

	// 获取物流动态,分页处理
	@Override
	public List<Logistics> getAll() {
		List<Logistics> list = logisticsMapper.selectAll();
		return list;
	}

	@Override
	public void removeRecord(Integer id) {
		logisticsMapper.deleteByPrimaryKey(id);
	}

	// 保存记录
	@Override
	public void saveRecord(Logistics record) {
		logisticsMapper.insert(record);
	}

	@Override
	public void updateRecord(Logistics record) {
		logisticsMapper.updateByPrimaryKey(record);
	}

}
