package com.atguigu.crud.test;


import java.util.List;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.atguigu.crud.bean.User;
import com.github.pagehelper.PageInfo;

/**
 * 测试Spring测试模块提供的测试请求功能，测试crud请求的正确性
 * Spring4测试时需要servlet3.0支持
 * @author lfy
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
public class MvcTest {
	
	// 传入Springmvc的ioc
	@Autowired
	WebApplicationContext context;
	
	// 虚拟Mvc请求，获取到处理结果
	MockMvc mockMvc;

	@Before
	public void initMokcMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testPage() throws Exception{
		//模拟请求，拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/users").param("pn", "1")).andReturn();
		//请求成功后，请求域中会有pageInfo,我们可以取出pageInfo进行验证
		MockHttpServletRequest requset = result.getRequest();
		PageInfo pi = (PageInfo)requset.getAttribute("pageInfo");
		System.out.println("当前页码"+pi.getPageNum());
		System.out.println("总页码" + pi.getPages());
		System.out.println("总记录数" + pi.getTotal());
		System.out.print("页面需要连续显示的页码:");
		int[] nums = pi.getNavigatepageNums();
		for(int i :nums) {
			System.out.print(" "+i);
		}
		System.out.println();
		//获取用户
		List<User> list= pi.getList();
		for(User user : list) {
//			System.out.println("Id:"+user.getUserId()+" Name"+user.getName());
		}
	}
}
