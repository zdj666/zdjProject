package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.Course;
import com.hzyc.registerSystem.po.RealSchedule;

public interface WeekCalendarMapper {
	void updateWeekCalendar(Course c);
	void updateWeekCalendarGroup(Course c);
	
	List<Course> getWeekCalendar(String userId,String gradeId);
	List<Course> getWeekCalendarGroup(String gradeId);
	
	String getGradeName(String id);
	String getGradeId(String name);
	
	void deleteCal(String user_Id,String gradeId,String startTime,String endTime);
	void deleteCalGroup(String gradeId,String startTime,String endTime);
	void addCal(RealSchedule rs);
	
	String getEndTime(String user_Id,String gradeId);
	//ÏîÄ¿×é
	String getEndTimeGroup(String gradeId);
}
