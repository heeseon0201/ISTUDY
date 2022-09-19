package com.hs.istudy.dto;



import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class User {

	private int userNo; //사용자no
	private String userId; //사용자id
	private String userName; //성함
	private String userPhone; //전화번호
	private String userPw; //비밀번호
	private String userInterest; //관심사
	private String userJob; //직업
	private Date userStart; //가입일자
	
}
