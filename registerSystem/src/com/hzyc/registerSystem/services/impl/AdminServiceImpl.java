package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.UserRoleMapper;
import com.hzyc.registerSystem.mapper.UsersMapper;
import com.hzyc.registerSystem.po.UserRole;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	UsersMapper userMapper;
	
	@Autowired
	UserRoleMapper ump;
	
	/* (non-Javadoc)
	 * @see com.hzyc.registerSystem.services.AdminService#login(com.hzyc.registerSystem.po.Users)
	 * @auther 马荣福
	 * @desc:登录的方法,
	 * @param 用户表
	 */
	public Users login(Users user){
		return userMapper.login(user);
	}
	
	/* (non-Javadoc)
	 * @see com.hzyc.registerSystem.services.AdminService#register(com.hzyc.registerSystem.po.Users)
	 * @auther 马荣福
	 * @desc:注册的方法
	 * @param 用户表
	 */
	public int register(Users u){
		return userMapper.insert(u);
	}
	/* (non-Javadoc)
	 * @see com.hzyc.registerSystem.services.AdminService#register(com.hzyc.registerSystem.po.Users)
	 * @auther 马荣福
	 * @desc:插入用户角色表
	 * @param 用户表
	 */
	public int insertUserRole(UserRole ur){
		return ump.insert(ur);
	}
	/* (non-Javadoc)
	 * @see com.hzyc.registerSystem.services.AdminService#register(com.hzyc.registerSystem.po.Users)
	 * @auther 马荣福
	 * @param 账号
	 * 根据用户名查询id
	 */
	public Users selUserId(String code){
		return userMapper.selUserId(code);
	}
	
	public List<Users> selStudentNoRegister(String code){
		return userMapper.selStudentNoRegister(code);
	}
	//查询已经审核的学生
	public List<Users> selStudentRegister(String code){
		return userMapper.selStudentRegister(code);
	}
	
	
	public List<Users> studentCheckForSel(Users u){
		System.out.println("学生姓名" + u.getRemark());
		System.out.println("审核状态" + u.getName());
		
		
		if(u.getRemark().equals("已审核")){
			u.setRemark("1");
			
		}else if(u.getRemark().equals("未审核")){
			u.setRemark("0");
		}
		
		
		
		List<Users> usersList = userMapper.studentCheckForSel(u);
		
		
		return usersList;
	}
	
	public int delUser(int id){
		return userMapper.deleteByPrimaryKey(id);
	}
	public int delUserRole(int userId){
		return ump.delUserRole(userId);
	}
	@Override
	public List<Users> selBoth() {
		List<Users> list = userMapper.selBoth();
		return list;
	}
	@Override
	public int updateRemark(int id){
		return userMapper.updateRemark(id);
	}
	public String selRoleByUserId(int id){
		return ump.JudgeUserHas(id);
	}
	public List<Users> selEmployees(Users u){
		return userMapper.selEmployees(u);
	}
	public Users selEmployeesDetailById(int id){
		return userMapper.selectByPrimaryKey(id);
	}
}
