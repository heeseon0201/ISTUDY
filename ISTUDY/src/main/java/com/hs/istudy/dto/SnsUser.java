package com.hs.istudy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SnsUser {

	private String userId; //사용자id
	private String snsType; //sns타입
	private String snsProfile; //sns프로필
	private String snsEmail; //sns email
}
