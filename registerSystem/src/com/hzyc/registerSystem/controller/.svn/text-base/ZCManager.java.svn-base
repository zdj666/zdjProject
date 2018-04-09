package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.registerSystem.po.Users;

import com.hzyc.registerSystem.services.ZCManagerService;




@Controller
public class ZCManager {
	@Autowired
	private ZCManagerService ZCManagerService;
	
	
	//springMVC自带一个上传文件的解析器/工具类。
	@RequestMapping("ZCManager.do")
	public String resgisterUser(String getValue,String value,String getTestPass,HttpServletRequest request,HttpServletResponse response){
		ModelAndView model=new ModelAndView();
		
		try{
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			int values=Integer.valueOf(value);
			switch(values){
			
			case 1:
				List<Users> HaveUser=ZCManagerService.UserHave(getValue);
				if(HaveUser.isEmpty()){
					PrintWriter writer=response.getWriter();
					writer.print("1");
					
					writer.flush();
					writer.close();
					
				}else{
				response.setHeader("Content-Type", "text/html; charset=UTF-8");
				PrintWriter writer=response.getWriter();
							writer.print("right");
							writer.flush();
							writer.close();
					}
				break;
			case 2:
				response.setHeader("Content-Type", "text/html; charset=UTF-8");
				PrintWriter writer=response.getWriter();
				writer.print("2");
				writer.flush();
				writer.close();
				break;
			case 3:
				System.out.println("来到了3333");
				response.setHeader("Content-Type", "text/html; charset=UTF-8");
						writer=response.getWriter();
				writer.print("3");
				writer.flush();
				writer.close();
				break;
			case 4:
				response.setHeader("Content-Type", "text/html; charset=UTF-8");
							writer=response.getWriter();
				writer.print("4");
				writer.flush();
				writer.close();
				break;
			case 5:
				System.out.println(getValue);
				response.setHeader("Content-Type", "text/html; charset=UTF-8");
							writer=response.getWriter();
				writer.print("5");
				writer.flush();
				writer.close();
				break;
			}
			
		
			}catch(Exception e){
				e.printStackTrace();
			}
			model.setViewName("ZCManager.jsp");
		return "";
		
	}
	
	
}
