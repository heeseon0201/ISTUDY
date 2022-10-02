package com.hs.istudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hs.istudy.dto.Lecture;

public interface LectureMapper {

	public List<Lecture> getLectureList(@Param("page") int page, @Param("searchWord") String searchWord);
	public int getLectureCount(String searchWord);
}
