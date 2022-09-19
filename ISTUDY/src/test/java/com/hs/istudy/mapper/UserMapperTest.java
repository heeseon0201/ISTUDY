package com.hs.istudy.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hs.istudy.dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserMapperTest {

	@Autowired
	private UserMapper mapper;
	
	
	@Test
	public void testAddUser() {
		User user = new User();
		String id = "bbb";
		String pw = "bbb";
		user.setUserId(id);
		user.setUserPw(pw);
		user.setUserName("ABC");
		user.setUserInterest("IT");
		user.setUserJob("무직");
		user.setUserPhone("00000000000");
		mapper.addUser(user);
	}
	
	
}
