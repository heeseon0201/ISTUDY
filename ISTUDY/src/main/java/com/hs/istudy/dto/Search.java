package com.hs.istudy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 * 
 * 네이버 웹검색 결과를 저장할 DTO
 * 
 */
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Search {

	private String title;
	private String link;
	private String description;
}
