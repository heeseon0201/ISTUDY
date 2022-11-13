package com.hs.istudy.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.hs.istudy.common.AppConfig;
import com.hs.istudy.common.enums.ApplicationConfigCode;
import com.hs.istudy.service.SnsUserService;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

@Controller
@RequestMapping("/naver")
public class NaverController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private SnsUserService service;
	private AppConfig appConfig; // @Autowired
	private final String clientSecret;
	private final String clientId;
	
	@Autowired
	public NaverController(SnsUserService service, AppConfig appConfig) {
		this.service = service;
		this.appConfig = appConfig;
		this.clientId = this.appConfig.getString(ApplicationConfigCode.NAVER_CLIENT_ID);
		this.clientSecret = this.appConfig.getString(ApplicationConfigCode.NAVER_CLIENT_SECRET);
	}
	
	@GetMapping("/login/callback")
	public String authNaver(@RequestParam("code") String code, @RequestParam("state") String state, HttpServletRequest request) {
		logger.info("authNaver code: {}", code);
		logger.info("authNaver state: {}", state);
		
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
	public ModelAndView  getNaverProfile(@RequestParam("accessToken") String accessToken, RedirectAttributes redirectAttributes) {
		JsonObject jsonObject = service.getNaverProfile(accessToken);
		
		//JsonObject를 한꺼번에 redirect하려 했지만 시간상 어려움 발생 우선 각자 값을 쿼리스트링으로 보낸 후 나중에 리팩토링 필요
		//이름은 전송할 때 깨지는 현상이 일어나서 URL encoding 진행
		String name = URLEncoder.encode(jsonObject.get("name").getAsString(), StandardCharsets.UTF_8);
		redirectAttributes.addAttribute("id", jsonObject.get("id").getAsString());
		redirectAttributes.addAttribute("name", name);
		redirectAttributes.addAttribute("profile_image", jsonObject.get("profile_image").getAsString());
		redirectAttributes.addAttribute("email", jsonObject.get("email").getAsString());
		redirectAttributes.addAttribute("mobile", jsonObject.get("mobile").getAsString());

		return new ModelAndView("redirect:/naver/login");
		
	}
}
