package com.hzyc.registerSystem.tools;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class DictTag  extends SimpleTagSupport{
		
	   private String message;

	   public void setMessage(String msg) {
	      this.message = msg;
	   }
	
	   StringWriter sw = new StringWriter();
	
	
	public void doTag() throws JspException, IOException{
		
		
		if (message.isEmpty()) {
	        
	          JspWriter out = getJspContext().getOut();
	          out.println( message );
	       } else if(message.equals("sex")){
	    	   String[] getPer=Dict.getAllData(); 
	   		JspWriter out = getJspContext().getOut();
	   		String value="";
	   		for(int i=0;i<getPer.length;i++){
	   			value+="<option>"+getPer[i]+"</option>";
	   		}
	   		String tureValue="<select id=value5 name=getSex>"+value+"</select>";
	   		out.println(tureValue);
	       }else if(message.equals("RoleName")){
	    	  String[] getPerRole=Dict.getRoleData();
	    	  JspWriter out = getJspContext().getOut();
		   		String value="";
		   	  for(int i=0;i<getPerRole.length;i++){
		   		value+="<option>"+getPerRole[i]+"</option>";
		   		
		   	}	
		   	  System.out.println("这里是用于显示的值"+value);
		   	String tureValue="<select id=getPower name=RoleName onchange=getPower()>"+value+"</select>";
	   		out.println(tureValue);
	       }else if(message.equals("SchoolName")){
	    	   String[] getPerSchool=Dict.getSchoolData();
	    	   
		    	  JspWriter out = getJspContext().getOut();
		    	  String value="" + "<option >"+"请选择学校"+"</option>";
			   	  for(int i=0;i<getPerSchool.length;i++){
			   		value+="<option >"+getPerSchool[i]+"</option>";
			   		
			   	}	
			  
			   	String tureValue="<select name=school id=SchoolName>"+value+"</select>";
		   		out.println(tureValue);  
	    	   
	    	   
	       }else if(message.equals("QuestionName")){
	    	   String[] getPerQuestion=Dict.getQuestionData();
	    	   
		    	  JspWriter out = getJspContext().getOut();
			   		String value="";
			   	  for(int i=0;i<getPerQuestion.length;i++){
			   		value+="<option>"+getPerQuestion[i]+"</option>";
			   		
			   	}	
			  
			   	String tureValue="<select name=question class=form-control id=mbQuestion>"+value+"</select>";
		   		out.println(tureValue);  
	    	   
	    	   
	       }else if(message.equals("ClassName")){
	    	   String[] getPerClass=Dict.getClassData();
	    	   
		    	  JspWriter out = getJspContext().getOut();
			   		String value="" + "<option >"+"请选择班级"+"</option>";
			   	  for(int i=0;i<getPerClass.length;i++){
			   		value+="<option >"+getPerClass[i]+"</option>";
			   		
			   	}	
			  
			   	String tureValue="<select onchange=ChangSele() class=form-control id=ClassName name=classId>"+value+"</select>";
		   		out.println(tureValue);  
	    	   
	    	   
	       }else if(message.equals("ClassTypeName")){
	    	   
	    	   String[] getPerClassType=Dict.getClassTypeData();
	    	   
		    	  JspWriter out = getJspContext().getOut();
			   	  String value="" + "<option >"+"请选择"+"</option>";
			   	  for(int i=0;i<getPerClassType.length;i++){
			   		value+="<option >"+getPerClassType[i]+"</option>";
			   		
			   	}	
			  
			   	String tureValue="<select onchange=ChangTypeSele() id=ClassTypeName name=courseName>"+value+"</select>";
		   		out.println(tureValue);  
	    	   
	    	   
	    	   
	       }else if(message.equals("ClassPlace")){
	    	   
	    	   String[] getPerClassPlace=Dict.getClassPlaces();
	    	   
		    	  JspWriter out = getJspContext().getOut();
			   	  String value="";
			   	  for(int i=0;i<getPerClassPlace.length;i++){
			   		value+="<option >"+getPerClassPlace[i]+"</option>";
			   		
			   	}	
			  
			   	String tureValue="<select  class=form-control id=classroomIfo>"+value+"</select>";
		   		out.println(tureValue);  
	    	   
	    	   
	       }
		
		
		
	} 
	
	
}
