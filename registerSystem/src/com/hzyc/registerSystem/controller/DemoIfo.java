package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hzyc.registerSystem.po.Users;

/**
 * @author lvgang
 * @start 2017/11/14
 * @description 获取主页面的相关信息 
 * */

@Controller
public class DemoIfo {
	
	@RequestMapping("/getDemoIfo.do")
	public void demoIfo(HttpServletRequest request,HttpServletResponse response){
		try {
			
			request.setCharacterEncoding("UTF-8");
			
			Users us =(Users)request.getAttribute("user");
			System.out.println("-------------------");
			System.out.println(us.getName()+"---------------------------");
			System.out.println("------------------");
			
			PrintWriter out = response.getWriter();
			//判断获取的是否为空	
			String gsonString = "null";
			if(us!=null){

				Gson gson = new Gson();
				
				gsonString = gson.toJson(us);
				
				System.out.println("Session中的信息"+gsonString);
				
			}
			out.print(gsonString);
			out.flush();
			out.close();

			out.print(gsonString);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
}
