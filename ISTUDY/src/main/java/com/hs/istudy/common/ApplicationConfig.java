package com.hs.istudy.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.hs.istudy.common.enums.ApplicationConfigCode;



@Configuration
@PropertySource("classpath:application.properties")
public class ApplicationConfig extends AbstractSpringProperty<ApplicationConfigCode> {
	//
	@Autowired
	public ApplicationConfig(Environment environment) {
		super(environment);
	}
	
	/**
	 * Property 값을 String으로 가져온다</br>
	 * 키값에 데이터가 없다면 Enum에 있는 기본값으로 리턴
	 * 
	 * @param key
	 * @param defaultValue
	 * @return java.lang.String
	 */
	public String getStringOrDefault(final ApplicationConfigCode code) {
		return super.getStringOrDefault(code, code.getDefaultValue());
	}
}
