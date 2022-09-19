package com.hs.istudy.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hs.istudy.dto.Study;
import com.hs.istudy.mapper.StudyMapper;
import com.hs.istudy.mapper.UserMapper;

public class StudyService {
private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private StudyMapper studyMapper;
	
	public StudyService(StudyMapper studyMapper) {
		this.studyMapper = studyMapper;
	}
	public void addStudy(int UserNo, Study study) {
		studyMapper.addStudy(UserNo, study);
	}
}
