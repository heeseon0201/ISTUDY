package com.hs.istudy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hs.istudy.dto.Search;
import com.hs.istudy.service.SearchService;

@RequestMapping("/api")
@RestController
public class APIController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private SearchService service;
	
	@Autowired
	public APIController(SearchService service) {
		this.service = service;
	}
	
	@GetMapping("/search")
	public List<Search> getSearch(@RequestParam("searchWord") String searchWord){
		
		try {
			logger.info("searchWord check: {}", searchWord);
			searchWord = URLEncoder.encode(searchWord, "UTF-8");
			logger.info("searchWord url encoding check: {}", searchWord);
			List<Search> searchList = service.getSearch(searchWord);
			if(searchList == null) {
				logger.error("APIController getSearch searchList null!");
			}
			return searchList;
			
		} catch (UnsupportedEncodingException e) {
			logger.error("APIController getSearch error: {}", e);
			return null;
		}
		
	}
	
}
