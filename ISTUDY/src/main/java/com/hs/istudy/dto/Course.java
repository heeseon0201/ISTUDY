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
public class Course {

	private int courseNo;
	private int userNo;
	private int lectureNo;
	private Date startDatetime;
	private String courseCompletion;
	private Date endDatetime;
}
