package com.hzyc.registerSystem.services;

import java.util.List;

import com.hzyc.registerSystem.po.Log;

public interface InitService {
	
	public void insertLog(Log log);
	
	public List<Log> getLogIfo();
	
	public void delLogIfo(int id);
}
