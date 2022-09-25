package com.hs.istudy.controller;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hs.istudy.dto.Study;
import com.hs.istudy.service.StudyService;

@RestController
@RequestMapping("/api")
public class StudyController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private StudyService service;
	
	@Autowired
	public StudyController(StudyService service) {
		this.service = service;
	}
	
	@ResponseBody
	@GetMapping("/study")
	public List<Study> getStudyList() {
		List<Study> studyList = service.getStudyList();
		return studyList;
		
	}
}
