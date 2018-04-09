package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.Permission;
import com.hzyc.registerSystem.po.Role;
import com.hzyc.registerSystem.po.RolePermission;
import com.hzyc.registerSystem.po.Users;

public interface PermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKeyWithBLOBs(Permission record);

    int updateByPrimaryKey(Permission record);
    
    public  List<Users> getUser();
	
	public List<Users> selectAllUsers();
	
	public Integer ChaRoleForId(String id);
	
	public List<Role> selectAllRole();
	
	public List<Permission> chaAllFunHasPer();
	
	public List<String> chaSecFunByRole(int rid);
	
	boolean delByPid(RolePermission permissionId);
	
	List<RolePermission> SeleAllRoleId();
	
	boolean updateId(RolePermission rolePer);
	
	Integer selectDelRlePerId(RolePermission permissionId);
	
	String selectCodeByName(String name);
	
	RolePermission JudgePerMissHas(RolePermission RPer);
	
	List<Permission> filterSel(int id);
	
}