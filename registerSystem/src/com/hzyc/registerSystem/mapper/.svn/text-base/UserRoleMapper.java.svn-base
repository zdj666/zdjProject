package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.Permission;
import com.hzyc.registerSystem.po.UserRole;

public interface UserRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
    
    List<Integer> SeleUseByPower(UserRole roleId);
    
    boolean ChangeIdByUseId(UserRole userRole);
    
    String JudgeUserHas(int userId);
    
    int delUserRole(int userId);
   
    
}