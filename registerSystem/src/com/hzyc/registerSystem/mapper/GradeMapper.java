package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.Grade;
import com.hzyc.registerSystem.po.Users;

public interface GradeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
    
    List<Users> queryGradeAndUsersByUserId(int userId);
    
    //查询一个班 name:班名 --BIN
    List<Grade> judgment(String name);
    
    //查询一个老师账号的相关信息--BIN
    List<Grade> statsTWK(String username);
    
    //查询全部班级的相关信息--BIN
    List<Grade> statsATWK();
    
    
    Grade selIdByGrade(Grade g);
    
    List<Grade> selGradeAndUsersByClassId(Users u);
   
    int updateGradeForGrade0(Grade g);
    int updateGradeForGrade1(Grade g);
    int updateGradeForGrade2(Grade g);
    int updateGradeForGrade3(Grade g);
   
    String min();
    String yesOrNo();
   
    int updateState(String endTime);
    List<Grade> selectGradeByTwo(Grade g);
    List<Grade> selectGradeByTwo2(Grade g);
    List<Grade> selectSize0(Grade g);
    
    int selGradeAndUsersByCount(String classId);
    List<Grade> selGradeByClassId(Grade g);
    
}