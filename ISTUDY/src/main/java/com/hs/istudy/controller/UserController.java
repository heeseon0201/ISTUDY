package com.hs.istudy.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hs.istudy.dto.User;
import com.hs.istudy.mapper.UserMapper;
import com.hs.istudy.service.UserService;


@Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserService service;
	
	@Autowired
	public UserController(UserService service){
		this.service = service;
	}
	
	@PostMapping("/user")
	public void addUser(User user) {
		service.addUser(user);
		
	}
	@GetMapping("/user")
	public void getUser(String id, String pw) {
		User loginUser = service.getUser(id, pw);
		if(loginUser != null) {
			logger.info("{} 회원가입 성공");
		}
	}
	

}
