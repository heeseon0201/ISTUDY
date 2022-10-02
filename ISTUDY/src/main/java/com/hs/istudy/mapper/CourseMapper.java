package com.hs.istudy.mapper;

import org.apache.ibatis.annotations.Param;

public interface CourseMapper {
	
	public void addCourse(@Param("userId") String userId,@Param("lectureNo") int lectureNo);
}
