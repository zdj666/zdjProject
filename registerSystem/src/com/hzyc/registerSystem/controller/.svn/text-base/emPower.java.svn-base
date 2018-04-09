package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.hzyc.registerSystem.po.Permission;
import com.hzyc.registerSystem.po.Role;
import com.hzyc.registerSystem.po.RolePermission;
import com.hzyc.registerSystem.po.UserRole;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.emPowerService;
import com.hzyc.registerSystem.tools.SystemLog;

@Controller
public class emPower {
		
	@Autowired
	private emPowerService emPowerService;
	
		
	@SystemLog(methods="授权管理",module="启始进入的路口")
	@RequestMapping("/getValue.do")
	public ModelAndView  getValue(HttpServletRequest request){
		   ModelAndView model=new ModelAndView();
			try{
				
				request.setCharacterEncoding("utf-8");
				
					int page=(1-1)*5;
					List<Users> getUpUser=emPowerService.GetupPage(page);
					List<Role> getRole=emPowerService.selectAllRoles();
					request.setAttribute("tiaoValue","1");
					request.setAttribute("getNowPage","1");
					//request.getSession().setAttribute("getPerson",getPerson);
					model.addObject("getPerson",getUpUser);
					model.addObject("getRole",getRole);
					model.setViewName("empower.jsp");
			}catch(Exception e){
				e.printStackTrace();
			}
			return model;
		}
	@SystemLog(methods="授权管理",module="禁用功能")
	@RequestMapping("/UnUsed.do")
	public ModelAndView  UnUsed(String JinFun,String updataId,String getQuan,HttpServletRequest request,HttpServletResponse response){
		   ModelAndView model=new ModelAndView();
			try{
				System.out.println(getQuan+"777777777777777777777");
				int RoleId=emPowerService.ChaIdByName(getQuan);
				int updataIds=Integer.valueOf(updataId);
				RolePermission rolePer=new RolePermission();
				RolePermission DelRolPer=new RolePermission();
				DelRolPer.setRoleId(RoleId);
				DelRolPer.setPermissionId(updataIds);
				int getDelId=emPowerService.selectDelRlePerId(DelRolPer);
				
				List<RolePermission> getRolePer=emPowerService.SeleAllRoleId();
					rolePer.setRoleId(RoleId);
					rolePer.setPermissionId(updataIds);
					boolean Delts=emPowerService.delByPid(rolePer);
					if(Delts){
						RolePermission RolePerm=new RolePermission();
						for(int k=0;k<getRolePer.size();k++){
							int getJudgeId=getRolePer.get(k).getId();
							if(getDelId<getJudgeId){
								int YuanId=getRolePer.get(k).getId();
								int nowId=getRolePer.get(k).getId()-1;
								RolePerm.setNowId(nowId);
								RolePerm.setId(YuanId);
								emPowerService.updateId(RolePerm);
							}
						
						}
					}
					request.setCharacterEncoding("utf-8");
					
					response.setHeader("Content-Type", "text/html; charset=UTF-8");
					PrintWriter writer=response.getWriter();
								writer.print(JinFun);
								writer.flush();
								writer.close();
					
		
					
			}catch(Exception e){
				e.printStackTrace();
			}
			return model;
		}
	@SystemLog(methods="授权管理",module="启用功能")
	@RequestMapping("/Used.do")
	public ModelAndView  Used(String UserFun,String updataId,String getQuan,HttpServletRequest request,HttpServletResponse response){
		   ModelAndView model=new ModelAndView();
			try{
				
				
				request.setCharacterEncoding("utf-8");
				int getMaxId=emPowerService.getMaxId()+1;
				int RoleId=emPowerService.ChaIdByName(getQuan);
				int getFunId=Integer.valueOf(updataId);
				RolePermission RPer=new RolePermission();
				RPer.setPermissionId(getFunId);
				RPer.setRoleId(RoleId);
				RolePermission getSure=emPowerService.JudgePerMissHas(RPer);
				System.out.println(getSure==null);
				if(getSure==null){
				RolePermission RolePerm=new RolePermission();
				RolePerm.setId(getMaxId);
				
				RolePerm.setPermissionId(getFunId);
				RolePerm.setRoleId(RoleId);
				emPowerService.intoRolePer(RolePerm);
				}
				response.setHeader("Content-Type", "text/html; charset=UTF-8");
				PrintWriter writer=response.getWriter();
							writer.print(UserFun);
							writer.flush();
							writer.close();
				
							
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return model;
		}
	
	
	@SystemLog(methods="授权管理",module="全部查询的上一页")
	@RequestMapping("/upPage.do")
	public ModelAndView upPage(String NowPage,HttpServletRequest request){
		   ModelAndView model=new ModelAndView();
			try{
				int pages=Integer.valueOf(NowPage);
				pages=pages-1;
				List<Role> getRole=emPowerService.selectAllRoles();
				request.setAttribute("tiaoValue","1");
				/*获取到总共的users长度*/
				List<Users> PerUser=emPowerService.getUser();
				/*判断这个页面的超过了系统总共的页*/
				if((pages-1)*5>PerUser.size()){
					pages=pages-1;
					request.setAttribute("getNowPage",pages);
				}else{
				request.setAttribute("getNowPage",pages);
				}
				int page=(pages-1)*5;
				List<Users> getUpUser=emPowerService.GetupPage(page);
				request.setAttribute("NowDown","3");
				model.addObject("getPerson",getUpUser);
				model.addObject("getRole",getRole);
				model.setViewName("empower.jsp");
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return model;
		}
		@SystemLog(methods="授权管理",module="全部查询的下一页")
		@RequestMapping("/downPage.do")
		public ModelAndView downPage(String NowPage,HttpServletRequest request){
			   ModelAndView model=new ModelAndView();
				try{
					
					int pages=Integer.valueOf(NowPage);
					pages=pages+1;
					List<Role> getRole=emPowerService.selectAllRoles();
					request.setAttribute("tiaoValue","1");
					/*获取到总共的users长度*/
					List<Users> PerUser=emPowerService.getUser();
					/*判断这个页面的超过了系统总共的页*/
					System.out.println(PerUser+"得到页面的最后那个长度是");
					if((pages-1)*5>PerUser.size()){
						pages=pages-1;
						request.setAttribute("getNowPage",pages);
					}else{
					request.setAttribute("getNowPage",pages);
					}
					int page=(pages-1)*5;
					List<Users> getUpUser=emPowerService.GetupPage(page);
					request.setAttribute("NowDown","3");
					model.addObject("getPerson",getUpUser);
					model.addObject("getRole",getRole);
					model.setViewName("empower.jsp");
					
				}catch(Exception e){
					e.printStackTrace();
				}
				return model;
			}
			
			
		@SystemLog(methods="授权管理",module="按照人查询的上一页")
		@RequestMapping("/upRenPage.do")
		public ModelAndView upRenPage(String NowPage,String getName,HttpServletRequest request){
			   ModelAndView model=new ModelAndView();
				try{
					int pages=Integer.valueOf(NowPage);
					pages=pages-1;
	
					List<Role> getRole=emPowerService.selectAllRoles();
					/*获取到总共的users长度*/
					List<Users> PerUser=emPowerService.getUser();
					/*判断这个页面的超过了系统总共的页*/
					if((pages-1)*5>PerUser.size()){
						pages=pages-1;
						request.setAttribute("getNowPage",pages);
					}else{
					request.setAttribute("getNowPage",pages);
					}
					int page=(pages-1)*5;
					Users user=new Users();
					user.setName(getName);
					user.setPage(page);
					List<Users> getChaPerName=emPowerService.selectUsersByName(user);
					request.setAttribute("tiaoValue","1");
					request.setAttribute("PowerName",getName);
					request.setAttribute("NowDown","1");
					model.addObject("getPerson",getChaPerName);
					model.addObject("getRole",getRole);
					model.setViewName("empower.jsp");
					
				}catch(Exception e){
					e.printStackTrace();
				}
				return model;
			}
			@SystemLog(methods="授权管理",module="按照人查询的下一页")
			@RequestMapping("/downRenPage.do")
			public ModelAndView downRenPage(String NowPage,String getName,HttpServletRequest request){
				   ModelAndView model=new ModelAndView();
					try{
						
						int pages=Integer.valueOf(NowPage);
						pages=pages+1;
					
						List<Role> getRole=emPowerService.selectAllRoles();
						request.setAttribute("tiaoValue","1");
						/*获取到总共的users长度*/
						List<Users> PerUser=emPowerService.getUser();
						/*判断这个页面的超过了系统总共的页*/
						if((pages-1)*5>PerUser.size()){
							pages=pages-1;
							request.setAttribute("getNowPage",pages);
						}else{
						request.setAttribute("getNowPage",pages);
						}
						int page=(pages-1)*5;
						Users user=new Users();
						user.setName(getName);
						user.setPage(page);
						List<Users> getChaPerName=emPowerService.selectUsersByName(user);
						request.setAttribute("PowerName",getName);
						request.setAttribute("NowDown","1");
						model.addObject("getPerson",getChaPerName);
						model.addObject("getRole",getRole);
						model.setViewName("empower.jsp");
					}catch(Exception e){
						e.printStackTrace();
					}
					return model;
				}
			
		@SystemLog(methods="授权管理",module="角色查询的上一页")
		@RequestMapping("/JueUpPage.do")
		public ModelAndView JueUpPage(String NowPage,String PowerName,HttpServletRequest request){
			   ModelAndView model=new ModelAndView();
				try{
					int pages=Integer.valueOf(NowPage);
					pages=pages-1;
					List<Users> getAllOnePow=new ArrayList<Users>();
				 	int PowerId= emPowerService.ChaIdByName(PowerName);
					List<Role> getRole=emPowerService.selectAllRoles();
					List<Users> PerUser=emPowerService.getUser();
					if((pages-1)*5>PerUser.size()){
						pages=pages-1;
						request.setAttribute("getNowPage",pages);
					}else{
					request.setAttribute("getNowPage",pages);
					}
					int page=(pages-1)*5;
				 	UserRole useRol=new UserRole();
				 	useRol.setRoleId(PowerId);
				 	useRol.setPage(page);
					List<Integer> getPerUserId=emPowerService.SeleUseByPower(useRol);
					for(int j=0;j<getPerUserId.size();j++){
						Users getName=emPowerService.getPowerName(getPerUserId.get(j));	
						getAllOnePow.add(j,getName);
						
					}
					request.setAttribute("PowerName",PowerName);
					request.setAttribute("NowDown","2");
					request.setAttribute("tiaoValue","1");
					model.addObject("getPerson",getAllOnePow);
					model.addObject("getRole",getRole);
					model.setViewName("empower.jsp");
					
				}catch(Exception e){
					e.printStackTrace();
				}
				return model;
			}
			@SystemLog(methods="授权管理",module="角色查询的下一页")
			@RequestMapping("/JueDownPage.do")				
			public ModelAndView JueDownPage(String NowPage,String PowerName,HttpServletRequest request){
				   ModelAndView model=new ModelAndView();
					try{
						
						int pages=Integer.valueOf(NowPage);
						pages=pages+1;
					
						
						List<Users> getAllOnePow=new ArrayList<Users>();
						
					
						List<Role> getRole=emPowerService.selectAllRoles();
						/*获取到总共的users长度*/
						List<Users> PerUser=emPowerService.getUser();
						/*判断这个页面的超过了系统总共的页*/
						if((pages-1)*5>PerUser.size()){
							pages=pages-1;
							request.setAttribute("getNowPage",pages);
						}else{
						request.setAttribute("getNowPage",pages);
						}
						int page=(pages-1)*5;
					 	int PowerId= emPowerService.ChaIdByName(PowerName);
					 	UserRole useRol=new UserRole();
					 	useRol.setRoleId(PowerId);
					 	useRol.setPage(page);
						List<Integer> getPerUserId=emPowerService.SeleUseByPower(useRol);
						for(int j=0;j<getPerUserId.size();j++){
							Users getName=emPowerService.getPowerName(getPerUserId.get(j));	
							getAllOnePow.add(j,getName);
							
						}
						request.setAttribute("PowerName",PowerName);
						request.setAttribute("NowDown","2");
						request.setAttribute("tiaoValue","1");
						model.addObject("getPerson",getAllOnePow);
						model.addObject("getRole",getRole);
						model.setViewName("empower.jsp");
						
					}catch(Exception e){
						e.printStackTrace();
					}
					return model;
				}	
		
			@SystemLog(methods="授权管理",module="查询权限(角色)")
			@RequestMapping("/SelPowerByName.do")
				public ModelAndView PowerName(HttpServletRequest request){
			           ModelAndView model=new ModelAndView();
					try{
						String PowerName= new String(request.getParameter("PowerName").getBytes("ISO-8859-1"),"utf-8"); 
						List<Users> getAllOnePow=new ArrayList<Users>();
					
					 	int PowerId= emPowerService.ChaIdByName(PowerName);
					 	UserRole useRol=new UserRole();
					 	useRol.setRoleId(PowerId);
					 	useRol.setPage(0);
						List<Integer> getPerUserId=emPowerService.SeleUseByPower(useRol);
						for(int j=0;j<getPerUserId.size();j++){
							Users getName=emPowerService.getPowerName(getPerUserId.get(j));	
							getAllOnePow.add(j,getName);
							
						}
						List<Role> getRole=emPowerService.selectAllRoles();
						request.setAttribute("tiaoValue","1");
						request.setAttribute("PowerName",PowerName);
						request.setAttribute("NowDown","2");
						request.setAttribute("getNowPage",1);
						model.addObject("getRole",getRole);
						model.addObject("getPerson",getAllOnePow);
						model.setViewName("empower.jsp");
						}catch(Exception e){
							e.printStackTrace();
						}
						
						return model;
				}
				
			@SystemLog(methods="授权管理",module="查询通过姓名")
			@RequestMapping("/SeleByName.do")
			public ModelAndView SeleByName(HttpServletRequest request){
			       ModelAndView model=new ModelAndView();
					try{
						
						String Name = new String(request.getParameter("Name").getBytes("ISO-8859-1"),"utf-8"); 
						Users user=new Users();
						user.setName(Name);
						user.setPage(0);
					List<Users> getChaPerName=emPowerService.selectUsersByName(user);
					List<Role> getRole=emPowerService.selectAllRoles();
					request.setAttribute("tiaoValue","1");
					request.setAttribute("PowerName",Name);
					request.setAttribute("getNowPage",1);
					request.setAttribute("NowDown","1");
					model.addObject("getRole",getRole);
					model.addObject("getPerson",getChaPerName);
					model.setViewName("empower.jsp");
					}catch(Exception e){
						e.printStackTrace();
					}
					
					return model;
				}
					
			
		
	
	
		@SystemLog(methods="授权管理",module="给固定的角色对应的权限功能")
		@RequestMapping("/getFunction.do")
		public ModelAndView  getFunction(HttpServletRequest request){
			   ModelAndView model=new ModelAndView();
				try{
					request.setCharacterEncoding("utf-8");
					String getcode = new String(request.getParameter("NameCodele"));
					String PowerVal = new String(request.getParameter("PowerVal")); 
					String AllVals = new String(request.getParameter("AllVals")); 
					String page = new String(request.getParameter("page")); 
					int getPoeId=emPowerService.ChaIdByName(PowerVal);
					int getUserId=emPowerService.seleIdByName(getcode);
					UserRole userRole=new UserRole();
					userRole.setRoleId(getPoeId);
					userRole.setUserId(getUserId);
					emPowerService.ChangeIdByUseId(userRole);
					int getPage=Integer.valueOf(page);
					int pages=(getPage-1)*5;
					List<Users> getPerson=emPowerService.GetupPage(pages);
					List<Role> getRole=emPowerService.selectAllRoles();
					request.setAttribute("getNowPage",getPage);
					request.setAttribute("tiaoValue","3");
					request.setAttribute("NameValue",AllVals);
					request.setAttribute("ItemValue",PowerVal);	
					List<Permission> getFun=emPowerService.chaAllFunHasPer();
					for(int j=0;j<getFun.size();j++){
						int k=j+1;
						String ks=String.valueOf(k);
						getFun.get(j).setLineId(ks);
						
					}
					model.addObject("getFun",getFun);
					model.addObject("getPerson",getPerson);
					model.addObject("getRole",getRole);
					
		
					List<Permission> getFunction=emPowerService.chaAllFunHasPer();
				
					List<String> getSectFunction=emPowerService.chaSecFunByRole(getPoeId);
					
					String getFunctinValue="";
				
					for(int i=0;i<getFunction.size();i++){
						for(int j=0;j<getSectFunction.size();j++){
						
							int getPerSecFun=Integer.parseInt(getSectFunction.get(j));
							if(getPerSecFun==getFunction.get(i).getId()){
								getFunctinValue+=","+getFunction.get(i).getMenuBar();
								continue;
							}
						}
					}	
					int functionSize=getFunction.size();
					request.setAttribute("getFunctinValue",getFunctinValue);
					request.setAttribute("functionSize",functionSize);
					
					
						model.setViewName("empower.jsp");
						
					
				}catch(Exception e){
					e.printStackTrace();
				}
				return model;
			}
			
		@SystemLog(methods="授权管理",module="通过Id查询对应的角色")
		@RequestMapping("/SeleRole.do")
		public ModelAndView SeleRoleById(HttpServletRequest request,HttpServletResponse response){
		       ModelAndView model=new ModelAndView();
				try{
					
					int getId=Integer.valueOf(request.getParameter("UserId"));
					String getUser=emPowerService.JudgeUserHas(getId);
					int role_id=Integer.valueOf(getUser);
					String getRoleName=emPowerService.getRoleName(role_id);
					response.setHeader("Content-Type", "text/html; charset=UTF-8");
					PrintWriter writer=response.getWriter();
								writer.print(getRoleName);
								writer.flush();
								writer.close();
			
				
				}catch(Exception e){
					e.printStackTrace();
				}
				
				return model;
			}
		
}
