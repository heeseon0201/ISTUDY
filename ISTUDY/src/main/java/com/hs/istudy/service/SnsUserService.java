package com.hs.istudy.service;

import com.google.gson.JsonObject;
import com.hs.istudy.dto.SnsUser;


public interface SnsUserService {

	public void addUser(SnsUser user);
	public JsonObject getNaverProfile(String accessToken);
}
