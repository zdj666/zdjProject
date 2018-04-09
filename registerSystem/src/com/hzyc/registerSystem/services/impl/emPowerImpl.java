package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.PermissionMapper;
import com.hzyc.registerSystem.mapper.RolePermissionMapper;
import com.hzyc.registerSystem.po.Permission;
import com.hzyc.registerSystem.po.Role;
import com.hzyc.registerSystem.po.RolePermission;
import com.hzyc.registerSystem.po.UserRole;
import com.hzyc.registerSystem.po.Users;

import com.hzyc.registerSystem.services.emPowerService;

@Service
public class emPowerImpl implements emPowerService {

	@Autowired
	private PermissionMapper emPowerMapper;
	
	
	
	
	@Autowired
	private com.hzyc.registerSystem.mapper.RoleMapper roleMapper;
	
	@Autowired
	private RolePermissionMapper roolePermission;
	
	@Autowired
	private com.hzyc.registerSystem.mapper.RoleMapper RoleMapper;
	
	@Autowired
	private com.hzyc.registerSystem.mapper.UsersMapper UsersMapper;
	
	@Autowired
	private com.hzyc.registerSystem.mapper.UserRoleMapper UserRoleMapper;
	
	@Override
	public List<Users> getUser(){
		
		return emPowerMapper.getUser();
	}
	@Override
	public List<Users> selectAllUsers(){
		
		return emPowerMapper.selectAllUsers();
	}

	
	@Override
	public List<Role> selectAllRoles(){
		
		
		return roleMapper.selectAllRoles();
	}
	
	@Override
	public List<Permission> chaAllFunHasPer(){
		
		return emPowerMapper.chaAllFunHasPer();
	}
	@Override
	public Integer ChaRoleForId(String id){
		
		return RoleMapper.ChaRoleForId(id);
	}
	@Override
	public List<String> chaSecFunByRole(int rid){
		
		return emPowerMapper.chaSecFunByRole(rid);
	}
	
	
	@Override
	public List<Users> GetupPage(int page){
		
		return UsersMapper.GetupPage(page);
	}
	
	@Override
	public int ChaIdByName(String roleName){
		
		return roleMapper.ChaIdByName(roleName);
	}
	
	@Override
	public  List<Integer> SeleUseByPower(UserRole roleId){
		
		
		return UserRoleMapper.SeleUseByPower(roleId);
	}
	
	@Override
	public Users getPowerName(int id){
		
		return UsersMapper.getPowerName(id);
	}
	
	@Override
	public List<Users>  selectUsersByName(Users Name){
		
		return UsersMapper.selectUsersByName(Name);
	}

	
	@Override
	public boolean delByPid(RolePermission permissionId){
		
		return emPowerMapper.delByPid(permissionId);
	}
	@Override
	public List<RolePermission> SeleAllRoleId(){
		
		return emPowerMapper.SeleAllRoleId();
	}
	
	
	@Override
	public boolean updateId(RolePermission rolePer){
		
		return emPowerMapper.updateId(rolePer);
	}
	
	@Override
	public Integer selectDelRlePerId(RolePermission permissionId){
		
		return emPowerMapper.selectDelRlePerId(permissionId);
	}
	
	@Override
	public Integer getMaxId(){
		
		return roolePermission.getMaxId();
	}
	
	@Override
	public boolean intoRolePer(RolePermission rolePer){
		
		return roolePermission.intoRolePer(rolePer);
	}
	
	@Override
	public Integer seleIdByName(String name){
		
		return UsersMapper.seleIdByName(name);
	}
	
	@Override
	public  boolean ChangeIdByUseId(UserRole userRole){
		
		return UserRoleMapper.ChangeIdByUseId(userRole);
	}
    
	@Override
    public String JudgeUserHas(int userId){
		
		return UserRoleMapper.JudgeUserHas(userId);
	}
	@Override
	public String selectCodeByName(String name){
		
		return emPowerMapper.selectCodeByName(name);
	}
	@Override
	public RolePermission JudgePerMissHas(RolePermission RPer){
		
		return emPowerMapper.JudgePerMissHas(RPer);
	}
	
	@Override
	public String getRoleName(int role_id){
		
		
		return RoleMapper.getRoleName(role_id);
	}
	
	
}
