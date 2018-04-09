package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.PermissionMapper;
import com.hzyc.registerSystem.po.Permission;
import com.hzyc.registerSystem.services.FilterService;

@Service
public class FilterImpl implements FilterService{

	@Autowired
	PermissionMapper permissionMapper;
	
	
	@Override
	public List<Permission> filterSel(int id) {
		
		List<Permission> list = permissionMapper.filterSel(id);
		// TODO Auto-generated method stub
		return list;
	}


	@Override
	public List<Permission> chaAllFunHasPer() {
		List<Permission> list = permissionMapper.chaAllFunHasPer();
		// TODO Auto-generated method stub
		return list;
	}

}
