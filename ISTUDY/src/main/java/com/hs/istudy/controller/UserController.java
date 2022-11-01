package com.hs.istudy.controller;


import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hs.istudy.common.AppConfig;
import com.hs.istudy.common.enums.ApplicationConfigCode;
import com.hs.istudy.dto.User;
import com.hs.istudy.service.UserService;

@Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserService service;
	
	private AppConfig appConfig; // @Autowired
	private final String clientSecret;
	private final String clientId;
	
	@Autowired
	public UserController(UserService service, AppConfig appConfig) {
		this.service = service;
		this.appConfig = appConfig;
		this.clientId = this.appConfig.getString(ApplicationConfigCode.NAVER_CLIENT_ID);
		this.clientSecret = this.appConfig.getString(ApplicationConfigCode.NAVER_CLIENT_SECRET);
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
	public String main(HttpSession session, Model model) {
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);
		logger.info("state check: {}", state);
		String naverAuthUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+clientId+"&redirect_uri=http://localhost:8080/naver/login/callback&state="+state;
		
		model.addAttribute("naverUrl", naverAuthUrl);
		
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
