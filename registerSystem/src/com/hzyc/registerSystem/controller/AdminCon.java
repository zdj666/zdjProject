package com.hzyc.registerSystem.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.hzyc.registerSystem.po.Permission;
import com.hzyc.registerSystem.po.UserRole;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.AdminService;
import com.hzyc.registerSystem.tools.LOCALMAC;


/**
 * @author 马荣福 
 * 管理员的controllers
 * 
 */
@Controller
public class AdminCon {
	
	
	@Autowired
	AdminService as;
	
	//判断登录是否成功
	@RequestMapping("/login.do")
	public void selectUser(HttpServletRequest request,HttpServletResponse response){
		
		try{
			
			boolean trueUer=false;//判断登录用户是否正确
			response.setHeader("Content-Type", "text/html; charset=UTF-8");//设置发送内容
			PrintWriter out = response.getWriter();
			
			Users u = new Users();
			String code = request.getParameter("code");
			String password = request.getParameter("password");
			System.out.println(""+code+""+password);
			u.setCode(code);
			u.setPassword(password);
			Users user = as.login(u);
			
			if(user!=null&&user.getPassword().equals(password)){
				request.getSession().setAttribute("username", user.getCode());
				request.getSession().setAttribute("user", user);
				//查询用户对应的权限
				String role = as.selRoleByUserId(user.getId());
				//把权限放在session里面
				request.getSession().setAttribute("role", role);
				String imgName = user.getPictureName();
				String realPath = request.getSession().getServletContext().getRealPath("/");    
				System.out.println(realPath+"====");
				String filename = realPath + "photo/" + imgName;
				File file = new File(filename);
				if(file.exists()){
					//服务器存在该图片 不处理
				}else{
					//将数据库图片放到服务器中
					byte[] img = user.getPicture();
					FileOutputStream fos = null;
					try {
						fos =  new FileOutputStream(filename);
						fos.write(img);
						System.out.println("写入....");
					} catch ( Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally{
						if(fos != null){
							fos.close();
						}
					}
				}
				trueUer=true;//返回为真
			}else{
				trueUer=false;
			}
			
			out.print(trueUer);//输出数据到目标页面
			out.flush();//刷新
			out.close();//关闭资源
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	@RequestMapping("sureUser.do")
	public String login(HttpServletRequest request) throws Exception{
		Users user = (Users)request.getSession().getAttribute("user");
		if(user !=null){
			List<Permission> pList = user.getpList();
			
			if(user.getMac()==null || user.getMac().equals("")){
				request.setAttribute("pList",pList);
				request.setAttribute("user",user);
				return "index.jsp";
			}else{
				LOCALMAC getMAc = new LOCALMAC();
			    String clientIp = getMAc.getClientIp(request);
				String mac=getMAc.getMac(clientIp);
				System.out.println(mac+"----------------");
			if(user.getMac().equalsIgnoreCase(mac)){
				request.setAttribute("pList",pList);
				request.setAttribute("user",user);
				return "index.jsp";
			}else{
				request.setAttribute("sucess", "mac地址错误");
				request.setAttribute("url", "login.jsp");
				return "register_clue.jsp";
			}
		}
				
		}else{
			
		}
		request.setAttribute("sucess", "mac地址错误");
		request.setAttribute("url", "login.jsp");
		return "register_clue.jsp";
	}
	
	@RequestMapping("destorySessionclue.do")
	public String destorySessionclue(HttpServletRequest request){
		request.setAttribute("sucess", "确定注销登录吗？");
		request.setAttribute("url", "destorySession.do");
		request.setAttribute("cancel", "sureUser.do");
		return "register_clue1.jsp";
	}
	
	@RequestMapping("destorySession.do")
	public String destorySession(HttpServletRequest request){
		request.getSession().invalidate();
		return "login.jsp";
	}
	
	@RequestMapping("register.do")
	public String register(Users u,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String role = request.getParameter("role");
		String code = request.getParameter("code");
		String password = request.getParameter("password");
		String mac = request.getParameter("mac");
		u.setCode(code);
		u.setPassword(password);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String date = df.format(new Date());
		u.setRegisterTime(date);
		if(mac!=null && !mac.equals("")){
			u.setMac(mac);
		}else{	
		}
		if(role !=null && role.equals("3")){
			u.setClassId("项目组");
		}
		String url = request.getHeader("Referer");
		//要跳转的界面
		String uri = url.substring(url.lastIndexOf("/")+1);
		System.out.println("---");
		int flag = as.register(u);
		if(flag !=0){
			Users afterUser = as.selUserId(u.getCode());
			UserRole ur = new UserRole();
			ur.setRoleId(Integer.parseInt(role));
			ur.setUserId(afterUser.getId());
			//插入用户角色表
			int sucess = as.insertUserRole(ur);
			if(sucess !=0){
				request.setAttribute("sucess", "添加员工成功");
				if(uri.equals("registerEmployees.do")){
					request.setAttribute("url", "register_top.jsp");
				}else{
					request.setAttribute("url", "");
				}
				return "register_clue.jsp";
			}else{
				request.setAttribute("sucess", "添加员工失败");
				request.setAttribute("url", uri);
				return "register_clue.jsp";
			}
		}else{
			request.setAttribute("sucess", "添加员工失败");
			request.setAttribute("url", uri);
			return "register_clue.jsp";
		}
	}
	@RequestMapping("student_check.do")
	public ModelAndView studentCheck(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String code = (String)request.getSession().getAttribute("username");
		List<Users> uList = as.selStudentNoRegister(code);
		mav.addObject("uList",uList);
		mav.addObject("isFirst","1");
		mav.setViewName("student_check.jsp");
		return mav;
	}
	
	@RequestMapping("student_checkForSel.do")
	public ModelAndView studentCheckForSel(HttpServletRequest request,Users u) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		
		Users nowLoginUser = (Users) request.getSession().getAttribute("user");
		u.setId(nowLoginUser.getId());
		List<Users> uList = as.studentCheckForSel(u);
		System.out.println("uList的大小：" +uList.size());
		mav.addObject("uList",uList);
		mav.setViewName("student_check_frame.jsp");
		mav.addObject("isFirst","0");
		
		return mav;
	}
	@RequestMapping("accept.do")
	public String accept(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		//同意了审核，向user_role 表里面插入数据
		UserRole ur = new UserRole();
		ur.setUserId(Integer.parseInt(id));
		ur.setRoleId(2);
		System.out.println(ur.getId());
		//1，要向user_role里面插入数据 2，更给数据库里面remark的状态为1
		int sucess1 = as.updateRemark(Integer.parseInt(id));
		int sucess = as.insertUserRole(ur);
		
		if(sucess != 0 && sucess1 !=0){
			request.setAttribute("sucess", "审核成功");
			request.setAttribute("url", "student_check.do");
			return "register_clue.jsp";
		}else{
			//审核失败
			request.setAttribute("sucess", "审核失败");
			request.setAttribute("url", "student_check.do");
			return "register_clue.jsp";
		}
		
	}
	
	@RequestMapping("deny.do")
	public String deny(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		//拒绝了学员，从用户表里删除这个学员
		int sucess = as.delUser(Integer.parseInt(id));
		if(sucess != 0){
			//审核失败
			request.setAttribute("sucess", "删除成功");
			request.setAttribute("url", "student_check.do");
			return "register_clue.jsp";
		}else{
			
		}
		//审核失败
		request.setAttribute("sucess", "删除失败");
		request.setAttribute("url", "student_check.do");
		return "register_clue.jsp";
	}
	
	@RequestMapping("/ajaxUser.do")
	public void ajaxUser(HttpServletRequest request,HttpServletResponse response){
		
		try {
			Date date = new Date();
			int year = date.getYear()-100+2000;
			
			List<Users> list = as.selBoth();
			int id = list.get(0).getId();
			String username = id+1+""+year;
			//使用流的方式将信息返回给页面
			response.setCharacterEncoding("utf-8");
			PrintWriter writer = response.getWriter();
			writer.print(username);
			
			//强制刷新和关闭
			writer.flush();
			writer.close();
			
			//List<Map<String,String>> rsList = null;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	/**
	 * 查询员工
	 * @return
	 */
	@RequestMapping("selEmployees.do")
	public String selEmployees(HttpServletRequest request,String name,String remark){
		Users u = new Users();
		u.setName(name);
		u.setRemark(remark);
		//查询员工的方法
		List<Users> uList = as.selEmployees(u);
		request.setAttribute("uList",uList);
		return "register_bottom.jsp";
	}
	@RequestMapping("delEmployeesclue.do")
	public String delEmployeesclue(HttpServletRequest request){
		int id = (Integer.parseInt(request.getParameter("id")));
		request.setAttribute("sucess", "确定删除员工吗？");
		request.setAttribute("url", "delEmployees.do?id="+id);
		request.setAttribute("cancel", "selEmployees.do");
		return "register_clue1.jsp";
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping("delEmployees.do")
	public String delEmployees(HttpServletRequest request){
		int id = (Integer.parseInt(request.getParameter("id")));
		//删除员工的方法
		int sucess = as.delUser(id);
		int sucess1 = as.delUserRole(id);
		if(sucess+sucess1 !=0){
			request.setAttribute("sucess", "员工已成功删除");  
			request.setAttribute("url", "selEmployees.do");
			return "register_clue.jsp";
		}else{
			request.setAttribute("sucess", "员工删除失败");
			request.setAttribute("url", "selEmployees.do");
			return "register_clue.jsp";
		}
		
	}
	
	@RequestMapping("registerEmployees.do")
	public String registerEmployees(HttpServletRequest request){
		//弹出注册员工的界面
		return "register_employees_new.jsp";
	}
}
