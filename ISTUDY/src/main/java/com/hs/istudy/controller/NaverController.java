package com.hs.istudy.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

@Controller
@RequestMapping("/naver")
public class NaverController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	/*@GetMapping("/login")
	public void getAuthorization() {
		String state = generateRandomString();
	}
	*/
	
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
		String url = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=PvXDJCYLeoyt5YcqpWBV&client_secret=Jix6v6N_ji&code="+code;
		
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
