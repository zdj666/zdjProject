package com.hzyc.registerSystem.services;

import java.util.List;

import com.hzyc.registerSystem.po.RealSchedule;

public interface UpdateCalendarIfoService {
	
	public List<RealSchedule> getCalIfo(String user_id, String grade_id);
	
	
	public void deleteCalIfo(String user_id,String grade_id);
	
	public void insertCalIfo(RealSchedule rs);
}
