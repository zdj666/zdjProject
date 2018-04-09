package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.impl.GetClassNameServiceImp;
import com.hzyc.registerSystem.tools.SystemLog;

@Controller
public class GetClassName {
	@Autowired
	private GetClassNameServiceImp gcnsi;
	
	@RequestMapping("/getClassName.do")
	@SystemLog(methods="获取课程名",module="课程管理")
	public void getClassName(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String userId =""+((Users)request.getSession().getAttribute("user")).getId();
			List<String> cList=gcnsi.getClassNameService(userId);
			
			for(int i=0;i<cList.size();i++){
				System.out.println("班级信息"+cList.get(i));
			}
			
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String gsonString = gson.toJson(cList);
			out.print(gsonString);
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
}
