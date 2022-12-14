package com.hs.istudy.dto;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class User {

	private String userId; //사용자id
	private String userName; //성함
	private String userPhone; //전화번호
	private String userPw; //비밀번호
	private String userJob; //직업
	private Date userStart; //가입일자
	private char userType; //관리자유형
	private char userStatus; //상태
	
	//sns유저 생성을 위해 만든 생성자
	public User(String userId,String userName,String userPhone) {
		this.userId = userId;
		this.userName = userName;
		this.userPhone = userPhone;
	}
	
}
