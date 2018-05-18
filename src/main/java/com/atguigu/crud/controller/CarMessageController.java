package com.atguigu.crud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crud.bean.CarMessage;
import com.atguigu.crud.bean.Logistics;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.ICarMessageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class CarMessageController {
	
	@Autowired
	private ICarMessageService carMessageService;
	
	@RequestMapping("/carsMegs")
    @ResponseBody
    public Msg getAllMessage(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<CarMessage> list = carMessageService.findAll();
		PageInfo<CarMessage> page = new PageInfo<CarMessage>(list, 5);
		//此时无需放在请求域中
		return Msg.success().add("pageInfo", page);
    }
	
	@RequestMapping("/carMeg/id")
	@ResponseBody
	public Msg getMessageById(HttpServletRequest request, @RequestParam Integer id) {
		
		CarMessage record = carMessageService.findById(id);
		return Msg.success().add("pageInfo", record);
	}
	
	// 新增记录
	@RequestMapping(value="/carMeg",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveRecord(HttpServletRequest request,CarMessage record) {
		carMessageService.saveRecord(record);
		return Msg.success().add("carMeg", record);
	}
	
	@RequestMapping("/remove/carMeg")
	@ResponseBody
	public Msg removeUser(@RequestParam Integer id) {
		carMessageService.removeRecord(id);
		return Msg.success();
	}
	
	@RequestMapping(value="/update/carMeg",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateRecord(CarMessage record) {
		carMessageService.updateRecord(record);
		return Msg.success();
	}
	

}
