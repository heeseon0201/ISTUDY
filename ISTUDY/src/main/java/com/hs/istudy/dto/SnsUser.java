package com.hs.istudy.dto;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class SnsUser {

	private String userId; //사용자id
	private String snsType; //sns타입
	private String snsProfile;
	private String snsEmail;
}
