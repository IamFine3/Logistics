package com.atguigu.crud.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.shared.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crud.bean.Manager;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.bean.User;
import com.atguigu.crud.service.IManagerService;
import com.atguigu.crud.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 处理用户CRUD请求
 * 
 * @author lenovo
 *
 */
@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private IManagerService managerService;

	// 会员保存
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveUser(HttpServletRequest request, User user) {
		int i = 0;
		i = userService.register(user);
		return Msg.success().add("managerUser", i);
	}
	
	// 会员更新
	@RequestMapping(value = "/update/user", method = RequestMethod.POST)
	@ResponseBody
	public Msg updateUser(HttpServletRequest request, User user) {
		int i = 0;
		// 修改
		userService.updateRecord(user);
		i = user.getId();
		return Msg.success().add("managerUser", i);
	}

	// 会员注册
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public Msg register(HttpServletRequest request, User user) {
		int i = userService.register(user);
		return Msg.success().add("register", i);
	}

	// 会员登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session, User user) {
		int i = userService.login(user);
		String toPage = request.getContextPath() + "/jsp/pageHome.jsp";
		if (i > 0) {
			session.setAttribute("name", user.getName());
			session.setAttribute("login", "success");
		}
		
		try {
			response.sendRedirect(toPage);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "pageHome";
	}
	
	// 获取所有员工
	@RequestMapping("/managers")
	@ResponseBody
	public Msg getManagers(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		PageHelper.startPage(pn, 5);
		List<Manager> users = managerService.getAll();
		PageInfo<Manager> page = new PageInfo<Manager>(users, 5);
		// 此时无需放在请求域中
		return Msg.success().add("pageInfo", page);
	}

	// 员工保存
	@RequestMapping(value = "/manager", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveManager(HttpServletRequest request, Manager record) {
		int i = managerService.managerInsert(record);
		return Msg.success().add("manager", i);
	}
	
	// 员工保存
	@RequestMapping(value = "/update/manager", method = RequestMethod.POST)
	@ResponseBody
	public Msg updateManager(HttpServletRequest request, Manager record) {
		 managerService.updateRecord(record);
		return Msg.success();
	}

	// 员工登录
	@RequestMapping(value = "/manager/login", method = RequestMethod.POST)
	@ResponseBody
	public Msg managerLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Manager record) {
		int i = managerService.managerLogin(record);
		boolean flag = true;
		if (i > 0) {
			session.setAttribute("name", record.getName());
			session.setAttribute("login", "success");
		} else {
			flag = false;
		}
		
		return Msg.success().add("managerLogin", flag);
	}

	/**
	 * 查询用户数据（分页查询）
	 * 
	 * @return
	 */
	// 要让@responseBody正常工作，需要导入jackson包，负责将对象转为json字符创
	@RequestMapping("/users")
	@ResponseBody
	public Msg getUsersWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		PageHelper.startPage(pn, 5);
		List<User> users = userService.getAll();
		PageInfo<User> page = new PageInfo<User>(users, 5);
		// 此时无需放在请求域中
		return Msg.success().add("pageInfo", page);
	}

	@RequestMapping("/remove/User")
	@ResponseBody
	public Msg removeUser(@RequestParam Integer id) {
		userService.removeRecord(id);
		return Msg.success();
	}
	
	@RequestMapping("/remove/Manager")
	@ResponseBody
	public Msg removeManager(@RequestParam Integer id) {
		managerService.removeRecord(id);
		return Msg.success();
	}

}
