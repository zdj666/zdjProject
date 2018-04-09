package com.hzyc.registerSystem.tools;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import com.hzyc.registerSystem.po.Course;
import com.hzyc.registerSystem.po.RealSchedule;

public class AutoCalendar {
	

	public List<RealSchedule> setIfo(String endtime,List<Course> cList){
		
		System.out.println("格式化数据工具类");
		
		System.out.println("cList的信息");
		for(int i=0;i<cList.size();i++){
			System.out.println(cList.get(i).getClassroom()+"-"+cList.get(i).getTime());
		}
		
		//获取当天日期
		Calendar c  = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH); 
		int date = c.get(Calendar.DATE); 
		int week = c.get(Calendar.DAY_OF_WEEK)-1;
		System.out.println("当天时间"+year+"#"+month+"#"+date+"#"+week);
		
		Calendar start = Calendar.getInstance();  
	    start.set(year, month, date);  
	    Long startTIme = start.getTimeInMillis();  
	    
	    String t[] = endtime.split("-");
	    int num[] = new int[3];
	    for(int i=0;i<t.length;i++){
	    	num[i]=Integer.parseInt(t[i]);
	    }
	    System.out.println("结束时间"+num[0]+"#"+num[1]+"#"+num[2]);
	    Calendar end = Calendar.getInstance();  
	    end.set(num[0], num[1]-1, num[2]);  
	    Long endTime = end.getTimeInMillis();  
	  
	    Long oneDay = 1000 * 60 * 60 * 24l;  
	  
	    Long time = startTIme;  
	    
	    List<RealSchedule> rsList = new ArrayList<RealSchedule>();
	    System.out.println(time+"-"+endTime);
	    while (time <= endTime) {  
	    	//System.out.println("进入时间循环");
	        Date d = new Date(time);  
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        
	        System.out.println("时间格式"+df.format(d)); 
	        c.setTime(d);
	        int week1 = c.get(Calendar.DAY_OF_WEEK)-1;
	        System.out.println("周信息"+week1);
	        System.out.println("校验信息"+cList.get(week1).getClassroom()+"--"+cList.get(week1).getTime());
	        if(!cList.get(week1).getClassroom().equals("")&&!cList.get(week1).getTime().equals("")){
	        	System.out.println("存入的信息"+cList.get(week1).getClassroom()+"$$$"+cList.get(week1).getTime());
	        	
	        	RealSchedule rs = new RealSchedule();
	 	        rs.setClassroom(cList.get(week1).getClassroom());
	 	        rs.setDate(df.format(d));
	 	        rs.setUserId(""+cList.get(week1).getUserId());
	 	        rs.setTime(cList.get(week1).getTime());
	 	        rs.setGradeId(""+cList.get(week1).getGradeId());
		        rsList.add(rs);
	        }
	        
	        time += oneDay;  
	    }  
	    String uI =""+ cList.get(0).getUserId();
	    String gI ="" + cList.get(0).getGradeId();
	    String time1 = year+"-"+month+"-"+date;
	    String time2 = num[0]+"-"+num[1]+"-"+num[2];
	    
	   // wcs.deleteCal(uI, gI, time1, time2);
	    System.out.println(rsList.size()+"rs");
	    for(int i=0;i<rsList.size();i++){
	    	//wcs.addCal(rsList.get(i));
	    	System.out.print(rsList.get(i).getClassroom()+"*[1*");
	    	System.out.print(rsList.get(i).getDate()+"*[2*");
	    	System.out.print(rsList.get(i).getGradeId()+"*[3*");
	    	System.out.print(rsList.get(i).getTime()+"*[4*");
	    	System.out.println(rsList.get(i).getUserId()+"*[5*");
	    }
	    
	    return rsList;
	}
	
	public static void main(String[] args) {
		
		
		AutoCalendar ac = new AutoCalendar();
		List<Course> cList = new ArrayList<Course>();
		
		for(int i=0;i<7;i++){
			Course c = new Course();
			c.setClassroom("");
			c.setGradeId(11);
			c.setTime("12:30-14:30");
			c.setUserId(1);
			c.setWeek(""+i);
			cList.add(c);
		}
		
		cList.get(0).setClassroom("11");
		
		
		ac.setIfo("2018-2-20",cList);
	}
}
