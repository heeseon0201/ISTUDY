package com.hs.istudy.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hs.istudy.dto.User;
import com.hs.istudy.service.UserService;

@Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserService service;
	
	@Autowired
	public UserController(UserService service) {
		this.service = service;
	}
	
	@PostMapping("/user")
	public void addUser(User user) {
		service.addUser(user);
	}
	
	@GetMapping("/sing.do")
	public String getUser(@ModelAttribute User user, HttpServletRequest request) {
		User loginUser = service.getUser(user);
		HttpSession session = request.getSession();
		if(loginUser != null) {
			logger.info("Login Success: {}", loginUser.getUserId());
			session.setAttribute("User", loginUser);
			return "main";
		}else {
			logger.info("Login fail: {}", loginUser.getUserId());
			return "main";
		}
	}
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("User");
		logger.info("logout");
		return "redirect:/";
	}
	@RequestMapping("/study.do")
	public String study() {
		return "study";
	}
	@RequestMapping("/lecture.do")
	public String lecture() {
		return "lecture";
	}
	@RequestMapping("/search.do")
	public String search() {
		return "searchpage";
	}
}
