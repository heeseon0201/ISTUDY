package com.hs.istudy.service;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.hs.istudy.dto.SnsUser;
import com.hs.istudy.mapper.SnsUserMapper;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

@Service
public class SnsUserServiceImpl implements SnsUserService{
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private SnsUserMapper mapper;
	
	@Autowired
	public SnsUserServiceImpl(SnsUserMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public void addUser(SnsUser user) {
		mapper.addUser(user);
	}

	
	@Override
	public JsonObject getNaverProfile(String accessToken) {
		try {
			String url = "https://openapi.naver.com/v1/nid/me";
			
			OkHttpClient httpClient = new OkHttpClient();
			
			Request request = new Request.Builder()
								.url(url)
								.addHeader("Authorization", "Bearer ".concat(accessToken))
								.build();
			Response response = httpClient.newCall(request).execute();
			
			//응답결과값 출력
			/*{"resultcode":"00",
				"message":"success",
				"response":
					{"id":"Ua650iH17hH3e05BDAsV10puuI-XEprWHSGYyjJQnyw",
					"nickname":"\ud76c\uc120",
					"profile_image":"https:\/\/phinf.pstatic.net\/contact\/20221015_86\/1665838349213Dkuo1_JPEG\/image.jpg",
					"age":"20-29",
					"gender":"F",
					"email":"heeseon5524@naver.com",
					"mobile":"010-0000-0000",
					"mobile_e164":"+820000000000",
					"name":"\ubc15\ud76c\uc120",
					"birthday":"02-01",
					"birthyear":"1995"
					}
			}*/

			String result = response.body().string();
			Gson gson = new Gson();
			JsonObject jsonObject = JsonParser.parseString(result).getAsJsonObject();
			System.out.println(result);
			return jsonObject.get("response").getAsJsonObject();
		
		
		} catch (IOException e) {
			logger.error("getNaverProfile error!, :{}",e);
		}
		return null;
		
	}


	

	
}
