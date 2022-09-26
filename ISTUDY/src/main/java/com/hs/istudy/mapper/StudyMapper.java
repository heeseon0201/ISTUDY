package com.hs.istudy.mapper;


import java.util.List;

import com.hs.istudy.dto.Study;

public interface StudyMapper {

	public int addStudy(String userId, Study study);
	public List<Study> getStudyList(int page);
	public Study getStudy(int studyNo);
}
