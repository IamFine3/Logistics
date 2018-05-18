package com.atguigu.crud.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.CarMessage;
import com.atguigu.crud.dao.CarMessageMapper;
import com.atguigu.crud.service.ICarMessageService;

@Service
public class CarMessageServiceImpl implements ICarMessageService {

	@Autowired
	private CarMessageMapper carMessageDao;

	@Override
	public List<CarMessage> findAll() {
		List<CarMessage> carMessage = carMessageDao.findAll();

		return carMessage;
	}

	@Override
	public CarMessage findById(Integer id) {
		CarMessage record = carMessageDao.selectByPrimaryKey(id);
		return record;
	}

	@Override
	public void saveRecord(CarMessage record) {
		Date date = new Date();
		record.setIssuedate(date);
		carMessageDao.insert(record);
	}

	@Override
	public void removeRecord(Integer code) {
		carMessageDao.deleteByPrimaryKey(code);
	}

	@Override
	public void updateRecord(CarMessage record) {
		Date date = new Date();
		record.setIssuedate(date);
		carMessageDao.updateByPrimaryKey(record);
	}

}
