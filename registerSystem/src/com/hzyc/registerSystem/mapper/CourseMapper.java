package com.hzyc.registerSystem.mapper;

import java.util.List;

import com.hzyc.registerSystem.po.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
    
    List<Course> selTimeByProjectGroup();
}