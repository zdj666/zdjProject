package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.Dictionary;
import com.hzyc.registerSystem.po.Users;

public interface getDictionaryMapper {
	
	
	List<Dictionary>  getDictionary(String sex);

	
	List<String> getPerType();
}
