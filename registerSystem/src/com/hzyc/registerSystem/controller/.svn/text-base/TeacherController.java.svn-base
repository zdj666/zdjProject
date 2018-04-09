package com.hzyc.registerSystem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.TeacherService;


@Controller
public class TeacherController {

	   @Autowired
	   private TeacherService teacherService;
	   
	   @RequestMapping("/enter.do")
	   public ModelAndView getPasswordByCode(Users u,HttpSession session ){

		   ModelAndView modelAndView = new ModelAndView();
			String password=teacherService.getPasswordByCode(u.getPassword());
		 
			if(password== null || !password.equals(u.getPassword())){
				session.setAttribute("code", u.getCode());
			
				modelAndView.addObject("errorInfo","账号或密码不存在");
				modelAndView.setViewName("teacherMessage.jsp");	
			}else{
				modelAndView.setViewName("error.jsp");	
			}
		     return modelAndView;
		}
	
	  /* private void showPersonal(HttpServletRequest request,   
	            HttpServletResponse response) throws ServletException, IOException{  
	        //找到保存到session中的登录用户  
	         Users u =  (Users) request.getSession().getAttribute("u");  
	        //通过用户id重新查找用户  
	        Users userNow = teacherService.findUserById(u.getUserId());  
	          
	        //加载用户所属部门和角色，解决懒加载的问题  
	        Hibernate.initialize(userNow.getDepartment());  
	        Hibernate.initialize(userNow.getSystemRole());  
	      
	        //保存到request中，转发显示  
	        request.setAttribute("userNow", userNow);  
	        request.getRequestDispatcher("/jsps/user/personal.jsp").forward(request, response);//显示当前用户的个人信息  
	          
	    }  */
}
