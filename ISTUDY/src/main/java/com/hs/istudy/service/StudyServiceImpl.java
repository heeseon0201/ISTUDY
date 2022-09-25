package com.hs.istudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hs.istudy.dto.Study;
import com.hs.istudy.mapper.StudyMapper;

@Service
public class StudyServiceImpl implements StudyService{

	private StudyMapper mapper;
	
	@Autowired
	public StudyServiceImpl(StudyMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<Study> getStudyList() {
		List<Study> studyList = mapper.getStudyList();
		return studyList;
	}

}
