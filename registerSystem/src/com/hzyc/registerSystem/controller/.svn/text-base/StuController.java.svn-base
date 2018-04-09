package com.hzyc.registerSystem.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.po.SelectSigning;
import com.hzyc.registerSystem.po.Signing;
import com.hzyc.registerSystem.po.UserRole;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.StuService;
import com.hzyc.registerSystem.services.emPowerService;
import com.hzyc.registerSystem.tools.LOCALMAC;

@Controller
public class StuController {
	@Autowired
	StuService  stuService;
	@Autowired
	emPowerService emPowerService;
	
	@RequestMapping("/stuRegister.do")
	public String insertByuser(HttpServletRequest request,Users users, MultipartFile caseImage,HttpSession session){
	try {
		//图片处理
	byte[] picFile=caseImage.getBytes();
	users.setPicture(picFile); 
		//获取图片名称
	    String picNameCode=users.getCode();
		String pictureName = picNameCode+caseImage.getOriginalFilename();
		//////System.out.println("上传文件的图片名："+pictureName);	
		String tomcatPath = session.getServletContext().getRealPath("/photo");
		//////System.out.println(tomcatPath);
		String finalPath = tomcatPath+"\\" + pictureName;
		//////System.out.println("图片路径"+finalPath);
		//将图片名赋值到对象上添加到数据库中
		users.setPictureName(pictureName);
		//将图片写到服务器上。
		File target = new File(finalPath);
		caseImage.transferTo(target);
				
	    LOCALMAC getMAc=new	LOCALMAC();
	    String clientIp = getMAc.getClientIp(request);
	   ////System.out.println(clientIp+"·1111111111111111111111111");
		String mac=getMAc.getMac(clientIp);
		users.setMac(mac);
		//////System.out.println("这里是我要获取的mac地址："+macAddress);
		boolean result=stuService.insert(users);
		//result=true添加成功,回到index.jsp,否则回到注册页面
		if(result){
			request.setAttribute("sucess", "注册成功");
			request.setAttribute("url", "login.jsp");
			return "register_clue.jsp";
			
		}else{
			request.setAttribute("sucess", "注册失败");
			request.setAttribute("url", "stuRegister.jsp");
			return "register_clue.jsp";
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		return "stuRegister.jsp";	
	}
	
	//return "login.jsp";
		
	}
	
	//查询学生个人所有信息
	@RequestMapping("/selectByCode.do")
	public 	ModelAndView  selectByCode(String code,HttpServletRequest request,Users users){
		    //String codeValue=session.getAttribute("code").toString();
		Users u = (Users) request.getSession().getAttribute("user");
		
		//////System.out.println("----------->"+u.getCode());
			Users stuUsersInfo=stuService.selectByCode(u.getCode());
		
			ModelAndView modelAndView=new ModelAndView();
			////System.out.println(u.getId()+"这个Id是什么呢");
			String getPower=emPowerService.JudgeUserHas(u.getId());
			////System.out.println(getPower+"这里面有哦你关系？？？？？？？？？？？？？？？？？？？？？？？？");
			request.setAttribute("getSureShow",getPower);
			request.getSession().setAttribute("role",getPower);
			modelAndView.addObject("stuUsersInfo", stuUsersInfo);
			modelAndView.setViewName("stuInfoManager.jsp");
			return modelAndView;	
			}
	
	@RequestMapping("/insert_class.do")
	public ModelAndView insert_class(HttpServletRequest request){
		ModelAndView Model=new ModelAndView();
		try{
			Users u = (Users) request.getSession().getAttribute("user");
			request.setAttribute("UserCode",u.getId());
			Model.setViewName("insert_class.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return Model;
	}
	
	
	//查询学生个人所有信息
	@RequestMapping("/selectCode.do")
	public 	ModelAndView  selectCode(HttpServletRequest request){
			Users u = (Users) request.getSession().getAttribute("user");
			Users stuUsersInfo=stuService.selectByCode(u.getCode());
			////System.out.println("------------>"+u.getCode());
			////System.out.println(u.getId()+"这个Id是什么呢");
			String getPower=emPowerService.JudgeUserHas(u.getId());
		//////System.out.println(u.getPictureName()+"---------------");
			request.setAttribute("getSureShow",getPower);
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject("stuUsersInfo", stuUsersInfo);
			modelAndView.setViewName("stuInfoSignning.jsp");
			return modelAndView;	
			}
	//修改学生信息
	@RequestMapping("/updateStuInfo.do")
	public String updateByPrimaryKeySelective( Users users,MultipartFile caseImage,HttpSession session,HttpServletRequest request){
		try {
			byte[] picFile= null;
			picFile=caseImage.getBytes();
			if(caseImage.getOriginalFilename().equals("")){
				Users us = 	(Users)request.getSession().getAttribute("user");
				picFile = us.getPicture();
			}else{
				picFile=caseImage.getBytes();
			}
			////System.out.println(caseImage.getOriginalFilename()+"-------------------------");
			users.setPicture(picFile); 
			 String picNameCode=users.getCode();
				String pictureName = picNameCode+caseImage.getOriginalFilename();
				//////System.out.println("上传文件的图片名："+pictureName);	
				String tomcatPath = session.getServletContext().getRealPath("/photo");
				Users u = (Users)request.getSession().getAttribute("user");
				String finalPath = tomcatPath+"\\" + u.getPictureName();
				//////System.out.println("图片路径"+finalPath);
				//将图片名赋值到对象上添加到数据库中
				File file1 = new File(finalPath);
				////System.out.println(finalPath);
				file1.delete();
				users.setPictureName(pictureName);
				
			stuService.updateByPrimaryKeySelective(users);
			request.getSession().invalidate();
			request.getSession().setAttribute("user",users);
			request.getSession().setAttribute("username", users.getCode());
			String imgName = users.getPictureName();
			String realPath = request.getSession().getServletContext().getRealPath("/");    
			//////System.out.println(realPath+"====");
			String filename = realPath + "photo/" + imgName;
			File file = new File(filename);
			if(file.exists()){
				//服务器存在该图片 不处理
			}else{
				//将数据库图片放到服务器中
				byte[] img = users.getPicture();
				FileOutputStream fos = null;
				try {
					fos =  new FileOutputStream(filename);
					fos.write(img);
					////System.out.println("写入....");
				} catch ( Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					if(fos != null){
						fos.close();
					}
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "selectByCode.do";
	
	}
	
	//deleteById删除信息通过Id
	@RequestMapping("/deleteStuInfo.do")
	public String deleteById(String id){
		stuService.deleteById(id);
		return "login.jsp";
	
	}
	
	//查询课表判断是否迟到selectReal_Schedule.do
	@RequestMapping("/selectReal_Schedule.do")
	public void selectTimeByDate(RealSchedule realSchedule,HttpServletResponse response,HttpServletRequest  request){
			  String date= request.getParameter("date");
			  //String classroom= request.getParameter("classroom");
			  //realSchedule.setClassroom(classroom);
			  //根据班级ID查询时间
			 Users u = (Users) request.getSession().getAttribute("user");
			 String gradeId=request.getSession().getAttribute("gradeId").toString();
			 realSchedule.setGradeId(gradeId);
			  //////System.out.println("----------班级-----"+u.getClassId());
			  realSchedule.setDate(date);
		try {
			String selectTime=stuService.selectTimeByDate(realSchedule);
			//////System.out.println("--------查到的时间------"+selectTime);
			response.setCharacterEncoding("utf-8");
			//以流的形式返回值
			PrintWriter writer=response.getWriter();
			writer.print(selectTime);
			writer.flush();
			writer.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	//根据班号查询grade得到grade_id    SELECT id FROM grade WHERE class_id='腾飞2期';
	//语句在SignningMapper
	@RequestMapping("/selectGradeId.do")
	public ModelAndView selectGradeId(String classId,HttpServletRequest  request){
		Users u = (Users) request.getSession().getAttribute("user");
		classId=u.getClassId();
		String gradeId=stuService.selectGradeId(classId);
		request.getSession().setAttribute("gradeId", gradeId);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("newSignning.jsp");
		//modelAndView.setViewName("signTest.jsp");
		 return modelAndView;		
	}
	                                    
	                                    
	//签到添加状态到数据库签到表
	@RequestMapping("/insertSignning.do")
	public String insertSignning( Signing signing,HttpServletRequest request){
		//////System.out.println("-------------提交表单成功-----------");
		Users u = (Users) request.getSession().getAttribute("user");
		//////System.out.println("----userid------->"+u.getId());
		signing.setUserId(u.getId());
		String sates=signing.getState().toString();
		String info="";
		if(sates.equals("1")){
		 info="恭喜你！准时签到";
		}else{
		info="您已迟到！下次早点";	
		}
		/*System.out.println("-----------状态-----"+sates);*/
		//////System.out.println(signing.getState());
		try {
			boolean result=stuService.insertSigning(signing);
			if(result){
				request.setAttribute("sucess", "签到成功！"+info);
				request.setAttribute("url", "newSignning.jsp");
				return "register_clue.jsp";
				/*return "newSignning.jsp";*/
				
			}else{
				
				request.setAttribute("sucess", "签到失败");
				request.setAttribute("url", "newSignning.jsp");
				return "register_clue.jsp";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "newSignning.jsp";
		
	}
	
	//查询身份证号是否存在
	@RequestMapping("/selectIdNumber.do")
	public void selectIdNumber(String idNumber,HttpServletResponse response,HttpServletRequest  request){
	try {
		String result="";
		response.setCharacterEncoding("utf-8");
		String selectResult=stuService.selectIdNumber(idNumber);
		if(selectResult!=null){
			result="NO";	
		}else{
			result="YES";
		}
		
		//以流的形式返回值
		PrintWriter writer=response.getWriter();
		writer.print(result);
		writer.flush();
		writer.close();	
	} catch (Exception e) {
		e.printStackTrace();
	}

}
	
//查询个人签到情况
	@RequestMapping("/selectAction.do")
	public ModelAndView	selectState(SelectSigning selectSigning,HttpServletRequest request){
		//--------------------------------
		//Date类:可以获取当前的系统时间
		Date d = new Date();
		//////System.out.println("系统时间的时间---------->"+d);
		//格式化时间:2017-05-18 19:33:00
		//简单日期格式化工具类:括号里指定需要的格式
		//MM表示月份，mm表示分钟，HH表示24小时制，hh表示12小时制
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String endDate = sdf.format(d);
		//////System.out.println("转换时间的时间yyyy-MM-dd---------->"+endDate);
		
		//2017年05月18日，计算53天之后的是几月几号。
		//原理：将当前的时间化为毫秒数，计算53天的毫秒数，相加，之后转化为日期
		//1000毫秒 = 1秒
		//格林威治时间：以1970年0点为开始到现在的时间的毫秒差。
		long dmMinutes = d.getTime();
		//////System.out.println("系统时间的时间---------->+dmMinutes:"+dmMinutes);
		long after = 30 * 24 * 60 * 60 * 1000L;
		//////System.out.println("系统时间之后的时间---------->"+after);
		long sum = dmMinutes - after;
		
		//把毫秒数转化为Date类，直接将参数写到()内
		Date later = new Date(sum);
		//////System.out.println("最后的时间---------->"+later);
		String startDate = sdf.format(later);
		//////System.out.println("最后转化的时间---------->"+startDate);
		//-----------------------------
		Users u = (Users) request.getSession().getAttribute("user");
		selectSigning.setUserId(u.getId().toString());
		selectSigning.setStartDate(startDate);
		selectSigning.setEndDate(endDate);
		//////System.out.println("----aaaauserid------->"+selectSigning.getUserId());
		List<Signing> signingState=stuService.selectState(selectSigning);
		int inTimeCount=0;
		int noTimeCount=0;
		int leave=0;
		for(int i=0;i<signingState.size();i++){
			Signing signingValue=signingState.get(i);
			String state=signingValue.getState().toString();
			if(state.equals("1")){
				inTimeCount++;	
			}else if(state.equals("2")){
				noTimeCount++;
			}else{
				leave++;
				
			}
			
		}
	
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("signingState", signingState);
		modelAndView.addObject("inTimeCount",inTimeCount);
		modelAndView.addObject("noTimeCount",noTimeCount);
		modelAndView.addObject("leave",leave);
		modelAndView.setViewName("stuState.jsp");
		//modelAndView.setViewName("newStuSate.jsp");
		return modelAndView;
		
	}
	//判断是否已经签到在Singnning中----------
	@RequestMapping("/selectStateById.do")
	public void	selectStateById(Signing signing,HttpServletResponse response,HttpServletRequest  request){
		try {
			Users u = (Users) request.getSession().getAttribute("user");
			////System.out.println("----需要签到人的Id-----"+u.getId());
			////System.out.println("----日期----"+signing.getSignData());
			signing.setUserId(u.getId());
			String result="";
			response.setCharacterEncoding("utf-8");
			String selectResult=stuService.selectStateById(signing);
			////System.out.println("----查出来的数据状态-----"+selectResult);
			if(selectResult!=null){
				result="NO";	
			}else{
				result="YES";
			}
			
			//以流的形式返回值
			PrintWriter writer=response.getWriter();
			writer.print(result);
			writer.flush();
			writer.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//全查签到表日期
	@RequestMapping("/selectSignningAll.do")
	public void selectSignDateById(HttpServletResponse response,HttpServletRequest  request){
			 Users u = (Users) request.getSession().getAttribute("user");
			 String userId=u.getId().toString();
			 ////System.out.println("-------修改颜色的userId--------"+userId);
		try {
			List<String> selectDate=stuService.selectSignDateById(userId);
			for(int i=0;i<selectDate.size();i++){	
				String dd[]=selectDate.get(i).split("-");
				for(int j=0;j<dd.length;j++){
					
						//月1-9,天不是1-9
					if((dd[1].startsWith("0"))&&(!(dd[2].startsWith("0")))){
						
						String aa=dd[0]+"-"+dd[1].substring(1)+"-"+dd[2];
						selectDate.set(i,aa);
						//月不是1-9,天1-9
					}else if((!(dd[1].startsWith("0")))&&(dd[2].startsWith("0"))){
						String aa=dd[0]+"-"+dd[1]+"-"+dd[2].substring(1);
						selectDate.set(i,aa);
						//月1-9,天1-9
					}else if((dd[1].startsWith("0"))&&(dd[2].startsWith("0"))){
						String aa=dd[0]+"-"+dd[1].substring(1)+"-"+dd[2].substring(1);
						selectDate.set(i,aa);
					}else{
						String aa=dd[0]+"-"+dd[1]+"-"+dd[2];
						selectDate.set(i,aa);
					}
					
				}
				//System.out.println("aaaaaaa---------"+selectDate.get(i));
			
			}
			//System.out.println("--------修改颜色的查到的日期------"+selectDate);
			response.setCharacterEncoding("utf-8");
			//以流的形式返回值
			PrintWriter writer=response.getWriter();
			
			Gson gson = new Gson();
			String gsonString = gson.toJson(selectDate);
			//System.out.println("----------修改颜色的查到的日期转化json-----"+gsonString+"json");
			writer.print(gsonString);
			writer.flush();
			writer.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
