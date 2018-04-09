package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.GetClassNameMapper;
import com.hzyc.registerSystem.services.GetClassNameService;
@Service
public class GetClassNameServiceImp implements GetClassNameService{
	
	@Autowired
	private GetClassNameMapper gcnm;
	
	@Override
	public List<String> getClassNameService(String userId) {
		List<String> cList =  null;
		try {
			cList = gcnm.getClassName(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
}
