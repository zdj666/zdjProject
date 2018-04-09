package com.hzyc.registerSystem.services;

import java.util.List;

import com.hzyc.registerSystem.po.Dictionary;
import com.hzyc.registerSystem.po.Role;
import com.hzyc.registerSystem.po.Users;

public interface ChangeDictionaryService {

	List<Users>  testHere();
	
    List<Dictionary> getAllDictionary(int page);
    
    List<Dictionary> getAllName();
    
    List<Dictionary> getSecDictionary(Dictionary dic);
    
    boolean updateDictionary(Dictionary dic);
    
    List<Dictionary> getMaxType(String Type);
    
    boolean insertAddValue(Dictionary dic);
    
    boolean updateStates(Dictionary dict);
    
    boolean deletDicByCode(String code);
    
    boolean updateCodeAfterDel(Dictionary dic);
    
    String selectCode(String type);
    
    String getMaxCode();
    
    boolean addDic(Dictionary dic);
    
    int getMaxCodes();
    
    int intodicNewType(Dictionary dic);

    int addNewRole(Role role);
    
    int getMaxRole();
    
    int getAllDicPage();
    
    int getSecPage(String type);
}
