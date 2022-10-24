package com.hs.istudy.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.hs.istudy.common.AppConfig;
import com.hs.istudy.common.enums.ApplicationConfigCode;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

@Controller
@RequestMapping("/naver")
public class NaverController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private AppConfig appConfig; // @Autowired
	private final String clientSecret;
	private final String clientId;
	
	@Autowired
	public NaverController(AppConfig appConfig) {
		this.appConfig = appConfig;
		this.clientId = this.appConfig.getString(ApplicationConfigCode.NAVER_CLIENT_ID);
		this.clientSecret = this.appConfig.getString(ApplicationConfigCode.NAVER_CLIENT_SECRET);
	}
	
	@GetMapping("/login/callback")
	public String authNaver(@RequestParam("code") String code, @RequestParam("state") String state, HttpServletRequest request) {
		logger.info("code: {}", code);
		logger.info("state: {}", state);
		
		HttpSession session = request.getSession();
		session.setAttribute("naverLoginCode", code);
		
		return "redirect:/naver/token?code="+ code;
	}
	@GetMapping("/token")
	public void getNaverToken(@RequestParam("code") String code) {
		System.out.println("code 확인: "+code);
		String url = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id="+ clientId +"&client_secret="+clientSecret+"&code="+code;
		logger.info("client id 확인: {}, client secret 확인: {}", clientId, clientSecret);
		try {
		OkHttpClient httpClient = new OkHttpClient();
		
		Request request = new Request.Builder()
							.url(url)
							.build();
		Response response = httpClient.newCall(request).execute();
		String result = response.body().string();
		Gson gson = new Gson();
		JsonObject jsonObject = JsonParser.parseString(result).getAsJsonObject();
		
		//access토큰 출력
		System.out.println(jsonObject.get("access_token").getAsString());
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
}
