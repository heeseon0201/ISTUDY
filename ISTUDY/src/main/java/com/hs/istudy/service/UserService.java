package com.hs.istudy.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hs.istudy.dto.User;
import com.hs.istudy.mapper.UserMapper;

public class UserService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserMapper userMapper;
	
	public UserService(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	public void addUser(User user) {
		userMapper.addUser(user);
	}
	
	public User getUser(String id, String pw) {
		User user = userMapper.getUser(id, pw);
		return user;
	}
}
