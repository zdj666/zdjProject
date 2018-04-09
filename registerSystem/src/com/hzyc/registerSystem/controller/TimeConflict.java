package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hzyc.registerSystem.services.impl.TimeConflictServiceImp;
import com.hzyc.registerSystem.services.impl.WeekCalendarServiceImp;

@Controller
public class TimeConflict {
	
	@Autowired
	private WeekCalendarServiceImp wcsi;
	@Autowired
	private TimeConflictServiceImp tcsi;
	
	@RequestMapping("/getTimeConfictBool.do")
	public void getTimeConfictBool(String gradeId,String date,String time,String classroom,HttpServletRequest request,HttpServletResponse response){
		try {
			
			
			
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			gradeId = wcsi.getGradeId(gradeId);
			
			String startTime = time.split("-")[0];
			String endTime = time.split("-")[1];
			System.out.println("判断冲突时间"+gradeId+"-"+"-"+date+"-"+startTime+"-"+endTime);
			
			int rs = tcsi.getTimeConflict(gradeId, startTime, endTime, date,classroom);
			System.out.println("查询到条数"+rs);
			PrintWriter out = response.getWriter();
			out.print(rs);
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
