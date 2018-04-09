package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.po.Dictionary;
import com.hzyc.registerSystem.services.GetDictionaryService;
import com.hzyc.registerSystem.mapper.getDictionaryMapper;

@Service
public class GetDictionaryImpl implements GetDictionaryService {
		
	@Autowired
	private getDictionaryMapper getDictionaryMapper;
	

	@Override
	public List<Dictionary> getDictionary(String sex) {
		
		return 	getDictionaryMapper.getDictionary(sex);
	}
	@Override
	public List<String> getPerType(){
		
		return getDictionaryMapper.getPerType();
	}
	
	
	
}
