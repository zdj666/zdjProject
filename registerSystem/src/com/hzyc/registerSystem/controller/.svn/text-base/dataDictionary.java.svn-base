package com.hzyc.registerSystem.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.registerSystem.po.Dictionary;
import com.hzyc.registerSystem.po.Role;
import com.hzyc.registerSystem.services.ChangeDictionaryService;
import com.hzyc.registerSystem.tools.Dict;
import com.hzyc.registerSystem.tools.DictTag;
import com.hzyc.registerSystem.tools.SystemLog;
@Controller
public class dataDictionary {
		
	@Autowired
	private ChangeDictionaryService ChangeDictionaryService;
	
	@SystemLog(methods="字典管理",module="显示全部值")
	@RequestMapping("/showAll.do")
	public ModelAndView showAllValue(HttpServletRequest request){
		   ModelAndView model=new ModelAndView();
			try{
				
				List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
				List<Dictionary> getAllPerDic=ChangeDictionaryService.getAllDictionary(0);
				for(int i=0;i<getAllPerDic.size();i++){
					int k=i+1;
					String is=String.valueOf(k);
					getAllPerDic.get(i).setShunXuId(is);
				}
				request.setAttribute("pageSize",getAllPerDic.size());
				request.setAttribute("getNowPage",1);
				model.addObject("getAllPerDic",getAllPerDic);
				model.addObject("getPerDic",getPerDic);
				model.setViewName("ShowDictionary.jsp");
			}catch(Exception e){
				e.printStackTrace();
				
			}
			
			return model;
		}
	@SystemLog(methods="字典管理",module="全部值的上一页")
	@RequestMapping("/upPageDic.do")
	public ModelAndView upPageDic(String NowPage,HttpServletRequest request){
		   ModelAndView model=new ModelAndView();
			try{
				int pages=Integer.valueOf(NowPage);
				pages=pages-1;
				int page=(pages-1)*8;
				List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
				List<Dictionary> getAllPerDic=ChangeDictionaryService.getAllDictionary(page);
				for(int i=0;i<getAllPerDic.size();i++){
					int k=i+1;
					String is=String.valueOf(k);
					getAllPerDic.get(i).setShunXuId(is);
				}
				 
				 request.setAttribute("pageSize",getAllPerDic.size());
				request.setAttribute("getNowPage",pages);
				model.addObject("getPerDic",getPerDic);
				model.addObject("getAllPerDic",getAllPerDic);
				model.setViewName("ShowDictionary.jsp");
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return model;
		}
		@SystemLog(methods="字典管理",module="全部值的下一页")
		@RequestMapping("/downPageDic.do")
		public ModelAndView downPageDic(String NowPage,HttpServletRequest request){
			   ModelAndView model=new ModelAndView();
				try{
					System.out.println(NowPage+"这是第几页了");
					int pages=Integer.valueOf(NowPage);
					pages=pages+1;
					int page=(pages-1)*8;
					List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
					List<Dictionary> getAllPerDic=ChangeDictionaryService.getAllDictionary(page);
					if(getAllPerDic.size()==8){
					for(int i=0;i<getAllPerDic.size();i++){
						int k=i+1;
						String is=String.valueOf(k);
						getAllPerDic.get(i).setShunXuId(is);
					}
					}else{
						for(int i=0;i<getAllPerDic.size();i++){
							int k=i+1;
							
							String is=String.valueOf(k);
							getAllPerDic.get(i).setShunXuId(is);
						}
					
					}
					 request.setAttribute("pageSize",getAllPerDic.size());
					request.setAttribute("getNowPage",pages);
					model.addObject("getPerDic",getPerDic);
					model.addObject("getAllPerDic",getAllPerDic);
					model.setViewName("ShowDictionary.jsp");
					
				}catch(Exception e){
					e.printStackTrace();
				}
				return model;
			}
	
		@SystemLog(methods="字典管理",module="按功能(每一类)查询的上一页")
		@RequestMapping("/upPageSecDic.do")
		public ModelAndView upPageSecDic(String NowPage,HttpServletRequest request){
			   ModelAndView model=new ModelAndView();
				try{
					/*这里要更改过来否则这里会乱码*/
					String seleSecValueName = new String(request.getParameter("seleSecValueName").getBytes("ISO-8859-1"),"utf-8"); 
					//String seleSecValueName = new String(request.getParameter("seleSecValueName")); 
					int pages=Integer.valueOf(NowPage);
					pages=pages-1;
					int page=(pages-1)*8;
					List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
					Dictionary dic=new Dictionary();
					dic.setPage(page);
					dic.setType(seleSecValueName);
					List<Dictionary> getSecFun=ChangeDictionaryService.getSecDictionary(dic);
					for(int i=0;i<getSecFun.size();i++){
						int k=i+1;
						String is=String.valueOf(k);
						getSecFun.get(i).setShunXuId(is);
					}
					request.setAttribute("seleSecValueName",seleSecValueName);
					 request.setAttribute("pageSize",getSecFun.size());
					request.setAttribute("seleSecValue","seleSecValue");
					request.setAttribute("getNowPage",pages);
					model.addObject("getPerDic",getPerDic);
					model.addObject("getAllPerDic",getSecFun);
					model.setViewName("ShowDictionary.jsp");
					
				}catch(Exception e){
					e.printStackTrace();
				}
				return model;
			}
		@SystemLog(methods="字典管理",module="按功能(每一类)查询的下一页")
			@RequestMapping("/downPageSecDic.do")
			public ModelAndView downPageSecDic(String NowPage,HttpServletRequest request){
				ModelAndView model=new ModelAndView();
				try{
					/*这里在最后的最后要还原回来，否则乱码*/
					String seleSecValueName = new String(request.getParameter("seleSecValueName").getBytes("ISO-8859-1"),"utf-8"); 
					//String seleSecValueName = new String(request.getParameter("seleSecValueName")); 
					int pages=Integer.valueOf(NowPage);
					pages=pages+1;
					int page=(pages-1)*8;
					List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
					Dictionary dic=new Dictionary();
					dic.setPage(page);
					dic.setType(seleSecValueName);
					List<Dictionary> getSecFun=ChangeDictionaryService.getSecDictionary(dic);
				
					for(int i=0;i<getSecFun.size();i++){
						int k=i+1;
						String is=String.valueOf(k);
						getSecFun.get(i).setShunXuId(is);
					}
					request.setAttribute("pageSize",getSecFun.size());
					request.setAttribute("seleSecValue","seleSecValue");
					request.setAttribute("pageSize",getSecFun.size());
					request.setAttribute("seleSecValueName",seleSecValueName);
					request.setAttribute("getNowPage",pages);
					model.addObject("getPerDic",getPerDic);
					model.addObject("getAllPerDic",getSecFun);
					model.setViewName("ShowDictionary.jsp");
					
					
				}catch(Exception e){
					e.printStackTrace();
				}
				return model;
			}
		
		
		
	
	
	@SystemLog(methods="字典管理",module="显示字典类型值")
	@RequestMapping("/showSectValue.do")
	public ModelAndView showSectiValue(HttpServletRequest request){
		   ModelAndView model=new ModelAndView();
			try{
				/*这里在最后的最后要还原回来，否则乱码*/
				String getSeletSection = new String(request.getParameter("getSeletSection").getBytes("ISO-8859-1"),"utf-8"); 
				//String getSeletSection = new String(request.getParameter("getSeletSection"));
				List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
					 Dictionary dic=new Dictionary();
					 dic.setPage(0);
					 dic.setType(getSeletSection);
					 List<Dictionary> getSecFun=ChangeDictionaryService.getSecDictionary(dic);
						for(int i=0;i<getSecFun.size();i++){
							int k=i+1;
							String is=String.valueOf(k);
							getSecFun.get(i).setShunXuId(is);
						}
					 request.setAttribute("pageSize",getSecFun.size());	
					 request.setAttribute("seleSecValue","seleSecValue");
				   	 request.setAttribute("seleSecValueName",getSeletSection);
					 request.setAttribute("getNowPage",1);
					 model.addObject("getAllPerDic",getSecFun);
					 model.addObject("getPerDic",getPerDic);
					 model.setViewName("ShowDictionary.jsp");
			}catch(Exception e){
				e.printStackTrace();
				
			}
			
			return model;
		}
	
		@SystemLog(methods="字典管理",module="更改新值")
		@RequestMapping("updateFormss.do")
		public ModelAndView updateForm(HttpServletRequest request){
			   ModelAndView model=new ModelAndView();
				try{
					
					
					String getthisSureCode=request.getParameter("thisSureCode");
					String getchangeValue=request.getParameter("changeValue");
					Dictionary dict=new Dictionary();
							   dict.setCode(getthisSureCode);
							   dict.setName(getchangeValue);
					ChangeDictionaryService.updateDictionary(dict);
					List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
					List<Dictionary> getAllPerDic=ChangeDictionaryService.getAllDictionary(0);
					for(int i=0;i<getAllPerDic.size();i++){
						int k=i+1;
						String is=String.valueOf(k);
						getAllPerDic.get(i).setShunXuId(is);
					}
					request.setAttribute("getNowPage",1);
					model.addObject("getAllPerDic",getAllPerDic);
					model.addObject("getPerDic",getPerDic);
					model.setViewName("ShowDictionary.jsp");
					
				}catch(Exception e){
					e.printStackTrace();
					
				}
				return model;
			
		}
		@SystemLog(methods="字典管理",module="向添加新值的类里面返回最大值存入")
		@RequestMapping("getMaxCode.do")
		public void getMaxCode(HttpServletRequest request,HttpServletResponse response){
				try{
					int getCode=ChangeDictionaryService.getMaxCodes();
					int hey=Integer.valueOf(String.valueOf(getCode).substring(0,1))+1;
					String getNewCode=String.valueOf(hey)+"001";
					response.setHeader("Content-Type", "text/html; charset=UTF-8");
					PrintWriter writer=response.getWriter();
								writer.print(getNewCode);
								writer.flush();
								writer.close();
					
				}catch(Exception e){
					e.printStackTrace();
					
				}
			}
		@SystemLog(methods="字典管理",module="设置新的字典类型")
		@RequestMapping("setNewType.do")
		public ModelAndView setNewType(HttpServletRequest request,HttpServletResponse response){
			   ModelAndView model=new ModelAndView();
			   	try{
					String getNewType=request.getParameter("getNewType");
					String getNewCode=request.getParameter("getNewTypeCode");
					String getNewTypeVal=request.getParameter("getNewTypeVal");
					Dictionary dic=new Dictionary();
								dic.setType(getNewType);
								dic.setCode(getNewCode);
								dic.setName(getNewTypeVal);
					ChangeDictionaryService.intodicNewType(dic);
					List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
					List<Dictionary> getAllPerDic=ChangeDictionaryService.getAllDictionary(0);
					for(int i=0;i<getAllPerDic.size();i++){
						int k=i+1;
						String is=String.valueOf(k);
						getAllPerDic.get(i).setShunXuId(is);
					}
					
					request.setAttribute("getNowPage",1);
					model.addObject("getAllPerDic",getAllPerDic);
					model.addObject("getPerDic",getPerDic);
					model.setViewName("ShowDictionary.jsp");
			   		}catch(Exception e){
			   			   e.printStackTrace();
			}
			return model;
		}
		
		
			@SystemLog(methods="字典管理",module="在一类里面添加新值")
			@RequestMapping("getNewCode.do")
			public void getNewCode(HttpServletRequest request,HttpServletResponse response){
				
				try{
					String getType = new String(request.getParameter("getType").getBytes("ISO-8859-1"),"utf-8"); 
					//String getType = new String(request.getParameter("getType"));
					
					List<Dictionary> getCode=ChangeDictionaryService.getMaxType(getType);
					if(getCode==null||getCode.isEmpty()){
						response.setHeader("Content-Type", "text/html; charset=UTF-8");
						PrintWriter writer=response.getWriter();
									writer.print("2001");
									writer.flush();
									writer.close();
						
					}else{
					int getwei=getCode.size()-1;
					String getMaxCode=getCode.get(getwei).getCode();
					int getTureMaxCode=Integer.parseInt(getMaxCode)+1;
					String getTureMaxCodes=String.valueOf(getTureMaxCode);
					response.setHeader("Content-Type", "text/html; charset=UTF-8");
					PrintWriter writer=response.getWriter();
								writer.print(getTureMaxCodes);
								writer.flush();
								writer.close();
					}
				}catch(Exception e){
					e.printStackTrace();
					
				}
			}
				@SystemLog(methods="字典管理",module="添加新值向选择的类型里面")
				@RequestMapping("addData.do")
				public ModelAndView getData(HttpServletRequest request,HttpServletResponse response){
					   ModelAndView model=new ModelAndView();
					try{
						
						String getaddType=request.getParameter("addType");
						String getaddCode=request.getParameter("addCode");
						String getaddData=request.getParameter("addData");
						if("角色".equals(getaddType)){
							Role role=new Role();
							int getMaxId=ChangeDictionaryService.getMaxRole()+1;
								role.setId(getMaxId);
								role.setRoleName(getaddData);
								ChangeDictionaryService.addNewRole(role);	
						}
						Dictionary dict=new Dictionary();
						dict.setCode(getaddCode);
						dict.setName(getaddData);
						dict.setType(getaddType);
						boolean TureRu=ChangeDictionaryService.insertAddValue(dict);
						if(TureRu){
							if("班级名称".equals(getaddType)){
								List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(getaddType);
								
								ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
								 HashMap<String,String> ClassMap=new HashMap<String,String>();
						            String allClassValue="";
						       		for(int i=0;i<getClassName.size();i++){
						       			allClassValue+=","+getClassName.get(i).getName();
						       		}
						       		
						       		ClassMap.put("ClassName",allClassValue);
						       		ClassName.add(ClassMap);
						       		Dict.setClassName(ClassName);
						       		DictTag dicts=new DictTag();	
								}else if("角色".equals(getaddType)){
								List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(getaddType);
									System.out.println("666666666666666666666666666666666666666666666");
									ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
									 HashMap<String,String> ClassMap=new HashMap<String,String>();
							            String allClassValue="";
							       		for(int i=0;i<getClassName.size();i++){
							       			allClassValue+=","+getClassName.get(i).getName();
							       		}
							       		
							       		ClassMap.put("ClassName",allClassValue);
							       		ClassName.add(ClassMap);
							       		Dict.setRoleName(ClassName);
							       		DictTag dicts=new DictTag();	
								}else if("学校名称".equals(getaddType)){
									List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(getaddType);
									
									ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
									 HashMap<String,String> ClassMap=new HashMap<String,String>();
							            String allClassValue="";
							       		for(int i=0;i<getClassName.size();i++){
							       			allClassValue+=","+getClassName.get(i).getName();
							       		}
							       		
							       		ClassMap.put("SchooleName",allClassValue);
							       		ClassName.add(ClassMap);
							       		Dict.setSchooleName(ClassName);
							       		DictTag dicts=new DictTag();	
									
									
								}else if("密保问题".equals(getaddType)){
									
									List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(getaddType);
									System.out.println(getaddType+"2222222222222");
									ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
									 HashMap<String,String> ClassMap=new HashMap<String,String>();
							            String allClassValue="";
							       		for(int i=0;i<getClassName.size();i++){
							       			allClassValue+=","+getClassName.get(i).getName();
							       		}
							       		
							       		ClassMap.put("QuestionName",allClassValue);
							       		ClassName.add(ClassMap);
							       		Dict.setQuestionName(ClassName);
							       		DictTag dicts=new DictTag();	
									
									
								}else if("教室".equals(getaddType)){
									
									List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(getaddType);
									System.out.println(getaddType+"2222222222222");
									ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
									 HashMap<String,String> ClassMap=new HashMap<String,String>();
							            String allClassValue="";
							       		for(int i=0;i<getClassName.size();i++){
							       			allClassValue+=","+getClassName.get(i).getName();
							       		}
							       		
							       		ClassMap.put("ClassPlace",allClassValue);
							       		ClassName.add(ClassMap);
							       		Dict.setClassPlace(ClassName);
							       		DictTag dicts=new DictTag();	
									
									
								}else if("课程类型".equals(getaddType)){
									
									List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(getaddType);
									System.out.println(getaddType+"2222222222222");
									ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
									 HashMap<String,String> ClassMap=new HashMap<String,String>();
							            String allClassValue="";
							       		for(int i=0;i<getClassName.size();i++){
							       			allClassValue+=","+getClassName.get(i).getName();
							       		}
							       		
							       		ClassMap.put("ClassTypeName",allClassValue);
							       		ClassName.add(ClassMap);
							       		Dict.setClassTypeName(ClassName);
							       		DictTag dicts=new DictTag();	
									
									
								}
							
							
						}
						System.out.println(TureRu);
						List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
						List<Dictionary> getAllPerDic=ChangeDictionaryService.getAllDictionary(0);
						for(int i=0;i<getAllPerDic.size();i++){
							int k=i+1;
							String is=String.valueOf(k);
							getAllPerDic.get(i).setShunXuId(is);
						}
						request.setAttribute("getNowPage",1);
						model.addObject("getAllPerDic",getAllPerDic);
						model.addObject("getPerDic",getPerDic);
						model.setViewName("ShowDictionary.jsp");
					}catch(Exception e){
						e.printStackTrace();
						
					}
					return model;
					
				}
			
			@SystemLog(methods="字典管理",module="给字典里的值设置状态(启用/禁用)")
			@RequestMapping("setStautData.do")
			public ModelAndView setStautData(HttpServletRequest request,HttpServletResponse response){
				   ModelAndView model=new ModelAndView();
				   try{
						String setStautType=request.getParameter("setStautType");
						String setStautData=request.getParameter("setStautData");
						String setStautState=request.getParameter("setStautState");
						Dictionary dict=new Dictionary();
						dict.setStates(setStautState);
						dict.setName(setStautData);
						dict.setType(setStautType);
						boolean TureRu=ChangeDictionaryService.updateStates(dict);
						System.out.println(TureRu);
						List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
						List<Dictionary> getAllPerDic=ChangeDictionaryService.getAllDictionary(0);
						for(int i=0;i<getAllPerDic.size();i++){
							int k=i+1;
							String is=String.valueOf(k);
							getAllPerDic.get(i).setShunXuId(is);
						}
						System.out.println(setStautType+"999999999999999");
						if("班级名称".equals(setStautType)){
						List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(setStautType);
						
						ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
						 HashMap<String,String> ClassMap=new HashMap<String,String>();
				            String allClassValue="";
				       		for(int i=0;i<getClassName.size();i++){
				       			allClassValue+=","+getClassName.get(i).getName();
				       		}
				       		
				       		ClassMap.put("ClassName",allClassValue);
				       		ClassName.add(ClassMap);
				       		Dict.setClassName(ClassName);
				       		DictTag dicts=new DictTag();	
						}else if("角色".equals(setStautType)){
						List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(setStautType);
							System.out.println("666666666666666666666666666666666666666666666");
							ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
							 HashMap<String,String> ClassMap=new HashMap<String,String>();
					            String allClassValue="";
					       		for(int i=0;i<getClassName.size();i++){
					       			allClassValue+=","+getClassName.get(i).getName();
					       		}
					       		
					       		ClassMap.put("ClassName",allClassValue);
					       		ClassName.add(ClassMap);
					       		Dict.setRoleName(ClassName);
					       		DictTag dicts=new DictTag();	
						}else if("学校名称".equals(setStautType)){
							List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(setStautType);
							
							ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
							 HashMap<String,String> ClassMap=new HashMap<String,String>();
					            String allClassValue="";
					       		for(int i=0;i<getClassName.size();i++){
					       			allClassValue+=","+getClassName.get(i).getName();
					       		}
					       		
					       		ClassMap.put("SchooleName",allClassValue);
					       		ClassName.add(ClassMap);
					       		Dict.setSchooleName(ClassName);
					       		DictTag dicts=new DictTag();	
							
							
						}else if("密保问题".equals(setStautType)){
							
							List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(setStautType);
							System.out.println(setStautType+"2222222222222");
							ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
							 HashMap<String,String> ClassMap=new HashMap<String,String>();
					            String allClassValue="";
					       		for(int i=0;i<getClassName.size();i++){
					       			allClassValue+=","+getClassName.get(i).getName();
					       		}
					       		
					       		ClassMap.put("QuestionName",allClassValue);
					       		ClassName.add(ClassMap);
					       		Dict.setQuestionName(ClassName);
					       		DictTag dicts=new DictTag();	
							
							
						}else if("教室".equals(setStautType)){
							
							List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(setStautType);
							System.out.println(setStautType+"2222222222222");
							ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
							 HashMap<String,String> ClassMap=new HashMap<String,String>();
					            String allClassValue="";
					       		for(int i=0;i<getClassName.size();i++){
					       			allClassValue+=","+getClassName.get(i).getName();
					       		}
					       		
					       		ClassMap.put("ClassPlace",allClassValue);
					       		ClassName.add(ClassMap);
					       		Dict.setClassPlace(ClassName);
					       		DictTag dicts=new DictTag();	
							
							
						}else if("课程类型".equals(setStautType)){
							
							List<Dictionary>  getClassName=ChangeDictionaryService.getMaxType(setStautType);
							System.out.println(setStautType+"2222222222222");
							ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
							 HashMap<String,String> ClassMap=new HashMap<String,String>();
					            String allClassValue="";
					       		for(int i=0;i<getClassName.size();i++){
					       			allClassValue+=","+getClassName.get(i).getName();
					       		}
					       		
					       		ClassMap.put("ClassTypeName",allClassValue);
					       		ClassName.add(ClassMap);
					       		Dict.setClassTypeName(ClassName);
					       		DictTag dicts=new DictTag();	
							
							
						}
							request.setAttribute("getNowPage",1);
							model.addObject("getAllPerDic",getAllPerDic);
							model.addObject("getPerDic",getPerDic);
							model.setViewName("ShowDictionary.jsp");
						}catch(Exception e){
							e.printStackTrace();
							
						}
						return model;
						
					}
			

			@SystemLog(methods="字典管理",module="这里是显示的部分字典值的最后一页")
			@RequestMapping("endPageSecDic.do")
			public ModelAndView getSecDic(HttpServletRequest request,HttpServletResponse response){
				ModelAndView model=new ModelAndView();
				try{
					String getType = new String(request.getParameter("seleSecValueName").getBytes("ISO-8859-1"),"utf-8"); 
					//String getType = new String(request.getParameter("seleSecValueName"));
					int getSecPahe=ChangeDictionaryService.getSecPage(getType);
					/*有了最后一页的值*/
					int getSecPage=getSecPahe/8+1;	
					int page=(getSecPage-1)*8;
					List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
					Dictionary dic=new Dictionary();
					dic.setPage(page);
					dic.setType(getType);
					List<Dictionary> getSecFun=ChangeDictionaryService.getSecDictionary(dic);
				
					for(int i=0;i<getSecFun.size();i++){
						int k=i+1;
						String is=String.valueOf(k);
						getSecFun.get(i).setShunXuId(is);
					}
					request.setAttribute("seleSecValue","seleSecValue");
					request.setAttribute("pageSize",getSecFun.size());
					request.setAttribute("seleSecValueName",getType);
					request.setAttribute("getNowPage",getSecPage);
					model.addObject("getPerDic",getPerDic);
					model.addObject("getAllPerDic",getSecFun);
					model.setViewName("ShowDictionary.jsp");	
					
					
					
				}catch(Exception e){
					e.printStackTrace();
					
				}
				
				
				return model;
			}
			
			@SystemLog(methods="字典管理",module="这里是显示的全部字典值的最后一页")
			@RequestMapping("endPageDic.do")
			public ModelAndView getAllDiction(HttpServletRequest request,HttpServletResponse response){
				ModelAndView model=new ModelAndView();
				try{
					
					int getSecPahe=ChangeDictionaryService.getAllDicPage();
					/*有了最后一页的值*/
					int getSecPage=getSecPahe/8+1;	
					int page=(getSecPage-1)*8;
					List<Dictionary> getPerDic=ChangeDictionaryService.getAllName();
					
					List<Dictionary> getSecFun=ChangeDictionaryService.getAllDictionary(page);
				
					for(int i=0;i<getSecFun.size();i++){
						int k=i+1;
						String is=String.valueOf(k);
						getSecFun.get(i).setShunXuId(is);
					}
					request.setAttribute("getNowPage",getSecPage);
					model.addObject("getPerDic",getPerDic);
					request.setAttribute("pageSize",getSecFun.size());
					model.addObject("getAllPerDic",getSecFun);
					model.setViewName("ShowDictionary.jsp");	
					
					
					
				}catch(Exception e){
					e.printStackTrace();
					
				}
				
				
				return model;
			}
			
			
			
			
			
}
