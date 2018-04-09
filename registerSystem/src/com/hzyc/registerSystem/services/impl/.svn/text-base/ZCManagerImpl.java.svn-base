package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.ZCManagerMapper;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.ZCManagerService;

@Service
public class ZCManagerImpl implements ZCManagerService {
	@Autowired
	private ZCManagerMapper ZCManagerMapper;
	
	@Override
	public List<Users> getUsers(){
		
		return ZCManagerMapper.getUsers();
	}
	@Override
	public List<Users> UserHave(String User){
		
		return ZCManagerMapper.UserHave(User);
		
	}

}
