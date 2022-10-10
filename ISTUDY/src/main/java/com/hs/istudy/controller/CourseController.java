package com.hs.istudy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hs.istudy.service.CourseService;


@Controller
public class CourseController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private CourseService service;
	
	@Autowired
	public CourseController(CourseService service) {
		this.service = service;
	}
	@GetMapping("/course")
	public void addCourse(@RequestParam("userId") String userId, @RequestParam("lectureNo") int lectureNo) {
		logger.info("userId: {}, lecture:{} ", userId , lectureNo);
		service.addCourse(userId, lectureNo);
	}
}
