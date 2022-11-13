package com.hs.istudy.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hs.istudy.dto.User;

@Mapper
public interface UserMapper {

	public int addUser(User user);
	public User getUser(User user);
	public String getUserName(String id);
	public boolean checkUser(String id);
	public User getUserById(String id);
}
