package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.UpdateCalendarIfoMapper;
import com.hzyc.registerSystem.po.RealSchedule;
//import com.mysql.jdbc.Constants;
@Service
public class UpdateCalendarIfoServiceImp implements UpdateCalendarIfoMapper{
	
	@Autowired
	private UpdateCalendarIfoMapper ucim;
	
	@Override
	public List<RealSchedule> getCalIfo(String user_id, String grade_id) {
		//System.out.println("###############"+user_id);
		return ucim.getCalIfo(user_id, grade_id);
	}
	
	@Override
	public void deleteCalIfo(String user_id,String grade_id){
		try {
			ucim.deleteCalIfo(user_id, grade_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void insertCalIfo(RealSchedule rs){
		try {
			ucim.insertCalIfo(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
