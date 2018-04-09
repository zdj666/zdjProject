package com.hzyc.registerSystem.services;

import java.util.List;

import com.hzyc.registerSystem.po.Grade;
import com.hzyc.registerSystem.po.LeaveThing;
import com.hzyc.registerSystem.po.Signing;
import com.hzyc.registerSystem.po.UserRole;
import com.hzyc.registerSystem.po.Users;

public interface LeaveService {
	
	List<Users> selectForLeave(String classId);
	
	List<Users> dimSelectForLeave(String dimSelect);
	
	List<Users> dimSelectForPro(String dimSelect);
	
	boolean insertLeaveStu(LeaveThing leaveThing);
	
	List<Users> selectAllUsers();
	
	boolean stuExcelIn(Users users);
	
	List<LeaveThing> searchLeave();
	
	void updateLeave(LeaveThing leaveThing);
    
    void deleteLeaveById(String id);
    
    LeaveThing selectLeaveById(String id);
    
    List<Users> selectId();
	
	boolean insertRole(UserRole userRole);
	
	List<Users> selectStuByClassDim(Users users);
	
	boolean insertLeaveStuForPro(LeaveThing leaveThing);
	
	List<LeaveThing> searchLeaveForPro();
	
	boolean afterLeaveAdd(Signing signing);
}
