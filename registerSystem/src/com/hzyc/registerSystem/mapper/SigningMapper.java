package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.SelectSigning;
import com.hzyc.registerSystem.po.Signing;

public interface SigningMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Signing record);

    int insertSelective(Signing record);

    Signing selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Signing record);

    int updateByPrimaryKey(Signing record);
    
	//项目组签到记录周一 到今天--BIN
	List<Signing> selSigning(String left,String right);
	
	//项目组签到记录 上周一到周一（不包括）--BIN
	List<Signing> selSigningNo(String left,String right);
	
	//项目组所有记录 降序 --BIN
	List<Signing> selAll();
	
	//哪期签到记录周一 到今天--BIN
	List<Signing> selGradeSigning(String option1,String left,String right);
	
	//哪期签到记录 上周一到周一（不包括）--BIN
	List<Signing> selGradeSigningNo(String option1,String left,String right);
	
	//哪期所有记录 降序 --BIN
	List<Signing> selGradeAll(String option1);
	
	//哪个学生从哪天到哪天的记录
	List<Signing> selGradeStudent(String option3,String left,String right);
	//签到表添加
	 int insertSigning(Signing record);
	 
	 //查询个人签到情况
	 List<Signing> selectState(SelectSigning selectSigning);
	 
	 //根据班号查ID
	String selectGradeId(String classId);
	
	//查询状态判断是否已经签到
	String selectStateById(Signing signing);
	//全查签到日期改变日历颜色
	List<String> selectSignDateById(String userId);
	
	void afterLeaveAdd(Signing signing);
}