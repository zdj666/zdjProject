package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.LogMapper;
import com.hzyc.registerSystem.po.Log;
import com.hzyc.registerSystem.services.InitService;

@Service
public class InitServiceImp implements InitService{

	@Autowired
	private LogMapper lm;
	@Override
	public void insertLog(Log log) {
		System.out.println("日志InitService信息"+log.toString());
		
		try {

			//lm.selectByPrimaryKey("1")
			System.out.println("开始插入");
			lm.insert(log);
			System.out.println("插入数据库成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<Log> getLogIfo() {
		List<Log> lLsit = null;
		try {
			System.out.println("次数1");
			lLsit=lm.selectByPrimaryKey();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lLsit;
	}
	@Override
	public void delLogIfo(int id) {
		try {
			lm.deleteByPrimaryKey(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	

}
