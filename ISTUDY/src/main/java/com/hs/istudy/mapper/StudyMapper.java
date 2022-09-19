package com.hs.istudy.mapper;


import java.util.List;

import com.hs.istudy.dto.Study;

public interface StudyMapper {

	public int addStudy(int userNo, Study study);
	public List<Study> getStudyList(int userNo, Study study);
	public Study getStudy(int studyNo);
}
