package com.hs.istudy.controller;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@PostMapping("/study")
	public List<Study> getStudyList(@RequestParam("page") int page,
									@RequestParam("searchWord") String searchWord) {
		if(searchWord == null) {
			List<Study> studyList = service.getStudyList(page - 1);
			return studyList;
		}else {
			List<Study> studyList = service.getStudyList(page - 1);
			return studyList;
		}
		
		
	}
}
