package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hzyc.registerSystem.po.Log;
import com.hzyc.registerSystem.services.impl.InitServiceImp;
import com.hzyc.registerSystem.tools.BeanUtil;
import com.hzyc.registerSystem.tools.LogAopAction;
import com.hzyc.registerSystem.tools.SystemLog;

@Controller
public class LogIfoController {
	
	
	
	
	@RequestMapping("getLogAllIfo.do")
	@SystemLog(module="日志管理",methods="获取所有日志信息")
	public void getLogAllIfo(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			LogAopAction laa = (LogAopAction)BeanUtil.getBean("logAop");
			
			List<Log> lList = laa.getInitServiceImp().getLogIfo();
			/*
			for(int i=0;i<lList.size();i++){
				
				System.out.println("controller日志信息"+lList);
			}
			*/
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String gSonString  =gson.toJson(lList);
			
			out.print(gSonString);
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/deleteLogSomeIfo.do")
	@SystemLog(module="日志管理",methods="删除选中日志信息")
	public void deleteLogSomeIfo(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			String index=request.getParameter("index");
			System.out.println(index);
			String[] iAry = index.split("-");
			
			LogAopAction laa = (LogAopAction)BeanUtil.getBean("logAop");
			
			for(int i=1;i<iAry.length;i++){
				int id = Integer.parseInt(iAry[i]);
				
				System.out.println("日志Id"+id);
				
				laa.getInitServiceImp().delLogIfo(id);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
