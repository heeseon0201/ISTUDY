package com.hs.istudy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hs.istudy.mapper.CourseMapper;

@Service
public class CourseServiceImpl implements CourseService{

	private CourseMapper mapper;
	
	@Autowired
	public CourseServiceImpl(CourseMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public void addCourse(String userId, int lectureNo) {
		mapper.addCourse(userId, lectureNo);
	}

}
