package com.hs.istudy.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Study {

	private int studyNo;
	private String userId;
	private String studyName;
	private Date studyStart;
	private Date studyEnd;
	private String studySubject;
	private String studyPlace;

}
