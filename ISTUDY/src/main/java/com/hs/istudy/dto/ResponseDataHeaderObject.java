package com.hs.istudy.dto;

public class ResponseDataHeaderObject {

	private int resultCode; //응답코드
	private String resultMessage; //응답메시지
	private boolean isSuccessful; //요청 성공 여부
	private int count; //response body의 영역의 개수
}
