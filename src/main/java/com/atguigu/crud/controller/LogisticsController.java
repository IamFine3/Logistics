package com.atguigu.crud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crud.bean.Logistics;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.bean.User;
import com.atguigu.crud.service.ILogisticsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class LogisticsController {
	
	@Autowired
	private ILogisticsService logisticsService;
	

	@RequestMapping("/logistics")
	@ResponseBody
	public Msg getLogisticsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		// 第几页
		List<Logistics> logistics = logisticsService.getAll();
		PageInfo<Logistics> page = new PageInfo<Logistics>(logistics, 5);
		//此时无需放在请求域中
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping(value="/logistic",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveRecord(HttpServletRequest request,Logistics logistic) {
		logisticsService.saveRecord(logistic);
		return Msg.success().add("logistic", logistic);
	}
	
	@RequestMapping("/remove/logistic")
	@ResponseBody
	public Msg removeRecord(@RequestParam Integer id) {
		logisticsService.removeRecord(id);
		return Msg.success();
	}
	
	@RequestMapping(value="/update/logistic",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateRecord(Logistics logistic) {
		logisticsService.updateRecord(logistic);
		return Msg.success();
	}
	

}
