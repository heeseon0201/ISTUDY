package com.hs.istudy.service;

import java.util.List;

import com.hs.istudy.dto.Search;

public interface SearchService {
	
	public List<Search> getSearch(String searchWord);
	
}
