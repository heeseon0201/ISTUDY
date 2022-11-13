package com.hs.istudy.service;

import com.hs.istudy.dto.User;

public interface UserService {
	
	public void addUser(User user);

	public User getUser(User user);
	
	public boolean checkUser(String id);
	
	public User getUserById(String id);
}
