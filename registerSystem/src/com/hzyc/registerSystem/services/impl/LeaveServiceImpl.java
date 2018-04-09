package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.LeaveThingMapper;
import com.hzyc.registerSystem.mapper.SigningMapper;
import com.hzyc.registerSystem.mapper.UsersMapper;
import com.hzyc.registerSystem.po.LeaveThing;
import com.hzyc.registerSystem.po.Signing;
import com.hzyc.registerSystem.po.UserRole;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.LeaveService;

@Service
public class LeaveServiceImpl implements LeaveService{
	
	@Autowired
	private UsersMapper usersMapper;
	@Autowired
	private SigningMapper signingMapper;
	@Autowired
	private LeaveThingMapper leaveMapper;
	@Override
	public List<Users> selectForLeave(String classId) {
		// TODO Auto-generated method stub
		List<Users> usersList = usersMapper.selectForLeave(classId);
		return usersList;
	}

	@Override
	public List<Users> dimSelectForLeave(String dimSelect) {
		// TODO Auto-generated method stub
		List<Users> dimUsersList = usersMapper.dimSelectForLeave(dimSelect);
		return dimUsersList;
	}

	@Override
	public boolean insertLeaveStu(LeaveThing leaveThing) {
		// TODO Auto-generated method stub
		boolean result = false;
		try {
			
			leaveMapper.insertLeaveStu(leaveThing);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Users> selectAllUsers() {
		// TODO Auto-generated method stub
		return usersMapper.selectAllUsers();
	}

	@Override
	public boolean stuExcelIn(Users users) {
		// TODO Auto-generated method stub
		boolean result = false;
		try {
			
			usersMapper.insertSelective(users);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<LeaveThing> searchLeave() {
		// TODO Auto-generated method stub
		return leaveMapper.searchLeave();
	}

	@Override
	public void updateLeave(LeaveThing leaveThing) {
		// TODO Auto-generated method stub
		leaveMapper.updateLeave(leaveThing);
	}

	@Override
	public void deleteLeaveById(String id) {
		// TODO Auto-generated method stub
		leaveMapper.deleteLeaveById(id);
	}

	@Override
	public LeaveThing selectLeaveById(String id) {
		// TODO Auto-generated method stub
		return leaveMapper.selectLeaveById(id);
	}

	@Override
	public List<Users> selectId() {
		// TODO Auto-generated method stub
		return usersMapper.selectId();
	}

	@Override
	public boolean insertRole(UserRole userRole) {
		boolean result = false;
		try {
			
			usersMapper.insertRole(userRole);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}

	@Override
	public List<Users> selectStuByClassDim(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.selectStuByClassDim(users);
	}

	@Override
	public List<Users> dimSelectForPro(String dimSelect) {
		// TODO Auto-generated method stub
		List<Users> dimUsersList = usersMapper.dimSelectForPro(dimSelect);
		return dimUsersList;
	}

	@Override
	public boolean insertLeaveStuForPro(LeaveThing leaveThing) {
		// TODO Auto-generated method stub
		boolean result = false;
		try {
			
			leaveMapper.insertLeaveStuForPro(leaveThing);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<LeaveThing> searchLeaveForPro() {
		// TODO Auto-generated method stub
		return leaveMapper.searchLeaveForPro();
	}

	@Override
	public boolean afterLeaveAdd(Signing signing) {
		// TODO Auto-generated method stub
		boolean result = false;
		try {
			
			signingMapper.afterLeaveAdd(signing);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	

	
	
}
