package com.hs.istudy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hs.istudy.dto.User;
import com.hs.istudy.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	
	private UserMapper mapper;
	
	@Autowired
	public UserServiceImpl(UserMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public void addUser(User user) {
		mapper.addUser(user);
		
	}

	@Override
	public User getUser(User user) {
		User userLogin = mapper.getUser(user);
		return userLogin;
	}

}
