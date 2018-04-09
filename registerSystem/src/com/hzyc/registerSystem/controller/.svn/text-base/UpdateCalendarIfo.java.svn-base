package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.impl.UpdateCalendarIfoServiceImp;
import com.hzyc.registerSystem.services.impl.WeekCalendarServiceImp;
import com.hzyc.registerSystem.tools.SystemLog;

/**
 * @author lvgang
 * @desription 修改课程信息表
 * 
 * */
@Controller
public class UpdateCalendarIfo {
	
	@Autowired
	UpdateCalendarIfoServiceImp ucisp;
	
	@Autowired
	private WeekCalendarServiceImp wcsi;
	
	@RequestMapping("getCalendarIfo.do")
	@SystemLog(module="课程表管理",methods="获取课程表信息")
	public void getCalendarIfo(String grade_id,HttpServletRequest request,HttpServletResponse response){
		try {
			
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			//System.out.println(request.getParameter("user_id"));
			Users us = (Users)request.getSession().getAttribute("user");
			String user_id =""+us.getId();
			
			grade_id=wcsi.getGradeId(grade_id);
			
			List<RealSchedule> rsLsit =  ucisp.getCalIfo(user_id,grade_id);
			/*for(int i=0;i<rsLsit.size();i++){
				System.out.println(rsLsit.get(i).getClassroom()+"教室");
			}*/
			
			PrintWriter out = response.getWriter();
			
			Gson gson =new Gson();
			
			String gsonString  = gson.toJson(rsLsit); 
			
			System.out.println("###"+gsonString);
			
			out.print(gsonString);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/getCalUserIfo.do")
	@SystemLog(module="课程表管理",methods="获取Session里用户信息")
	public void getUserIfo(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			Users us = (Users)request.getSession().getAttribute("user");
			PrintWriter out = response.getWriter();
			
			if(us!=null){
				System.out.println("用户ID"+us.getId());
				
				out.print(us.getId());
				
			}else{
				out.print("");
			}
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("updateCalendarIfo.do")
	@SystemLog(module="课程表管理",methods="更新课程表信息")
	public void updateCalendarIfo(HttpServletResponse response,HttpServletRequest request){
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			

			Users us = (Users)request.getSession().getAttribute("user");
			String eventsData = request.getParameter("eventsData");
			String user_id =""+ us.getId();
			String grade_id = request.getParameter("grade_id");
			
			grade_id=wcsi.getGradeId(grade_id);
			
			System.out.println("日历数据"+eventsData+"老师"+user_id+"期数"+grade_id);
			//日历数据[{"title":"教室[201],详细时间[16:30-18:30]","start":"2017-11-14"},{"title":"教室[101],详细时间[12:40-14:30]","start":"2017-11-16"}]老师101期数1
			
			//先删除该期所有信息
			ucisp.deleteCalIfo(user_id, grade_id);
			System.out.println("删除完成");
			//格式化数据
			List<RealSchedule> rsList = new ArrayList<RealSchedule>();
			
			System.out.println("##"+eventsData);
			eventsData=eventsData.substring(2, eventsData.length()-2);
			System.out.println("$$"+eventsData);
			
			
			String[] ary1 =  eventsData.split("},");
			//int[] aryIdnex =eventsData.indexOf("},{");
			for(int i=0;i<ary1.length;i++){
				
				RealSchedule rs = new RealSchedule();
				
				System.out.println("第一层"+ary1[i]);
				String[] ary2 = ary1[i].split(":|,");
				for(int j=0;j<ary2.length;j++){
					System.out.println(j+"第二层"+ary2[j]);
				}
				String classroom = ary2[1].substring(4,ary2[1].length()-1);

				String time =""+ ary2[2].substring(5,ary2[2].length())+":"+ary2[3]+":"+ary2[4].substring(0,2);
				
				String date=""+ary2[6].substring(1,ary2[6].length()-1);
				
				System.out.println(classroom+"#"+time+"#"+date);
				
				rs.setClassroom(classroom);
				rs.setDate(date);
				rs.setGradeId(grade_id);
				rs.setTime(time);
				rs.setUserId(user_id);
				
				rsList.add(rs);
			}
			
			String bool = "false";
			
			//将所有信息添加进去
			if(!rsList.isEmpty()){
				for(int i=0;i<rsList.size();i++){
					RealSchedule rs = rsList.get(i);
					bool="true";	
					ucisp.insertCalIfo(rs);
				}
			}
				
			
	 		PrintWriter out = response.getWriter();
	 		out.print(bool);
	 		out.flush();
	 		out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
