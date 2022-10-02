package com.hs.istudy.dto;

import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseDataObject<T> {
	
	private ResponseDataHeaderObject header;
	
	private T body;
	
	public int getBodyCount() {
		if(this.body instanceof Map) {
			return 1;
		}else if(this.body instanceof List) {
			return ((List<?>) this.body).size();
		}else if(this.body instanceof Object) {
			return 1;
		}else {
			return -1;
		}
	}
}
