package com.hzyc.registerSystem.services;

import java.util.List;


import com.hzyc.registerSystem.po.Permission;
import com.hzyc.registerSystem.po.Role;
import com.hzyc.registerSystem.po.RolePermission;
import com.hzyc.registerSystem.po.UserRole;
import com.hzyc.registerSystem.po.Users;



public interface emPowerService {

	
	 List<Users> getUser();
		
	 List<Users> selectAllUsers();
	 
	 Integer ChaRoleForId(String id);
	 
	
	 
	 List<Role> selectAllRoles();
	 
	 List<Permission> chaAllFunHasPer();
	 
	 List<String> chaSecFunByRole(int rid);
		
	 List<Users> GetupPage(int page);	
	 
	 int ChaIdByName(String roleName);
		
	 List<Integer> SeleUseByPower(UserRole roleId);
	 
	 Users getPowerName(int id);

	 List<Users>  selectUsersByName(Users Name);
	 
	 boolean delByPid(RolePermission permissionId);
	 
	 List<RolePermission> SeleAllRoleId();
		
	boolean updateId(RolePermission rolePer);
	 
	Integer selectDelRlePerId(RolePermission permissionId); 
	
	Integer getMaxId();
	
	boolean intoRolePer(RolePermission rolePer);
	
	Integer seleIdByName(String name);
	
	boolean ChangeIdByUseId(UserRole userRole);
	    
	String JudgeUserHas(int userId);
	
	String selectCodeByName(String name);
	
	RolePermission JudgePerMissHas(RolePermission RPer);
	
	String getRoleName(int role_id);
}
