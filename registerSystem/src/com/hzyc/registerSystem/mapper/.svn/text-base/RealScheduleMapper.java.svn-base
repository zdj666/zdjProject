package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.RealSchedule;

public interface RealScheduleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RealSchedule record);

    int insertSelective(RealSchedule record);

    RealSchedule selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RealSchedule record);

    int updateByPrimaryKey(RealSchedule record);
    
    //项目组应该上班时间 大于等于这周一，小于等于今天---BIN
	List<RealSchedule> selPTWT(String left,String right);
	
	//项目组上周上班时间 大于等于上周一，小于这周一---BIN
	List<RealSchedule> selLeft(String left,String right);
	//查询时间
	String selectTimeByDate(RealSchedule realSchedule);
	
	//哪期应该上班时间 大于等于这周一，小于等于今天---BIN
	List<RealSchedule> selGradeWT(String option1,String left,String right);
	
	//哪期上周上班时间 大于等于上周一，小于这周一---BIN
	List<RealSchedule> selGradeLeft(String option1,String left,String right);
	
}