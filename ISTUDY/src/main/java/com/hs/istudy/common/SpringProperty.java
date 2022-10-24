package com.hs.istudy.common;

import org.springframework.core.env.Environment;

public abstract class SpringProperty<E extends Enum<E>> {
	//
	protected Environment environment;
	
	protected SpringProperty(Environment environment) {
		this.environment = environment;
	}
	
	/**
	 * Property 값을 String으로 가져온다
	 * 
	 * @param key
	 * @return java.lang.String
	 */
	public String getString(final E key) {
		return environment.getProperty(key.toString());
	}
	
	/**
	 * Property 값을 String으로 가져온다</br>
	 * 키값에 데이터가 없다면 기본값으로 리턴
	 * 
	 * @param key
	 * @param defaultValue
	 * @return java.lang.String
	 */
	public String getStringOrDefault(final E key, final String defaultValue) {
		return environment.getProperty(key.toString(), defaultValue);
	}
}
