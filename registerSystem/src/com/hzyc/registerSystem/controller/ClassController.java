package com.hzyc.registerSystem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.DriverManager;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hzyc.registerSystem.po.Course;
import com.hzyc.registerSystem.po.Dictionary;
import com.hzyc.registerSystem.po.Grade;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.ClassService;
import com.hzyc.registerSystem.services.impl.GetDictionaryImpl;
import com.hzyc.registerSystem.tools.BaseServlet;
import com.hzyc.registerSystem.tools.Dict;
import com.hzyc.registerSystem.tools.DictTag;

@Controller
public class ClassController {
	long after;
	@Autowired
    private ClassService classService;
	@Autowired
	private com.hzyc.registerSystem.services.ChangeDictionaryService ChangeDictionaryService;
	
	@Autowired
	private ClassService cs;
	List<Users> u = new ArrayList<Users>();
	
	@RequestMapping("/queryAllClassId.do")
	   public ModelAndView queryAllClssId(String classSelect,HttpServletRequest request){
		request.setAttribute("TiaoVal","1");
		//System.out.println("===================()" + classSelect);
		Users u = new Users();
		u.setClassId(classSelect);
		List<Users> fdList=classService.queryAllClassId(u);
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.addObject("usersItems",fdList);
		modelAndView.setViewName("Class.jsp");
		return modelAndView;
		} 
	
	@RequestMapping("/queryGradeAndUsersByClssId.do")
	 public void queryCountByClassId(HttpServletResponse response,HttpServletRequest request) throws IOException{
		System.out.println("进入了queryGradeAndUsersByClssId.do()");
		String classId = request.getParameter("classId");
		System.out.println("classId===" + classId);
		Users u = (Users)request.getSession().getAttribute("user");
		u.setClassId(classId);
		List<Grade> uList =classService.selGradeAndUsersByClassId(u);
		System.out.println("uList===" + uList.size());
		Gson g = new Gson();
		//转换数据类型
		String retext = g.toJson(uList);
		
		//开始返回
		response.setContentType("text/html");
		//设置返回编码方式
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
	
		out.print(retext);
		out.flush();
		out.close();
	}

	@RequestMapping("/queryGradeAndUsersByUserId.do")
	public void queryGradeAndUsersByUserId(HttpServletResponse response,HttpServletRequest request) throws IOException{
		//System.out.println("进入了queryGradeAndUsersByUserId.do!!!!!!!!!!!" );
		//ModelAndView mav = new ModelAndView();
			Users u = (Users) request.getSession().getAttribute("user");
			//System.out.println("userId====="  + u.getId());
			List<Users> uList =classService.queryGradeAndUsersByUserId(u.getId());

			
			//gson对json的封装，数据类型的转换
			Gson g = new Gson();
			//转换数据类型
			String retext = g.toJson(uList);
			
			//开始返回
			response.setContentType("text/html");
			//设置返回编码方式
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
		
			out.print(retext);
			out.flush();
			out.close();
			
			//System.out.println("==========aaaaaaa" + uList.size());	
//			mav.addObject("uList", uList);
//			mav.addObject("TiaoVal", "1");
//			mav.setViewName("Class.jsp");
			//return mav;
	}
	@RequestMapping("/selGradeByClassId.do")
	public ModelAndView  selGradeByClassId(Users g){
		    List<Grade> list = classService.selGradeAndUsersByClassId(g);
			ModelAndView modelAndView = new ModelAndView();	
			modelAndView.addObject("list",list);
			modelAndView.setViewName("queryStuSizeByClassId.do");
			
			return modelAndView;
	}
	
	 @RequestMapping("/queryStuMessageByClassId.do")
	public ModelAndView queryStuMessageByClassId(String classId,HttpServletRequest request){
		//System.out.println("===========aaaaaaaaaassss" +classId);
		List<Users> list=classService.queryStuMessageByClassId(classId);
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.addObject("usersItems",list);
		modelAndView.setViewName("byClassId_stuMessage.jsp");
		return modelAndView;
		
	} 

	 
	 @RequestMapping("/insertClass.do")
	public String insertClass(Grade g,HttpServletRequest request){
		String username =  (String) request.getSession().getAttribute("username");
			try {
				g.setClassId("腾飞"+g.getClassId()+"期");
				System.out.println("insertClass.do方法执行了");
				/*********结课日期自动获取***************/
				String classDate = g.getClassData();//获取开班日期
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date d = sdf.parse(classDate);//把String类型转化为Date
				long before = d.getTime();//把date转化为格林威治时间
				System.out.println("课程名"+g.getCourseName());
				if(g.getCourseName().equals("javaEE")){
					 after = 120 * 24 * 60 * 60 * 1000L;
					 System.out.println("JAVAEE");
					
				}
				if(g.getCourseName().equals("javaSE")){
					after = 180 * 24 * 60 * 60 * 1000L;
					 System.out.println("JavaSE");
				}
				if(g.getCourseName().equals("安卓")){
					after = 150 * 24 * 60 * 60 * 1000L;
					 System.out.println("Android");
				}
				if(g.getCourseName().equals("前端")){
					after = 90 * 24 * 60 * 60 * 1000L;
					 System.out.println("web前端");
				}
				long end = before + after;//开班时间 + 上课时间
				String endTime= sdf.format(end);				
				g.setEndTime(endTime);
				/***********把表格修改的信息传回到数据库***************/
			
				g.setState(g.getState().split(",")[0]);
				boolean result = classService.insertClass(g);
				List<Course> rsList = new ArrayList<Course>();
				if(result){
					//通过成功的信息查出成功的id
					int id = cs.selIdByGrage(g).getId();
				for(int i = 0;i<7;i++){
					Course rs = new Course();
					Users user = (Users)request.getSession().getAttribute("user");
					rs.setUserId(user.getId());
					rs.setClassroom("");
					rs.setTime("");
					//这个id要从数据库里面查出来
					rs.setGradeId(id);
					switch(i){
						case 0:
							rs.setWeek("星期一");
							break;
						case 1:
							rs.setWeek("星期二");
							break;
						case 2:
							rs.setWeek("星期三");
							break;
						case 3:
							rs.setWeek("星期四");
							break;
						case 4:
							rs.setWeek("星期五");
							break;
						case 5:
							rs.setWeek("星期六");
							break;
						case 6:
							rs.setWeek("星期日");
							break;
					}
					rsList.add(rs);
				}
				}
				if(result){
					for(int i = 0;i<7;i++){
						cs.insertCourse(rsList.get(i));
					}
				}
				/*id:自增
				 *type="班级名称"
				 *code="获取到最大值"
				 *name="值"
				 *states="启用" 
				 * 
				 * */
				/*判断数据库里面有无班级名称*/
				
				
				
				String getNull=ChangeDictionaryService.getMaxCode();
				if(getNull==null){
					Dictionary dic=new Dictionary();
					dic.setCode("2001");
					dic.setName(g.getClassId());
					boolean Judge=ChangeDictionaryService.addDic(dic);
					
				}else{
				int getMaxCode=Integer.parseInt(ChangeDictionaryService.getMaxCode())+1;
				String getMaxCodes=String.valueOf(getMaxCode);
				Dictionary dic=new Dictionary();
				dic.setCode(getMaxCodes);
				dic.setName(g.getClassId());
				boolean Judge=ChangeDictionaryService.addDic(dic);
				
				}
				
				if(result){
					List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType("班级名称");
				
					ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
					 HashMap<String,String> ClassMap=new HashMap<String,String>();
			            String allClassValue="";
			       		for(int i=0;i<getClassName.size();i++){
			       			allClassValue+=","+getClassName.get(i).getName();
			       		}
			       		
			       		ClassMap.put("ClassName",allClassValue);
			       		ClassName.add(ClassMap);
			       		Dict.setClassName(ClassName);
			       		DictTag dict=new DictTag();
					
					
					return "Class.jsp";	
				}else{
					
					return "添加失败";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "Class.jsp";
			
		} 
	 
	 @RequestMapping("/queryStuMessageDetail.do")
		public ModelAndView queryStuMessageDetail(String classId,HttpServletRequest request) throws UnsupportedEncodingException{
			//System.out.println("===========aaaaaaaaaassss" +classId);
		    classId = new String(request.getParameter("classId").getBytes("ISO-8859-1"),"utf-8");
			List<Users> list=classService.queryStuMessageDetail(classId);
			System.out.println("Controller中的classId"+classId);
			ModelAndView modelAndView = new ModelAndView();	
			modelAndView.addObject("usersItems",list);	
			modelAndView.setViewName("byClassId_stuMessage.jsp");
			return modelAndView;
			
		} 
	 
	 @RequestMapping("/updateGradeForGrade.do")
	 public void updateGradeForGrade(HttpServletRequest request ,Grade g){
		 System.out.println("进了updateGradeForGrade.do=======");
		 
		 	String para = request.getParameter("list");
		 
		 	
		 	System.out.println("=====最初===="+	para);
		 	String arr[]=para.split(",");
		 	String aa="";
		 	for(int i=0;i<arr.length;i++){
		 		aa+=arr[i];
		 	}
	 		System.out.println("----hebing-------"+aa);
		 	String aaArr[]=aa.split(":");
		 	String  aaHe="";
		 	for(int j=0;j<aaArr.length;j++){
		 		aaHe+=aaArr[j];
		 	}
		 	System.out.println("======第二次截取==="+aaHe);
		 	String aaend[]=aaHe.split("'");
		 	String aaEnd="";
			for(int j=0;j<aaend.length;j++){
				aaEnd+=aaend[j];
		 	}
			System.out.println("----------------zuizuizui"+aaEnd);
			String [] end = aaEnd.split("\"");
			/****************获取数据库中的值*************************/
			//Grade g1 = new Grade();
			System.out.println("index----------->>>>>>"+end[18]);
			
			System.out.println("0000000----->>"+end[18].equals("0}"));
			System.out.println("1111111----->>"+end[18].equals("1}"));
			System.out.println("2222222----->>"+end[18].equals("2}"));
			System.out.println("3333333----->>"+end[18].equals("3}"));
			if(end[18].equals("0}") ){
				System.out.println("0000000----->>"+end[18].equals("0") );
				g.setClassId(end[3]);
			 	g.setClassData(end[7]);
			 	g.setEndTime(end[11]);
			 	g.setCourseName(end[15]);
			 	classService.updateGradeForGrade0(g);
			}
			if(end[18].equals("1}") ){
				g.setClassId(end[3]);
			 	g.setClassData(end[7]);
			 	g.setEndTime(end[11]);
			 	g.setCourseName(end[15]);
			 	classService.updateGradeForGrade1(g);
			}
			if(end[18].equals("2}") ){
				g.setClassId(end[3]);
			 	g.setClassData(end[7]);
			 	g.setEndTime(end[11]);
			 	g.setCourseName(end[15]);
			 	classService.updateGradeForGrade2(g);
			}
			if(end[18].equals("3}") ){
				g.setClassId(end[3]);
			 	g.setClassData(end[7]);
			 	g.setEndTime(end[11]);
			 	g.setCourseName(end[15]);
			 	classService.updateGradeForGrade3(g);
			}
			
		 	/*for(int m = 0 ;m<end.length;m++){
			System.out.println("最后一次额"+end[m]+"------>m为"+m);
				
			}*/
		 	
	 }
	 @RequestMapping("/min.do")
	 public void min(HttpServletResponse response) throws IOException{
		 String min = classService.min();
		 System.out.println("最小值为____"+min);
		 boolean a =  min.startsWith("腾飞");
		 System.out.println("是否以腾飞开头"+a);
		 int data = 0;
		if(min.startsWith("腾飞")){
			    String value=min.substring(2,min.indexOf("期"));
				System.out.println("我是你的小可爱啊------》》》》"+value);
				data=Integer.parseInt(value)+1;
				 // System.out.println("value值为"+value);
				 //System.out.println("最小值为*************"+data);
				 
					}
		response.setContentType("text/html");
		//设置返回编码方式
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(data);
		out.flush();
		out.close();
		
			
	 }
	 @RequestMapping("/yesOrNo.do")
	 public void yesOrNo(HttpServletResponse response) throws IOException, ParseException{
		 
		 
		 /****************Date类:可以获取当前的系统时间********************/
		 Date d = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 String endDate = sdf.format(d);//转化为特定的格式
		 System.out.println("当前时间endDate>>>>>"+endDate);
		 /*******************获取数据库中查询的时间***************************************/
		 String yn =classService.yesOrNo();
		 System.out.println("从数据库中获取的时间————》"+yn);
		 Date a = sdf.parse(yn);
		 long dmMinutes = a.getTime();//数据库中的格林威治时间
		 //System.out.println(" long before---------->"+shu);
		 System.out.println("系统时间---------->>>dmMinutes:"+dmMinutes);
		 long after = 3 * 24 * 60 * 60 * 1000L;
		 long sum = dmMinutes - after;
		 System.out.println("数据库的时间减去3天之后的时间---------->"+sum);
		 //把毫秒数转化为Date类，直接将参数写到()内
		 Date later = new Date(sum);
		 System.out.println("最后的时间---------->"+later);
		 String startDate1 = sdf.format(later);
		 System.out.println("最后转化的时间---------->"+startDate1);
		 System.out.println("endDate.equals(yn)----->>>"+endDate.equals(yn));
		 response.setCharacterEncoding("utf-8");
		 PrintWriter out = response.getWriter();
		 out.print(yn);
		 if(endDate.equals(yn)){
			 out.print(endDate);	 	 
		 }
		 out.flush();
		 out.close();  
 
	 }
	 @RequestMapping("/updateState.do")
	 public void updateState(HttpServletRequest request,String endTime){
		/*String endTime= request.getParameter("endTime");*/
		System.out.println("updateState.do执行了" + endTime);
		classService.updateState(endTime);
		
	 }
	 @RequestMapping("/selectGradeByTwo.do")
	 public ModelAndView selectGradeByTwo(Grade g){
		    List<Grade> list=classService.selectGradeByTwo(g);
			ModelAndView modelAndView = new ModelAndView();	
			modelAndView.addObject("list",list);	
			modelAndView.setViewName("classFrame.jsp");
			return modelAndView;
	 } 
	 @RequestMapping("/selectGradeByTwo2.do")
	 public ModelAndView selectGradeByTwo2(Grade g,HttpServletRequest request){
		 Users u = (Users)request.getSession().getAttribute("user");
		 g.setUserId(String.valueOf(u.getId()));
		 List<Grade> gList=classService.selectGradeByTwo2(g);
		 ModelAndView modelAndView = new ModelAndView();
		System.out.println("我得到的grade size:" + gList.size());
		if(gList.size()==0){
			List<Grade> list = classService.selectSize0(g);
			list.get(0).setCount(0);
			System.out.println("__________--------->>>>>>"+list.get(0).getCourseName());
			System.out.println("__________--------->>>>>>"+list.get(0).getClassData());
			System.out.println("__________--------->>>>>>"+list.get(0).getEndTime());
			System.out.println("__________--------->>>>>>"+list.get(0).getCount());
			modelAndView.addObject("list",list);
			
		}else{
			    gList.get(0).setCount(gList.get(0).getuList().size() );	
			    modelAndView.addObject("list",gList);
			    System.out.println("__________--------->>>>>>"+ gList.get(0).getCourseName());
				System.out.println("__________--------->>>>>>"+gList.get(0).getClassData());
				System.out.println("__________--------->>>>>>"+gList.get(0).getEndTime());
				System.out.println("__________--------->>>>>>"+gList.get(0).getCount());
		}
		/*for(int i=0;i<list.size();i++){
			 System.out.println("---------------->>>>>>studen" + list.get(i).getuList().size());
		}*/
		 modelAndView.setViewName("classFrame.jsp");
		 return modelAndView;
	 } 
   
}
