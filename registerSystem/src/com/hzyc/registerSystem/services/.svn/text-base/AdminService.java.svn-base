package com.hzyc.registerSystem.services;

import java.util.List;

import com.hzyc.registerSystem.po.UserRole;
import com.hzyc.registerSystem.po.Users;

public interface AdminService {
	public Users login(Users u);
	public int register(Users u);
	public int insertUserRole(UserRole ur);
	public Users selUserId(String code);
	public List<Users> selStudentRegister(String code);
	public List<Users> selStudentNoRegister(String code);
	public int delUser(int id);
	public int delUserRole(int userid);
	
	public List<Users> selBoth();
	public int updateRemark(int id);

	public List<Users> studentCheckForSel(Users u);

	public String selRoleByUserId(int id);
	public List<Users> selEmployees(Users u);
	public Users selEmployeesDetailById(int id);
}
