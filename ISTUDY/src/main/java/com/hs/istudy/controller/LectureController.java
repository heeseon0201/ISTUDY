package com.hs.istudy.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hs.istudy.dto.Lecture;
import com.hs.istudy.service.LectureService;


@Controller
public class LectureController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private LectureService service;
	
	@Autowired
	public LectureController(LectureService service) {
		this.service = service;
	}
	
	@RequestMapping("/lecture.do")
	public String getLectureList(HttpSession session) {
		List<Lecture> lectureList = service.getLectureList();
		session.setAttribute("LectureList", lectureList);
		return "lecture";
	}
}
