package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.WeekCalendarMapper;
import com.hzyc.registerSystem.po.Course;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.services.WeekCalendarService;

@Service
public class WeekCalendarServiceImp implements WeekCalendarService{
	
	@Autowired
	private WeekCalendarMapper wcm;
	
	@Override
	public void updateWeekCalendar(Course c) {
		try {
			wcm.updateWeekCalendar(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void updateWeekCalendarGroup(Course c) {
		try {
			wcm.updateWeekCalendarGroup(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public List<Course> getWeekCalendar(String userId, String gradeId) {
		List<Course> cList = null;
		try {
			cList=wcm.getWeekCalendar(userId, gradeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	@Override
	public List<Course> getWeekCalendarGroup(String gradeId) {
		List<Course> cList = null;
		try {
			cList=wcm.getWeekCalendarGroup(gradeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	@Override
	public String getGradeName(String id) {
		String name = "";
		try {
			name = wcm.getGradeName(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public String getGradeId(String name) {
		String id= "";
		try {
			id = wcm.getGradeId(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void deleteCal(String user_Id, String gradeId, String startTime,
			String endTime) {
		try {
			wcm.deleteCal(user_Id, gradeId, startTime, endTime);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void deleteCalGroup(String gradeId, String startTime,String endTime) {
		try {
			wcm.deleteCalGroup(gradeId, startTime, endTime);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void addCal(RealSchedule rs) {
		try {
			wcm.addCal(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public String getEndTime(String userId, String gradeId) {
		String endTime="";
		try {
			endTime=wcm.getEndTime(userId, gradeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return endTime;
	}
	
	@Override
	public String getEndTimeGroup(String gradeId) {
		String endTime="";
		try {
			endTime=wcm.getEndTimeGroup(gradeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return endTime;
	}
	
	
}
