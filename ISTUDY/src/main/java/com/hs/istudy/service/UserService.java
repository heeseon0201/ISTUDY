package com.hs.istudy.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hs.istudy.dto.User;
import com.hs.istudy.mapper.UserMapper;

public interface UserService {
	
	public void addUser(User user);

	public User getUser(User user);
}
