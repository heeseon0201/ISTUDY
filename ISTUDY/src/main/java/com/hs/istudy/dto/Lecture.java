package com.hs.istudy.dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Lecture {

	private int lectureNo;
	private String lectureCategory;
	private String lectureName;
	private String lectureTeach;
	private String lectureCount;
	private int lecturePrice;
	private BigDecimal lecturePoint;
	private String lectureReview;
	private String lectureUrl;
}
