package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hzyc.registerSystem.po.Course;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.impl.TimeConflictServiceImp;
import com.hzyc.registerSystem.services.impl.WeekCalendarServiceImp;
import com.hzyc.registerSystem.tools.AutoCalendar;
import com.hzyc.registerSystem.tools.SystemLog;

/**
 * @author lvgang
 * @description 周设置课程表
 **/

@Controller
public class WeekCalendarGroup {
	

	@Autowired
	private TimeConflictServiceImp tcsi;
	
	@Autowired
	private WeekCalendarServiceImp wcsi;
	
	@RequestMapping("/getWeekCalendarGroup.do")
	@SystemLog(module="设置上班时间",methods="查询设置的上班时间")
	public void getWeekCalendar(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			//"classroomIfo="+classroomIfo+"&timeIfo"+timeIfo+"&classId="+classId
			
			//想要得到的是项目组这三个字
			String classId = request.getParameter("classId");
			
			
			classId = wcsi.getGradeId(classId);
			
			
			List<Course> cList = wcsi.getWeekCalendarGroup(classId);
			
			for(int i=0;i<cList.size();i++)
				System.out.println("获取的课程信息"+cList.get(i).getTime());
			
			PrintWriter out = response.getWriter();
			
			Gson  gson = new Gson();
			
			String gsonString  = gson.toJson(cList); 
			
			out.print(gsonString);
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updateWeekCalendarGroup.do")
	@SystemLog(module="设置上班时间",methods="更新设置的上班时间")
	public void updateWeekCalendar(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			//"classroomIfo="+classroomIfo+"&timeIfo"+timeIfo+"&classId="+classId
			
			String classRoomIfo = request.getParameter("classroomIfo")+"-"+0;
			String timeIfo = request.getParameter("timeIfo")+"#"+0;
			String classId = request.getParameter("classId");
			String userId=request.getSession().getAttribute("role").toString();
			
			int gradeId = Integer.parseInt(wcsi.getGradeId(classId)) ;
			
			
			String[] classRoom = classRoomIfo.split("-");
			String[] time = timeIfo.split("#");
			System.out.println(classRoom.length+"&&&&&"+time.length);
			for(int i=0;i<7;i++){
				System.out.println(classRoom[i+1]+"&&&"+time[i+1]+"@@@"+isWeek(i));
			}
			
			gradeId = Integer.parseInt( wcsi.getGradeId(classId));
			
			List<Course > cList = new ArrayList<Course>();
			
			for(int i=0;i<7;i++){
				Course c = new Course();
				c.setClassroom(classRoom[i+1]);
				c.setTime(time[i+1]);
				c.setGradeId(gradeId);
				c.setWeek(isWeek(i));
				System.out.println("更新到数据的信息"+c.getClassroom()+"^^^^"+c.getWeek());
				
				cList.add(c);
				wcsi.updateWeekCalendarGroup(c);
			}
			
			String endTime = wcsi.getEndTimeGroup(gradeId+"");
			
			System.out.println("接班时间"+endTime);
			
			System.out.println("执行动态");
			AutoCalendar ac = new AutoCalendar();
			System.out.println(endTime+"----------------------------");
			System.out.println(cList+"----------------------------");
			List<RealSchedule> rsList= ac.setIfo(endTime, cList);
			
			Calendar c  = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); 
			int month = c.get(Calendar.MONTH); 
			int date = c.get(Calendar.DATE); 
			int week = c.get(Calendar.DAY_OF_WEEK)-1;
			System.out.println(year+"#"+month+"#"+date+"#"+week);
			
			String startTime = year+"-"+month+"-"+date;
			System.out.println(userId+"-"+gradeId+"-"+startTime+"-"+endTime);
			wcsi.deleteCalGroup(""+gradeId, startTime, endTime);
			
			String bool = "0";
			
			System.out.println(rsList.size());
			
			int index=0;
			
			for(int i=0;i<rsList.size();i++){
				rsList.get(i).setUserId("1");
				String t = rsList.get(i).getTime();
				String st = t.split("-")[0];
				String et = t.split("-")[1];
				System.out.println(""+rsList.get(i).getUserId()+"-"+ st+"-"+ et+"-"+rsList.get(i).getDate()+"-"+rsList.get(i).getClassroom());
				int rs=tcsi.getTimeConflict("1", st, et, rsList.get(i).getDate(),rsList.get(i).getClassroom());
				if(rs==0){
					wcsi.addCal(rsList.get(i));
				}else{
					index++;
				}
				bool="1";
			}
			bool= bool+"#"+index;
			PrintWriter out = response.getWriter();
	 		out.print(bool);
	 		out.flush();
	 		out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String isWeek(int i){
		if(i==0){
			return "星期日";
		}
		if(i==1){
			return "星期一";
		}
		if(i==2){
			return "星期二";
		}
		if(i==3){
			return "星期三";
		}
		if(i==4){
			return "星期四";
		}
		if(i==5){
			return "星期五";
		}
		if(i==6){
			return "星期六";
		}
		return "";
	}
}
