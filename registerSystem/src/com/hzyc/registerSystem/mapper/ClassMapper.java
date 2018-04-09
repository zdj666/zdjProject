package com.hzyc.registerSystem.mapper;


import java.util.List;

import com.hzyc.registerSystem.po.Grade;
import com.hzyc.registerSystem.po.Users;



public interface ClassMapper {
	public List<Users> queryAllClassId(Users u);
	
	public List<Users> queryCountByClassId(String classId);
	
	public List<Users> queryStuMessageByClassId(String classId);
	

	
	public boolean insertClass(Grade g);
		
}
