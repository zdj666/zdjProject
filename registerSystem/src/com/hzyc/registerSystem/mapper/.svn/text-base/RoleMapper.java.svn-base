package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    int ChaRoleForId(String id);
	
	int ChaIdByName(String roleName);
	
	
	List<Role> selectAllRoles();
    
	int addNewRole(Role role);
	
	int getMaxRole();
	
	String getRoleName(int role_id);
	
	
}