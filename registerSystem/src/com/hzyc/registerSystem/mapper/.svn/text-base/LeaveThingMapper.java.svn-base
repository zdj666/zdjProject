package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.LeaveThing;

public interface LeaveThingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LeaveThing record);

    int insertSelective(LeaveThing record);

    LeaveThing selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LeaveThing record);

    int updateByPrimaryKey(LeaveThing record);
    
    void insertLeaveStu(LeaveThing leaveThing);
    
    void insertLeaveStuForPro(LeaveThing leaveThing);
    
    List<LeaveThing> searchLeave();
    
    List<LeaveThing> searchLeaveForPro();
    
    void updateLeave(LeaveThing leaveThing);
    
    void deleteLeaveById(String id);
    
    LeaveThing selectLeaveById(String id);
}