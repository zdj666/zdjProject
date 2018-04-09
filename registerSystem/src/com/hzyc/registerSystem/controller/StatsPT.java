package com.hzyc.registerSystem.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hzyc.registerSystem.po.Grade;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.po.Signing;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.StatsService;
import com.hzyc.registerSystem.tools.SystemLog;

/**
 * @author BIN
 * @date 2017-11-12 上午08:47:24
 */
@Controller
public class StatsPT {
	
	@Autowired
	private StatsService statsService;

	//项目组时间段的判断
	@RequestMapping("/statsPT.do")
	@SystemLog(module="项目组统计管理",methods="查看时间段")
	public ModelAndView statsPT(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView(); 
		
		
		List<Grade> gList = statsService.judgment("项目组");
		
		//没有项目组还查毛了
		boolean flag = false;
		
		if (gList.size()!=0) {
			flag = true;
		}
		

		if (flag) {
			//项目组建立时间
			String left = gList.get(0).getClassData();
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式  
			
			Date date = new Date();
			
			//今天时间
			String right = sdf.format(date);
			
			modelAndView.setViewName("stats_pt_week.jsp?left="+left+"&right="+right+"");
		} else {
			request.setAttribute("sucess", "这周没课啊！");
			request.setAttribute("url", "stats_no.jsp");
			modelAndView.setViewName("register_clue.jsp");
		}
		
		
		return modelAndView;
	}
	
	//项目组时间段处理
	@RequestMapping("/statsProcess.do")
	@SystemLog(module="学生统计管理",methods="时间段处理")
	public ModelAndView statsProcess(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
		
		request.setCharacterEncoding("utf-8");
		String value = new String(request.getParameter("value").getBytes("ISO-8859-1"),"utf-8"); 
		
		
		String left = request.getParameter("left");
		String right = request.getParameter("right");
		
		
		//固定格式项目组姓名和账号
		List<List<String>> binList = statsService.statsHistogram();
		//项目组id,姓名和账号
		List<Users> usersList = statsService.statsPT();
		//签到记录
		List<Signing> list = statsService.selSigningTime(left, right);
		//项目组应该上班时间 大于等于这周一，小于等于今天
		List<RealSchedule> selList = statsService.selPTT(left, right);
		//出勤率
		List<String> countList = new ArrayList<String>();
		//次数
		List<String> binCount = new ArrayList<String>();
		//算率
		for(int i=0;i<usersList.size();i++){
			int count = 0;
			for(int j=0;j<list.size();j++){
				if(usersList.get(i).getId().equals(list.get(j).getUserId())){
					count++;
				}
			}
			double x = (double)count/(selList.size());
			countList.add(i, x+"");
			binCount.add(i, count+"");
		}
		
		List<String> timesList = new ArrayList<String>();
		//对比出来每个人 准时，迟到，请假都是多少
		for (int i=0; i<usersList.size(); i++) {
			int onTime = 0;
			int beLate = 0;
			int leave = 0;
			for (int j=0;j<list.size();j++) {
				if (usersList.get(i).getId().equals(list.get(j).getUserId())) {
					if (list.get(j).getState() == 1) {
						onTime++;
					} else if (list.get(j).getState() == 2) {
						beLate++;
					} else if (list.get(j).getState() == 3) {
						leave++;
					}
				}
			}
			timesList.add(i, onTime + "," +beLate + "," + leave);
		}
		//显示柱状图的
		boolean sign = false;
		//显示折线的
		boolean result = false;
		
		//查是否有项目组
		List<Grade> gList = statsService.judgment("项目组");
		
		//没有项目组还查毛了
		boolean flag = false;
		
		if (gList.size()!=0 && selList.size()!=0) {
			flag = true;
		}
		//柱状图固定格式的list
		List<String> bin = new ArrayList<String>();
		//Grade grade = new Grade();
		//grade.setClassId("1");
		//grade.setCourseName("\'bin1\'");
		String x ="";
		for (int i=1; i<=usersList.size(); i++) {
			if (i!=usersList.size()) {
				x += "{ data : d"+i+", label : '"+usersList.get(i-1).getName()+"' }," ;
			} else {
				x += "{ data : d"+i+", label : '"+usersList.get(i-1).getName()+"' }" ;
			}
		}
		bin.add(x);
		
		
		if (flag) {
			if (value.equals("柱状图")) {
				
				sign = true;
				modelAndView.addObject("binList",binList);
				modelAndView.addObject("usersList",usersList);
				modelAndView.addObject("list",list);
				modelAndView.addObject("selList",selList);
				modelAndView.addObject("countList",countList);
				modelAndView.addObject("binCount",binCount);
				modelAndView.setViewName("stats_pt_time.jsp?sign="+sign+"&result="+result+"");
				
			} else if (value.equals("折线图")) {
				result = true;
				modelAndView.addObject("binList",binList);
				modelAndView.addObject("usersList",usersList);
				modelAndView.addObject("list",list);
				modelAndView.addObject("selList",selList);
				modelAndView.addObject("countList",countList);
				modelAndView.addObject("binCount",binCount);
				modelAndView.setViewName("stats_pt_time.jsp?sign="+sign+"&result="+result+"");
			} else if (value.equals("饼形图")) {
				modelAndView.addObject("binCount",binCount);
				modelAndView.addObject("bin",bin);
				modelAndView.setViewName("stats_pt_pie.jsp");
			} else if (value.equals("柱状堆")) {
				modelAndView.addObject("binList",binList);
				modelAndView.addObject("timesList",timesList);
				modelAndView.setViewName("stats_pt_week_stack.jsp");
			} 
		} else {
			request.setAttribute("sucess", "这周没课啊！");
			request.setAttribute("url", "stats_no.jsp");
			modelAndView.setViewName("register_clue.jsp");
		}
		
		return modelAndView;
	}

	
}
