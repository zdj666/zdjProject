package com.hzyc.registerSystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.DictionaryMapper;
import com.hzyc.registerSystem.po.Dictionary;
import com.hzyc.registerSystem.po.Role;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.ChangeDictionaryService;


@Service
public class ChangeDictionaryImpl implements ChangeDictionaryService {
	
	@Autowired
	private DictionaryMapper DictionaryMapper;
	@Autowired
	private com.hzyc.registerSystem.mapper.RoleMapper RoleMapper;
	
	@Override
	public List<Users>  testHere(){
		
	return 	DictionaryMapper.testHere();
		
	}
	
	@Override
	public  List<Dictionary> getAllDictionary(int page){
		
		
		return DictionaryMapper.getAllDictionary(page);
	}
	
	@Override
	public List<Dictionary> getAllName(){
		
		return DictionaryMapper.getAllName();
	}
	
	@Override
	public  List<Dictionary> getSecDictionary(Dictionary dic){
		
		
		return DictionaryMapper.getSecDictionary(dic);
	}
	@Override
	public boolean updateDictionary(Dictionary dic){
		
		return DictionaryMapper.updateDictionary(dic);
	}

	@Override
	public List<Dictionary> getMaxType(String Type){
		
		
		return DictionaryMapper.getMaxType(Type);
	}
	@Override
	public boolean insertAddValue(Dictionary dic){
		
		
		return DictionaryMapper.insertAddValue(dic);
	}
	@Override
	public  boolean updateStates(Dictionary dict){
		
		return DictionaryMapper.updateStates(dict);
	}
	@Override
	public boolean deletDicByCode(String code){
		
		return DictionaryMapper.deletDicByCode(code);
	}
	@Override	
    public boolean updateCodeAfterDel(Dictionary dic){
		
		return DictionaryMapper.updateCodeAfterDel(dic);
	}
	@Override
    public String selectCode(String type){
		
		return DictionaryMapper.selectCode(type);
	}
	
	@Override
	public  String getMaxCode(){
		
		return DictionaryMapper.getMaxCode();
	}
    
	@Override
    public boolean addDic(Dictionary dic){
		
		return DictionaryMapper.addDic(dic);
	}
    
	@Override
	public int getMaxCodes(){
		
		return DictionaryMapper.getMaxCodes();
	}
	
	@Override
	public  int intodicNewType(Dictionary dic){
		
		
		return DictionaryMapper.intodicNewType(dic);
	}
	
	@Override
	public int addNewRole(Role role){
		
		
		return RoleMapper.addNewRole(role);
	}
	@Override
	public int getMaxRole(){
		
		return RoleMapper.getMaxRole();
	}
	@Override
	public  int getAllDicPage(){
		
		return DictionaryMapper.getAllDicPage();
	}
    @Override
    public int getSecPage(String type){
    	
    	return DictionaryMapper.getSecPage(type);
    }
	
}
