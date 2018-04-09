package com.hzyc.registerSystem.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.registerSystem.po.Grade;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.po.Signing;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.StatsService;
import com.hzyc.registerSystem.tools.SystemLog;

/**
 * @author BIN
 * @date 2017-11-8 上午10:11:01
 */
@Controller
public class Stats {

	@Autowired
	private StatsService statsService;
	
	//项目组统计图处理
	@RequestMapping("/StatsPTWK.do")
	@SystemLog(module="项目组统计管理",methods="查看本周出勤率")
	public ModelAndView StatsPTWK(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		//下拉框值
		String value = new String(request.getParameter("value").getBytes("ISO-8859-1"),"utf-8"); 
		//String value = request.getParameter("value");
		//什么图
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		
		//固定格式项目组姓名和账号
		List<List<String>> binList = statsService.statsHistogram();
		//项目组成员id,姓名和账号
		List<Users> usersList = statsService.statsPT();
		//今天时间
		Date d = new Date();
		
		//签到记录
		List<Signing> list = statsService.selSining(d);
		//项目组应该上班时间 大于等于这周一，小于等于今天
		List<RealSchedule> selList = statsService.selPTWT(d);
		
		//时间轴操作
		StatsGrade st = new StatsGrade();
		List<List<String>> doubleList = new ArrayList<List<String>>();
		List<String> fList = null;
		for (int j=0; j<usersList.size(); j++) {
			fList = new ArrayList<String>();
			for (int i=1; i<=list.size(); i++) {
				if (usersList.get(j).getId().equals(list.get(i-1).getUserId())) {
					int day = st.data(list.get(i-1).getSignData());
					String x = "["+day+","+j+",1]";
					fList.add(x);
					
				} 
				
			}
			if(fList.size()<=0){
				String x = "[1,"+j+",0]";
				fList.add(x);
			}
			doubleList.add(fList);
			
			
		}
		
		List<String> sList =new ArrayList<String>();
		String format ="";
		List<String> dList = new ArrayList<String>();
		String dd = "";
		for (int i=0; i<usersList.size(); i++) {
			String name = usersList.get(i).getName();
			if (i+1==usersList.size()) {
				format +="'" + name + "'";
				dd += "d"+""+(i+1)+"";
			} else {
				format += "'" + name + "'" +",";
				dd += "d"+""+(i+1)+",";
			}
		}
		dList.add(dd);
		sList.add(format);
		//出勤率
		List<String> countList = new ArrayList<String>();
		//次数
		List<String> binCount = new ArrayList<String>();
		
		//查是否有项目组
		List<Grade> gList = statsService.judgment("项目组");
		
		//没有项目组还查毛了
		boolean flag = false;
		
		if (gList.size()!=0 && selList.size()!=0) {
			flag = true;
		}
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
		//显示柱状图的
		boolean sign = false;
		//显示折线的
		boolean result = false;
		
		if (flag) {
			if (value.equals("柱状图")) {
				sign = true;
				modelAndView.addObject("binList",binList);
				modelAndView.addObject("usersList",usersList);
				modelAndView.addObject("list",list);
				modelAndView.addObject("selList",selList);
				modelAndView.addObject("countList",countList);
				modelAndView.addObject("binCount",binCount);
				modelAndView.setViewName("statistics_projectteam_week.jsp?sign="+sign+"&result="+result+"&click="+0+"");
			} else if (value.equals("折线图")) {
				result = true;
				modelAndView.addObject("binList",binList);
				modelAndView.addObject("usersList",usersList);
				modelAndView.addObject("list",list);
				modelAndView.addObject("selList",selList);
				modelAndView.addObject("countList",countList);
				modelAndView.addObject("binCount",binCount);
				modelAndView.setViewName("statistics_projectteam_week.jsp?sign="+sign+"&result="+result+"&click="+0+"");
			} else if (value.equals("时间轴")) {
				
				modelAndView.addObject("dList",dList);
				modelAndView.addObject("sList",sList);
				modelAndView.addObject("doubleList",doubleList);
				modelAndView.setViewName("stats_pt_week_time.jsp");
				
			} else {
				request.setAttribute("sucess", "乱码了，速与管理员联系");
				request.setAttribute("url", "stats_no.jsp");
				modelAndView.setViewName("register_clue.jsp");
			}
		} else {
			request.setAttribute("sucess", "这周没课啊！");
			request.setAttribute("url", "stats_no.jsp");
			modelAndView.setViewName("register_clue.jsp");
		}
		
		return modelAndView;
	}
	
	//项目组统计图上一周处理
	@RequestMapping("/left.do")
	@SystemLog(module="项目组统计管理",methods="查看上周出勤率")
	public ModelAndView left(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
		
		request.setCharacterEncoding("utf-8");
		String sign = new String(request.getParameter("sign").getBytes("ISO-8859-1"),"utf-8"); 
		
		String result = "false";
		if (sign.equals("true")) {
			
		} else {
			result = "true";
		}
		String left = new String(request.getParameter("left").getBytes("ISO-8859-1"),"utf-8"); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dateFormat.parse(left);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//项目组应该上班时间 大于等于这周一，小于等于今天
		List<RealSchedule> selList = statsService.left(date);
		
		//查项目组开设时间
		List<Grade> gList = statsService.judgment("项目组");
		
		String click = "2";
		
		if (selList.get(0).getDate().compareTo(gList.get(0).getClassData())<=0) {
        	click = "1";
        } else {
        }
		
		//固定格式项目组姓名和账号
		List<List<String>> binList = statsService.statsHistogram();
		//项目组id,姓名和账号
		List<Users> usersList = statsService.statsPT();
		//签到记录
		List<Signing> list = statsService.selSiningNo(date);
		System.out.println(list.size());
		//出勤率
		List<String> countList = new ArrayList<String>();
		//次数
		List<String> binCount = new ArrayList<String>();
		
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
		
		modelAndView.addObject("binList",binList);
		modelAndView.addObject("usersList",usersList);
		modelAndView.addObject("list",list);
		modelAndView.addObject("selList",selList);
		modelAndView.addObject("countList",countList);
		modelAndView.addObject("binCount",binCount);
		modelAndView.setViewName("statistics_projectteam_week.jsp?sign="+sign+"&result="+result+"&click="+click+"");
		
		return modelAndView;
	}
	
	//项目组统计图下一周处理
	@RequestMapping("/right.do")
	@SystemLog(module="项目组统计管理",methods="查看下周出勤率")
	public ModelAndView right(HttpServletRequest request) throws UnsupportedEncodingException{
		
		
		request.setCharacterEncoding("utf-8");
		String sign = new String(request.getParameter("sign").getBytes("ISO-8859-1"),"utf-8"); 
		
		
		ModelAndView modelAndView = new ModelAndView();
		String result = "true";
		if (sign.equals("false")) {
			
		} else {
			result = "false";
		}
		String left = new String(request.getParameter("left").getBytes("ISO-8859-1"),"utf-8"); 
		
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dateFormat.parse(left);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//项目组上班时间 大于等于上周一+7 小于等一上周一+14
		List<RealSchedule> selList = statsService.right(date);
		
		//查所有签到记录
		List<Signing> gList = statsService.selAll();
		
		String click = "2";
		
		if (selList.get(selList.size()-1).getDate().compareTo(gList.get(0).getSignData())>=0) {
        	click = "0";
        } else {
        }
		
		//固定格式项目组姓名和账号
		List<List<String>> binList = statsService.statsHistogram();
		//项目组id,姓名和账号
		List<Users> usersList = statsService.statsPT();
		//签到记录
		List<Signing> list = statsService.selSiningYes(date);
		//出勤率
		List<String> countList = new ArrayList<String>();
		//次数
		List<String> binCount = new ArrayList<String>();
		
		
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
		
		modelAndView.addObject("binList",binList);
		modelAndView.addObject("usersList",usersList);
		modelAndView.addObject("list",list);
		modelAndView.addObject("selList",selList);
		modelAndView.addObject("countList",countList);
		modelAndView.addObject("binCount",binCount);
		modelAndView.setViewName("statistics_projectteam_week.jsp?sign="+sign+"&result="+result+"&click="+click+"");
		
		return modelAndView;
	}
	
	
}
