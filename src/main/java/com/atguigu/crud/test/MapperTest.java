package com.atguigu.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.atguigu.crud.bean.User;
import com.atguigu.crud.dao.UserMapper;

/**
 * 测试dao层的工作
 * 
 * @author zd Spring项目就可以使用Spring的单元测试，可自动注入我们需要的组件 
 *         1.导入SpringTestm模块
 *         2.@ContextConfiguration指定Spring配置文件的位置
 *         3.@RunWith(SpringJUnit4ClassRunner.class)
 *         4.直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	
	@Autowired
	UserMapper userMapper;

	
	@Autowired
	SqlSession sqlSession;

	@Test
	public void testCRUD() {
		// 测试rolemapper :插入职能
//		roleMapper.insertSelective(new Role(1, "开发"));
//		roleMapper.insertSelective(new Role(2, "测试"));
//		System.out.println(roleMapper.toString());

		// 插入批量用户
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		for(int i=1 ; i < 1001 ;i ++) {
			String uid = UUID.randomUUID().toString().substring(0, 5)+i;
//			mapper.insertSelective(new User(i, uid, "123456", uid, "M", uid+"@qq.com", 28, 1233, "T", "T"));	
		}
		System.out.println("批量完成！");
		
	}
}
