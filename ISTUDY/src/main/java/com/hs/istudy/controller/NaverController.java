package com.hs.istudy.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
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
		
		return "redirect:/naver/token?code="+ code+"&state="+state;
	}
	@GetMapping("/token")
	public String getNaverToken(HttpSession session, @RequestParam("code") String code, @RequestParam("state") String state) {
		logger.info("getNaverToken state check: {}", state);
		
		String sessionState = (String)session.getAttribute("state");
		logger.info("getNaverToken sessionState check: {}", sessionState);
		
		//세션에 있는 state와 쿼리스트링으로 가져온 state값 비교
		if(!StringUtils.pathEquals(sessionState, state)) {
			logger.error("getNaverToken state is not match!");
		}else {
			System.out.println("code 확인: "+code);
			String url = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id="+ clientId +"&client_secret="+clientSecret+"&code="+code+"&state="+state;
			logger.info("client id 확인: {}, client secret 확인: {}", clientId, clientSecret);
			try {
			OkHttpClient httpClient = new OkHttpClient();
			
			Request request = new Request.Builder()
								.url(url)
								.build();
			Response response = httpClient.newCall(request).execute();
			String result = response.body().string();
		/*	응답 예시
		 * {
			    "access_token":"AAAAQosjWDJieBiQZc3to9YQp6HDLvrmyKC+6+iZ3gq7qrkqf50ljZC+Lgoqrg",
			    "refresh_token":"c8ceMEJisO4Se7uGisHoX0f5JEii7JnipglQipkOn5Zp3tyP7dHQoP0zNKHUq2gY",
			    "token_type":"bearer",
			    "expires_in":"3600"
			}
		*/
			Gson gson = new Gson();
			JsonObject jsonObject = JsonParser.parseString(result).getAsJsonObject();
			
			//access토큰 출력
			String accessToken = jsonObject.get("access_token").getAsString();
			return "redirect:/naver/profile?accessToken="+accessToken;
		}catch (IOException e) {
			logger.error("getNaverToken error: {}", e);
			return null;
		}
		}
		return null;
		
}
	@GetMapping("/profile")
	public void getNaverProfile(HttpSession session, @RequestParam("accessToken") String accessToken) {
		try {
		String url = "https://openapi.naver.com/v1/nid/me";
		
		OkHttpClient httpClient = new OkHttpClient();
		
		Request request = new Request.Builder()
							.url(url)
							.addHeader("Authorization", "Bearer ".concat(accessToken))
							.build();
		Response response = httpClient.newCall(request).execute();
		
		//응답결과값 출력
		String result = response.body().string();
		Gson gson = new Gson();
		JsonObject jsonObject = JsonParser.parseString(result).getAsJsonObject();
		System.out.println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
