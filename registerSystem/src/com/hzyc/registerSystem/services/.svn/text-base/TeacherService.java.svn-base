package com.hzyc.registerSystem.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.TeacherMapper;
import com.hzyc.registerSystem.po.Users;


@Service
public class TeacherService {
	
	@Autowired
    private TeacherMapper teacherMapper;
	
    public String getPasswordByCode(String code){
		return teacherMapper.getPasswordByCode(code); 	
    }
    
    //个人信息部分
    public Users queryTeacherMessageByID(String id){
    	
    	return teacherMapper.queryTeacherMessageByID(id);
    }
	public boolean updateTeacherMessageByIDForInsert(Users u){

		boolean sign=false;
		
		try {
			
			teacherMapper.updateTeacherMessageByID(u);
			sign=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	
	}
	
	
}
