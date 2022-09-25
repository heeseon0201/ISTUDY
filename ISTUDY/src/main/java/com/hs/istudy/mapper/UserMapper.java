package com.hs.istudy.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hs.istudy.dto.User;

@Mapper
public interface UserMapper {

	public int addUser(User user);
	public User getUser(User user);
	public String getUserName(String id);
}
