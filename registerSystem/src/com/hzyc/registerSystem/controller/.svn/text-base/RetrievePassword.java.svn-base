package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.impl.RetrievePasswordImpl;
import com.hzyc.registerSystem.tools.SystemLog;

/**
 * @author lvgang
 * @description 回密码
 * */

@Controller
public class RetrievePassword {
	
	@Autowired
	private RetrievePasswordImpl rpi; 
	
	@RequestMapping("getUserIfo.do")
	@SystemLog(module="用户信息管理",methods="获取用户信息")
	public void getUserIfo(HttpServletResponse response,HttpServletRequest request){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			
			String userIfo = request.getParameter("userIfo");
			
			System.out.println(userIfo+"用户信息");
			
			userIfo.substring(1,userIfo.length()-1);
			
			System.out.println(userIfo);
			
			String[] ary1 = userIfo.split(",");
			
			//Users us =new Users();
			
			for(int i=0;i<ary1.length;i++){
				String[] ary2 = ary1[i].split(":");
				ary1[i] = ary2[1].substring(1,ary2[1].length()-1);
				System.out.println(ary1[i]+"分解信息"+i);
				
			}
			ary1[4]=ary1[4].substring(0, ary1[4].length()-1);
			System.out.println(ary1[4]);
 			/*
			us.setCode(ary1[0]);
			us.setPassword(ary1[1]);
			us.setQuestion(ary1[3]);
			us.setAnswer(ary1[4]);
			*/
			String returnIfo = "";
			
			Users us =rpi.getUserIfo(ary1[0]);
			if(us==null){
				returnIfo = "用户名验证失败";
			}else{
				if(us.getQuestion().equals(""+ary1[3])&&us.getAnswer().equals(""+ary1[4])){
					updateUserIfo(ary1[0], ary1[1]);
					returnIfo = "密码修改成功";
				}else{
					returnIfo = "密保验证失败";
				}
			}
			
			
			PrintWriter out  = response.getWriter();
			
			out.print(returnIfo);
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updateUserIfo.do")
	@SystemLog(module="用户信息管理",methods="更新用户密码")
	public void updateUserIfo(String username,String password){
		try {
			rpi.updateUserIfo(username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
