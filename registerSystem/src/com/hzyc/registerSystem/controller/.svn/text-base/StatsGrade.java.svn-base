package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
 * @date 2017-11-14 下午07:22:08
 */
@Controller
public class StatsGrade {
	
	@Autowired
	private StatsService statsService;

	//练习，处理老师账号
	@RequestMapping("/practice.do")
	@SystemLog(module="学生统计管理",methods="练习")
	public String practice(HttpServletRequest request){
		String username = request.getParameter("username");
		request.getSession().setAttribute("username", username);
		//get
		//return "statsGradeT.do";
		return "statsGradeWK.do";
	}
	
	//获取到账号跳转到前台
	@RequestMapping("/statsGradeWK.do")
	@SystemLog(module="学生统计管理",methods="查看出勤率")
	public ModelAndView statsGradeWK(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		String username = (String)request.getSession().getAttribute("username");
		List<Grade> gList = statsService.statsTWK(username);
		if (gList.size() <= 0) {
			request.setAttribute("sucess", "没查到你的班啊！");
			request.setAttribute("url", "stats_tno.jsp");
			modelAndView.setViewName("register_clue.jsp");
		} else {
			modelAndView.addObject("gList", gList);
			modelAndView.setViewName("stats_grade_week.jsp");
		}
		
		return modelAndView;
	}
	
	//Ajax根据哪期刷新出学生
	@RequestMapping("/studentAjax.do")
	@SystemLog(module="学生统计管理",methods="Ajax查看学生")
	public void studentAjax(HttpServletRequest request,HttpServletResponse response){
		
		try {
			request.setCharacterEncoding("utf-8");
			String option1 = request.getParameter("option1");
			List<Map<String,String>> rsList = statsService.selStudent(option1);
			
			Gson gson = new Gson();
			String data = gson.toJson(rsList);
			
			//使用流的方式将信息返回给页面
			response.setCharacterEncoding("utf-8");
			PrintWriter writer = response.getWriter();
			writer.print(data);
			
			//强制刷新和关闭
			writer.flush();
			writer.close();
			
			//List<Map<String,String>> rsList = null;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	//处理本周统计
	@RequestMapping("/gradeWeek.do")
	@SystemLog(module="学生统计管理",methods="查看本周出勤率")
	public ModelAndView gradeWeek(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		//哪期
		String option1 = new String(request.getParameter("option1").getBytes("ISO-8859-1"),"utf-8"); 
		//什么图
		String option2 = new String(request.getParameter("option2").getBytes("ISO-8859-1"),"utf-8"); 
		
		//固定格式哪期学生所有东西
		List<List<String>> binList = statsService.statsGradeHistogram(option1);
		//哪期学生
		List<Users> usersList = statsService.selS(option1);
		
		//今天时间
		Date d = new Date();
		
		//哪期的签到记录
		List<Signing> list = statsService.selGradeSining(d,option1);
		//哪期应该上班时间 大于等于这周一，小于等于今天
		List<RealSchedule> selList = statsService.selGradeWT(d,option1);
		
		//出勤率
		List<String> countList = new ArrayList<String>();
		//次数
		List<String> binCount = new ArrayList<String>();
		
		//显示柱状图的
		boolean sign = false;
		//显示折线的
		boolean result = false;
		
		//判断各种list有没有值
		boolean flag = true;
		
		if (selList.size()<=0) {
			flag = false;
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
		
		if (flag) {
			if (option2.equals("柱状图")) {
				sign = true;
				modelAndView.addObject("binList",binList);
				modelAndView.addObject("usersList",usersList);
				modelAndView.addObject("list",list);
				modelAndView.addObject("selList",selList);
				modelAndView.addObject("countList",countList);
				modelAndView.addObject("binCount",binCount);
				modelAndView.setViewName("stats_grade_week_right.jsp?sign="+sign+"&result="+result+"&click="+0+"&option1="+option1+"");
			} else if (option2.equals("折线图")) {
				result = true;
				modelAndView.addObject("binList",binList);
				modelAndView.addObject("usersList",usersList);
				modelAndView.addObject("list",list);
				modelAndView.addObject("selList",selList);
				modelAndView.addObject("countList",countList);
				modelAndView.addObject("binCount",binCount);
				modelAndView.setViewName("stats_grade_week_right.jsp?sign="+sign+"&result="+result+"&click="+0+"&option1="+option1+"");
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
	
	@RequestMapping("/gradeLeft.do")
	@SystemLog(module="学生统计管理",methods="查看上周出勤率")
	public ModelAndView gradeLeft(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
		
		request.setCharacterEncoding("utf-8");
		String sign = new String(request.getParameter("sign").getBytes("ISO-8859-1"),"utf-8"); 
		
		String option1 = new String(request.getParameter("option1").getBytes("ISO-8859-1"),"utf-8"); 
		
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
		//哪期应该上班时间 大于等于这周一，小于等于今天
		List<RealSchedule> selList = statsService.gradeLeft(date,option1);
		
		//查哪期开设时间
		List<Grade> gList = statsService.judgment(option1);
		
		String click = "2";
		
		if (selList.get(0).getDate().compareTo(gList.get(0).getClassData())<=0) {
        	click = "1";
        } else {
        }
		
		//固定格式哪期姓名和账号
		List<List<String>> binList = statsService.statsGradeHistogram(option1);
		//哪期id,姓名和账号
		List<Users> usersList = statsService.selS(option1);
		//哪期签到记录
		List<Signing> list = statsService.selGradeSiningNo(date,option1);
		
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
		modelAndView.setViewName("stats_grade_week_right.jsp?sign="+sign+"&result="+result+"&click="+click+"&option1="+option1+"");
		
		return modelAndView;
	}
	
	@RequestMapping("/gradeRight.do")
	@SystemLog(module="学生统计管理",methods="查看下周出勤率")
	public ModelAndView gradeRight(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
		
		request.setCharacterEncoding("utf-8");
		String sign = new String(request.getParameter("sign").getBytes("ISO-8859-1"),"utf-8"); 
		String option1 = new String(request.getParameter("option1").getBytes("ISO-8859-1"),"utf-8"); 
		
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
		//哪期上班时间 大于等于上周一+7 小于等一上周一+14
		List<RealSchedule> selList = statsService.gradeRight(date,option1);
		
		//查所有签到记录
		List<Signing> gList = statsService.selGradeAll(option1);
		
		String click = "2";
		
		if (selList.get(selList.size()-1).getDate().compareTo(gList.get(0).getSignData())>=0) {
        	click = "0";
        } else {
        }
		
		//固定格式哪期姓名和账号
		List<List<String>> binList = statsService.statsGradeHistogram(option1);
		//哪期id,姓名和账号
		List<Users> usersList = statsService.selS(option1);
		//哪期签到记录
		List<Signing> list = statsService.selGradeSiningYes(date,option1);
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
		modelAndView.setViewName("stats_grade_week_right.jsp?sign="+sign+"&result="+result+"&click="+click+"&option1="+option1+"");
		
		
		
		
		return modelAndView;
	}
	
	@RequestMapping("/gradeCondition.do")
	@SystemLog(module="学生统计管理",methods="查看出勤情况")
	public ModelAndView gradeCondition(HttpServletRequest request) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		String option1 = new String(request.getParameter("option1").getBytes("ISO-8859-1"),"utf-8"); 
		//什么图
		String option3 = new String(request.getParameter("option3").getBytes("ISO-8859-1"),"utf-8"); 
		
		Date d = new Date();
		int date = d.getDay();
		if (date==0) {
			date=7;
		}
		
		
		//哪期应该上课记录
		List<RealSchedule> rList = statsService.selGradeWT(d, option1);
		//哪个学生的签到记录
		List<Signing> sList = statsService.selGradeStudent(d, option3);
		//哪期应该上课记录对应的星期
		List<String> stList = new ArrayList<String>();
		//哪个学生的签到记录对应的状态
		List<String> striList = new ArrayList<String>();
		int k=0;
		for (int i =0; i<rList.size(); i++) {
			String pTime = rList.get(i).getDate();
			int x = data(pTime);
			int y =0;
			for (int j=0; j<sList.size(); j++) {
				if (pTime.equals(sList.get(j).getSignData())) {
					y++;
				} else {
				}
			}
			if (y==0) {
				striList.add(i, "1");
			} else {
				//1准时，2迟到，3请假
				int state = sList.get(k).getState();
				k++;
				System.out.println(state);
				if (state==1) {
					striList.add(i, "4");
				} else {
					striList.add(i, state+"");
				}
			}
			
			stList.add(i, x+"");
		}
		modelAndView.addObject("stList",stList);
		modelAndView.addObject("striList",striList);
		modelAndView.setViewName("stats_grade_student.jsp?date="+date+"");
		//modelAndView.setViewName("");
		return modelAndView;
	}
	
	//获取一个String类型(2017-11-16)的时间是一个星期的星期几
	public int data(String pTime){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		  Calendar c = Calendar.getInstance();
		  try {
			c.setTime(format.parse(pTime));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  int dayForWeek = 0;
		  if(c.get(Calendar.DAY_OF_WEEK) == 1){
		   dayForWeek = 7;
		  }else{
		   dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1;
		  }
		  return dayForWeek;
		 }
	
	@RequestMapping("/statsGradeT.do")
	@SystemLog(module="学生统计管理",methods="查看时间段")
	public ModelAndView statsGradeT(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		
		String username = (String)request.getSession().getAttribute("username");
		List<Grade> gList = statsService.statsTWK(username);
		if (gList.size() <= 0) {
			request.setAttribute("sucess", "没查到你的班啊！");
			request.setAttribute("url", "stats_tno.jsp");
			modelAndView.setViewName("register_clue.jsp");
		} else {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式  
			
			Date date = new Date();
			
			//今天时间
			String right = sdf.format(date);
			
			List<String> list = new ArrayList<String>();
			for (int i=0; i<gList.size(); i++) {
				list.add(gList.get(i).getClassData());
			}
			
			modelAndView.addObject("gList", gList);
			modelAndView.addObject("list", list);
			modelAndView.setViewName("stats_grade.jsp?right="+right+"");
		}
		
		
		return modelAndView;
	}
	
	@RequestMapping("/statsAllGradeT.do")
	@SystemLog(module="学生统计管理",methods="查看全部学生时间段")
	public ModelAndView statsAllGradeT(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		
		List<Grade> gList = statsService.statsATWK();
		if (gList.size() <= 0) {
			request.setAttribute("sucess", "一个班都没有！");
			request.setAttribute("url", "stats_tno.jsp");
			modelAndView.setViewName("register_clue.jsp");
		} else {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式  
			
			Date date = new Date();
			
			//今天时间
			String right = sdf.format(date);
			
			List<String> list = new ArrayList<String>();
			for (int i=0; i<gList.size(); i++) {
				list.add(gList.get(i).getClassData());
			}
			
			modelAndView.addObject("gList", gList);
			modelAndView.addObject("list", list);
			modelAndView.setViewName("stats_grade.jsp?right="+right+"");
		}
		
		
		return modelAndView;
	}
	
	@RequestMapping("/statsGradeProcess.do")
	@SystemLog(module="学生统计管理",methods="查看时间段")
	public ModelAndView statsGradeProcess(HttpServletRequest request) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		String left = request.getParameter("left");
		String right = request.getParameter("right");
		String option1 = new String(request.getParameter("option1").getBytes("ISO-8859-1"),"utf-8"); 
		String value = new String(request.getParameter("option2").getBytes("ISO-8859-1"),"utf-8"); 
		
		//固定格式哪期学生所有东西
		List<List<String>> binList = statsService.statsGradeHistogram(option1);
		//哪期学生
		List<Users> usersList = statsService.selS(option1);
		//哪期的签到记录
		List<Signing> list = statsService.statsGradeSigning(option1,left,right);
		//哪期应该上班时间 大于等于left，小于等于right
		List<RealSchedule> selList = statsService.statsGrade(option1,left,right);
		System.out.println(option1);
		System.out.println(selList.size()+"-----------");
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
		
		
		//没有项目组还查毛了
		boolean flag = false;
		
		if (selList.size()!=0) {
			flag = true;
		}
		//柱状图固定格式的list
		List<String> bin = new ArrayList<String>();
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
				modelAndView.setViewName("stats_grade_time.jsp?sign="+sign+"&result="+result+"");
				
			} else if (value.equals("折线图")) {
				result = true;
				modelAndView.addObject("binList",binList);
				modelAndView.addObject("usersList",usersList);
				modelAndView.addObject("list",list);
				modelAndView.addObject("selList",selList);
				modelAndView.addObject("countList",countList);
				modelAndView.addObject("binCount",binCount);
				modelAndView.setViewName("stats_grade_time.jsp?sign="+sign+"&result="+result+"");
			} else if (value.equals("饼形图")) {
				modelAndView.addObject("binCount",binCount);
				modelAndView.addObject("bin",bin);
				modelAndView.setViewName("stats_grade_pie.jsp");
			} else if (value.equals("柱状堆")) {
				modelAndView.addObject("binList",binList);
				modelAndView.addObject("timesList",timesList);
				modelAndView.setViewName("stats_grade_week_stack.jsp");
			}  else {
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
	
	
}
