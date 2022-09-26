package com.hs.istudy.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hs.istudy.dto.Lecture;
import com.hs.istudy.service.LectureService;


@RequestMapping("/api")
@RestController
public class LectureController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private LectureService service;
	
	@Autowired
	public LectureController(LectureService service) {
		this.service = service;
	}
	
	@PostMapping("/lecture")
	public List<Lecture> getLectureList(@RequestParam("lecturePage") int page,
										@RequestParam("searchWord") String searchWord) {
		logger.info("확인:"+ searchWord);
			List<Lecture> lectureList = service.getLectureList(page-1, searchWord);
			logger.info("lecture 출력 Success!");
			return lectureList;
		}
		
	}

