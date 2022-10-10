package com.hs.istudy.common.enums;

public enum ApplicationConfigCode {

	NAVER_CLIENT_ID("naver.client-id", null),
	NAVER_CLIENT_SECRET("naver.client-secret",null)
	;
	
	private String key;
	private String defaultValue;
	
	ApplicationConfigCode(String key, String defaultValue){
		this.key = key;
		this.defaultValue = defaultValue;
		
	}

	@Override
	public String toString() {
		return this.key;
	}
	
	public String getDefaultValue() {
		return this.defaultValue;
	}
}
