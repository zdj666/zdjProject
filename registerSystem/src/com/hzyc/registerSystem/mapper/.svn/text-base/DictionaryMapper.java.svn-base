package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.Dictionary;
import com.hzyc.registerSystem.po.Users;

public interface DictionaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    Dictionary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);
    
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
    
    int getAllDicPage();
    
    int getSecPage(String type);
    
    
}