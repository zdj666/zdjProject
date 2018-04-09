package com.hzyc.registerSystem.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.TimeConflictMapper;
import com.hzyc.registerSystem.services.TimeConflictService;

@Service
public class TimeConflictServiceImp implements TimeConflictService{
	
	@Autowired
	private TimeConflictMapper tcm;
	
	@Override
	public int getTimeConflict(String gradeId, String startTime,
			String endTime, String date,String classRoom) {
		int res = -1;
		try {
			res = tcm.getTimeConflict(gradeId, startTime, endTime, date,classRoom);
			
			System.out.println("数据返回信息"+res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
