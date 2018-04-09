package com.hzyc.registerSystem.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.StuMessageMapper;
import com.hzyc.registerSystem.mapper.UsersMapper;
import com.hzyc.registerSystem.po.Users;

@Service
public class StuMessageService {
	
	    
		@Autowired
		private StuMessageMapper stuMessageMapper;
		@Autowired
		private UsersMapper usersMapper;
		
		
		
		public boolean insertStuMessage(Users u){
		
			stuMessageMapper.insertStuMessage(u);
			return true;
		}
		
		public List<Users> queryStuMessageAll(){
			return stuMessageMapper.queryStuMessageAll();		
		}
		
		public Users queryStuMessageByID(String id){
			//System.out.println("Service------->"+id);
			return stuMessageMapper.queryStuMessageByID(id);
		}
		public boolean updateStuMessageByID(Users u){
			boolean sign=false;
			
			try {
				
				stuMessageMapper.updateStuMessageByID(u);
				sign=true;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sign;
		}
		public boolean deleteStuMessageByID(String id){
			boolean sign=false;
			System.out.println("Service 中的delete--------》"+id);
			try {
				stuMessageMapper.deleteStuMessageByID(id);
				sign=true;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sign;
			
		}
		
		public boolean updateStuMessageByIDForInsert(Users u){
			boolean sign=false;
			System.out.println("Service 中的update--------》"+u);
			try {
				stuMessageMapper.updateStuMessageByIDForInsert(u);
				sign=true;	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sign;
		}
		
		
		public List<Users> queryStuMessageByClassID(Users u){
			return usersMapper.queryStuMessageByClassID(u);		
		}
		
		
	}

