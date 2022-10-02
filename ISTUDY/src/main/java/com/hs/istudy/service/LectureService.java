package com.hs.istudy.service;

import java.util.List;


import com.hs.istudy.dto.Lecture;

public interface LectureService {

	public List<Lecture> getLectureList(int page, String searchWord);
	public int getLectureCount(String searchWord);
}
