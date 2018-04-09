package com.hzyc.registerSystem.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.RetrievePasswordMapper;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.RetrievePasswordService;

@Service
public class RetrievePasswordImpl implements RetrievePasswordService{
	
	@Autowired
	private RetrievePasswordMapper rpm;
	
	@Override
	public Users getUserIfo(String username) {
		Users us = null; 
		try {
			us=rpm.getUserIfo(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public void updateUserIfo(String username, String password) {
		try {
			rpm.updateUserIfo(username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
