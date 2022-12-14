package com.hs.istudy.controller;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.hs.istudy.common.AppConfig;
import com.hs.istudy.common.enums.ApplicationConfigCode;
import com.hs.istudy.dto.SnsUser;
import com.hs.istudy.dto.User;
import com.hs.istudy.oauth.NaverLoginApi;
import com.hs.istudy.service.SnsUserService;
import com.hs.istudy.service.UserService;

@Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserService service;
	private SnsUserService snsService;
	private AppConfig appConfig; // @Autowired
	private final String clientSecret;
	private final String clientId;
	
	@Autowired
	public UserController(UserService service, SnsUserService snsService, AppConfig appConfig) {
		this.snsService = snsService;
		this.service = service;
		this.appConfig = appConfig;
		this.clientId = this.appConfig.getString(ApplicationConfigCode.NAVER_CLIENT_ID);
		this.clientSecret = this.appConfig.getString(ApplicationConfigCode.NAVER_CLIENT_SECRET);
	}
	
	@RequestMapping("/user")
	public void addUser(User user) {
		if(user == null) {
			logger.info("user info is empty");
			service.addUser(user);
		}else {
			service.addUser(user);
		}
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
	
	public boolean checkUser(@RequestParam("id") String id) {
		boolean isUser = service.checkUser(id);
		return isUser;
	}
	
	public boolean getUserById(@RequestParam("id") String id) {
		boolean isUser = service.checkUser(id);
		return isUser;
	}
	
	@RequestMapping("/")
	public String main(HttpSession session, Model model) {
		//????????????????????? ????????? ?????? ??????
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);
		logger.info("state check: {}", state);
		
		//https://nid.nave???r.com/oauth2.0/authorize?response_type=code&client_id="+clientId+"&redirect_uri=http://localhost:8080/naver/login/callback&state="+state
		//scribejava-core 6.2.0 ????????? ?????? ??????
		//https://www.javadoc.io/doc/com.github.scribejava/scribejava-core/latest/com/github/scribejava/core/builder/ServiceBuilder.html
		
		//Oauth20Service??? ???????????? ????????? ????????? url??????
		OAuth20Service oauthService = new ServiceBuilder(clientId)
										.responseType("code")
										.callback("http://localhost:8080/naver/login/callback")
										.state(state)
										.build(NaverLoginApi.instance());
		
		//????????? url??? model??? ?????? ??????
		model.addAttribute("naverUrl", oauthService.getAuthorizationUrl());
		
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
	@RequestMapping("/naver/login")
	public String naverLogin(@RequestParam("id") String id,
							@RequestParam("name") String name,
							@RequestParam("profile_image") String profileImage,
							@RequestParam("email") String email,
							@RequestParam("mobile") String mobile,
							HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		boolean isUser = checkUser(id);
		//?????? ????????? ???????????? ??????????????? ????????????.
		if(isUser == true) {
			User user = service.getUserById(id);
			//??????????????? ??????????????? ????????????.
			if(user != null) {
				logger.info("Login Success: {}", user.getUserId());
				session.setAttribute("User", user);
				return "redirect:/";
			}else {
				logger.info("Login fail: {}", user.getUserId());
				return "redirect:/";
			}
		//???????????? ???????????? ?????? ?????? ????????? ????????????.
		}else {
			//??????????????? decoding?????? ????????????.
			User user = new User(id, URLDecoder.decode(name, StandardCharsets.UTF_8), mobile);
			addUser(user);
			SnsUser snsUser = new SnsUser(id, "1", profileImage, email);
			snsService.addUser(snsUser);
			User loginUser = service.getUserById(id);
			session.setAttribute("User", loginUser);
			return "redirect:/";
		}
		
		}
	
}
