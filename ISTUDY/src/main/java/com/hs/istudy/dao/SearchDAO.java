package com.hs.istudy.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.hs.istudy.dto.Search;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

@Repository
public class SearchDAO {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<Search> getSearch(String searchWord) {
		try {
			
			String url = "https://openapi.naver.com/v1/search/webkr.json?query=" + searchWord;
			
			OkHttpClient httpClient = new OkHttpClient();
			Request request = new Request.Builder()
								.addHeader("X-Naver-Client-Id", "PvXDJCYLeoyt5YcqpWBV")
								.addHeader("X-Naver-Client-Secret", "Jix6v6N_ji")
								.url(url)
								.build();
			
			Response response = httpClient.newCall(request).execute();
			String result = response.body().string();
			//System.out.println(result);
			Gson gson = new Gson();
			JsonObject jsonObject = JsonParser.parseString(result).getAsJsonObject();
			JsonArray jsonArray = jsonObject.get("items").getAsJsonArray();
			
			List<Search> searchList = gson.fromJson(jsonArray, new TypeToken<List<Search>>(){}.getType());
			System.out.println(searchList.get(0).getTitle());
			return searchList;
		} catch (Exception e) {
			logger.error("getSearch IOException : "+ e);
		}
		return null;
	}

	
}

	
	
