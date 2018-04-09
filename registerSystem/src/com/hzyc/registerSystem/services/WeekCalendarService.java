package com.hzyc.registerSystem.services;

import java.util.List;

import com.hzyc.registerSystem.po.Course;
import com.hzyc.registerSystem.po.RealSchedule;

public interface WeekCalendarService {
	public void updateWeekCalendar(Course c);
	public void updateWeekCalendarGroup(Course c);
	
	public List<Course> getWeekCalendar(String userId,String gradeId);
	public List<Course> getWeekCalendarGroup(String gradeId);
	
	public String getGradeName(String id);
	public String getGradeId(String name);
	
	public void deleteCal(String user_Id,String gradeId,String startTime,String endTime);
	public void deleteCalGroup(String gradeId, String startTime,String endTime);
	
	public void addCal(RealSchedule rs);
	
	public String getEndTime(String userId,String gradeId);
	public String getEndTimeGroup(String gradeId);
}
