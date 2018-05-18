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
import com.atguigu.crud.bean.GoodsMeg;
import com.atguigu.crud.bean.Logistics;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.bean.User;
import com.atguigu.crud.service.IGoodsMegService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class GoodsMegController {
	@Autowired
	private IGoodsMegService goodsMegService;
	
	@RequestMapping("/goodsMegs")
	@ResponseBody
	public Msg getLogisticsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<GoodsMeg> list = goodsMegService.getAll();
		PageInfo<GoodsMeg> page = new PageInfo<GoodsMeg>(list, 5);
		//此时无需放在请求域中
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping("/remove/goodsMeg")
	@ResponseBody
	public Msg removeGoodsMeg(@RequestParam(value = "id", defaultValue = "1") Integer id) {
		goodsMegService.removeGoodsMeg(id);
		return Msg.success();
	}
	
	// 根据id查看货物具体信息
	@RequestMapping("/goodMeg/id")
	@ResponseBody
	public Msg getMessageById(HttpServletRequest request, @RequestParam Integer id) {
		GoodsMeg record = goodsMegService.findById(id);
		return Msg.success().add("pageInfo", record);
	}
	
	// 货物信息保存
	@RequestMapping(value="/goodsMeg",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveRecord(HttpServletRequest request,GoodsMeg goodsMeg) {
		goodsMegService.saveE(goodsMeg);
		return Msg.success();
	}
	
	
	@RequestMapping(value="/update/goodsMeg",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateRecord(GoodsMeg goodsMeg) {
		goodsMegService.updateRecord(goodsMeg);
		return Msg.success();
	}
	
}
