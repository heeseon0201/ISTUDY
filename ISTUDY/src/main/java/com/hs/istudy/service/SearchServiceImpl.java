package com.hs.istudy.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hs.istudy.dao.SearchDAO;
import com.hs.istudy.dto.Search;

@Service
public class SearchServiceImpl implements SearchService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	private SearchDAO dao;
	
	@Autowired
	public SearchServiceImpl(SearchDAO dao){
		this.dao = dao;
	}
	
	@Override
	public List<Search> getSearch(String searchWord) {
		List <Search> searchList = dao.getSearch(searchWord);
		if(searchList == null) {
			logger.error("SearchServiceImpl getSearch searchList is empty!");
		}
		return searchList;
	}

}
