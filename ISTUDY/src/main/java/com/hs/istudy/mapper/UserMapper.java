package com.hs.istudy.mapper;

import com.hs.istudy.dto.User;

public interface UserMapper {

	public int addUser(User user);
	public User getUser(String id, String pw);
	public String getUserName(String id);
}
