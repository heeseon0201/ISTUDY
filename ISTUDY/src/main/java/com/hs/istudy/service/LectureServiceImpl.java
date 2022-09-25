package com.hs.istudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hs.istudy.dto.Lecture;
import com.hs.istudy.mapper.LectureMapper;

@Service
public class LectureServiceImpl implements LectureService{

	private LectureMapper mapper;
	@Autowired
	public LectureServiceImpl(LectureMapper mapper){
		this.mapper = mapper;
	}
	@Override
	public List<Lecture> getLectureList() {
		List<Lecture> lectureList = mapper.getLectureList();
		return lectureList;
	}

	
}