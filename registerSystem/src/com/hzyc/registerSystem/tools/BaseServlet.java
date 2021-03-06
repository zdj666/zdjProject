package com.hzyc.registerSystem.tools;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.hzyc.registerSystem.po.Dictionary;


import com.hzyc.registerSystem.services.impl.GetDictionaryImpl;


@SuppressWarnings("serial")  
public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	private static ArrayList<HashMap<String,String>> sexes = new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> RoleName = new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> SchooleName= new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> QuestionName= new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> ClassTypeName= new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> ClassPlace= new  ArrayList<HashMap<String,String>>();
	
	
	 public static ArrayList<HashMap<String, String>> getQuestionName() {
		return QuestionName;
	}

	public static void setQuestionName(
			ArrayList<HashMap<String, String>> questionName) {
		QuestionName = questionName;
	}

	public static ArrayList<HashMap<String, String>> getSexs() {
	return sexes;
	 }

	 public static void setSexs(ArrayList<HashMap<String, String>> sexes) {
	BaseServlet.sexes =sexes;
	 }

	@Override  
	    public void service(ServletRequest req, ServletResponse res)  
	            throws ServletException, IOException {  
	     
	    }  
	  
	    @Override  
	    public void init() throws ServletException {  
	        getServletBean();  
	   
	        //获取到了一个方法了
	        List<Dictionary>  list = proxyServlet.getDictionary("性别");
	       //调用set方法 数据结构里就有值了
	       

	       		HashMap<String,String> oneMap=new HashMap<String,String>();
	       		 String allValue="";
	       		for(int i=0;i<list.size();i++){
	       			allValue=allValue+","+list.get(i).getCode();
	       		}
	       		
	       		oneMap.put("sex",allValue);
	       		sexes.add(oneMap);
	            Dict.setSex(sexes);
	            
	            
	            List<Dictionary>  JueName= proxyServlet.getDictionary("角色");
	            HashMap<String,String> JueMap=new HashMap<String,String>();
	            String allJueValue="";
	       		for(int i=0;i<JueName.size();i++){
	       			allJueValue+=","+JueName.get(i).getName();
	       		}
	       		JueMap.put("JueName",allJueValue);
	       		RoleName.add(JueMap);
	       		Dict.setRoleName(RoleName);
	    
	       	/*获取学校名称*/	
	       		List<Dictionary>  getSchoolName= proxyServlet.getDictionary("学校名称");
	            HashMap<String,String> SchoolMap=new HashMap<String,String>();
	            String allSchoolValue="";
	       		for(int i=0;i<getSchoolName.size();i++){
	       			allSchoolValue+=","+getSchoolName.get(i).getName();
	       		}
	       		
	       		SchoolMap.put("SchooleName",allSchoolValue);
	       		SchooleName.add(SchoolMap);
	       		Dict.setSchooleName(SchooleName);
	       		
	       		
	       	/*获取密保问题*/
	       		List<Dictionary>  getQuestionName= proxyServlet.getDictionary("密保问题");
	            HashMap<String,String> QuestionMap=new HashMap<String,String>();
	            String allQuestionValue="";
	       		for(int i=0;i<getQuestionName.size();i++){
	       			allQuestionValue+=","+getQuestionName.get(i).getName();
	       		}
	       		
	       		QuestionMap.put("QuestionName",allQuestionValue);
	       		QuestionName.add(QuestionMap);
	       		Dict.setQuestionName(QuestionName);
	       	/*获取班级名称*/	
	       		List<Dictionary>  getClassName= proxyServlet.getDictionary("班级名称");
	            HashMap<String,String> ClassMap=new HashMap<String,String>();
	            String allClassValue="";
	       		for(int i=0;i<getClassName.size();i++){
	       			allClassValue+=","+getClassName.get(i).getName();
	       		}
	       		
	       		ClassMap.put("ClassName",allClassValue);
	       		ClassName.add(ClassMap);
	       		Dict.setClassName(ClassName);
	       		/*课程类型获取*/
	       		List<Dictionary>  getClassType= proxyServlet.getDictionary("课程类型");
	            HashMap<String,String> ClassTypeMap=new HashMap<String,String>();
	            String allClassTypeValue="";
	       		for(int i=0;i<getClassType.size();i++){
	       			allClassTypeValue+=","+getClassType.get(i).getName();
	       		}
	       		
	       		ClassTypeMap.put("ClassTypeName",allClassTypeValue);
	       		ClassTypeName.add(ClassTypeMap);
	       		Dict.setClassTypeName(ClassTypeName);
	       		
	       		/*班级地点*/		
	       		List<Dictionary>  getClassPlace= proxyServlet.getDictionary("教室");
	            HashMap<String,String> ClassPlacevalue=new HashMap<String,String>();
	            String allClassPlaceValue="";
	       		for(int i=0;i<getClassPlace.size();i++){
	       			allClassPlaceValue+=","+getClassPlace.get(i).getName();
	       		}
	       		
	       		ClassPlacevalue.put("ClassPlace",allClassPlaceValue);
	       		ClassPlace.add(ClassPlacevalue);
	       		Dict.setClassPlace(ClassPlace);
	    }  
	  
	   

		public String targetBean="initService";  
	      
	   /*解决的问题是:
	    * 			1:在服务器启开的时候就可以运行字典，并将值只获取一次，就可在整个系统中使用
	    * 			2:当有值更新的时候，我就可以将值刷新			
	    * 
	    * */
	    public GetDictionaryImpl proxyServlet;  
	      
	    public void getServletBean(){  
	        WebApplicationContext wac = WebApplicationContextUtils  
	                .getRequiredWebApplicationContext(getServletContext());  
	        					/*这里一步就是要与sping环境融入进去*/
	        this.proxyServlet = (GetDictionaryImpl) wac.getBean(targetBean);  
	    }

		public static void setRoleName(ArrayList<HashMap<String,String>> roleName) {
			RoleName = roleName;
		}

		public static ArrayList<HashMap<String,String>> getRoleName() {
			return RoleName;
		}

		public static void setSchooleName(ArrayList<HashMap<String,String>> schooleName) {
			SchooleName = schooleName;
		}

		public static ArrayList<HashMap<String,String>> getSchooleName() {
			return SchooleName;
		}

		public static void setClassName(ArrayList<HashMap<String,String>> className) {
			ClassName = className;
		}

		public static ArrayList<HashMap<String,String>> getClassName() {
			return ClassName;
		}

		public static void setClassTypeName(ArrayList<HashMap<String,String>> classTypeName) {
			ClassTypeName = classTypeName;
		}

		public static ArrayList<HashMap<String,String>> getClassTypeName() {
			return ClassTypeName;
		}  
}
