package com.hzyc.registerSystem.mapper;

import com.hzyc.registerSystem.po.RolePermission;

public interface RolePermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RolePermission record);

    int insertSelective(RolePermission record);

    RolePermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RolePermission record);

    int updateByPrimaryKey(RolePermission record);
    
    int getMaxId();
    
    boolean intoRolePer(RolePermission rolePer);
    
}