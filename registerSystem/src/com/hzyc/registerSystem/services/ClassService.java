package com.hzyc.registerSystem.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.ClassMapper;
import com.hzyc.registerSystem.mapper.CourseMapper;
import com.hzyc.registerSystem.mapper.GradeMapper;
import com.hzyc.registerSystem.mapper.RealScheduleMapper;
import com.hzyc.registerSystem.mapper.UsersMapper;
import com.hzyc.registerSystem.po.Course;
import com.hzyc.registerSystem.po.Grade;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.po.Users;


@Service
public class ClassService {
	@Autowired
	private ClassMapper classMapper;
	@Autowired
	private GradeMapper gradeMapper;
	@Autowired
	private UsersMapper usersMapper;
	@Autowired
	private CourseMapper cm;
	public List<Users> queryAllClassId(Users u){
	  return  (List<Users>) classMapper.queryAllClassId(u);
	}
	public List<Users> queryCountByClassId(String classId){
		return classMapper.queryCountByClassId(classId);
	}
	
	public boolean insertClass(Grade g){
		return classMapper.insertClass(g);
	}
	
	public List<Grade> selGradeAndUsersByClassId(Users u){
		return gradeMapper.selGradeAndUsersByClassId(u);
		
	}
	public List<Users> queryStuMessageByClassId(String classId){
		return usersMapper.queryStuMessageByClassId(classId);
	}
	
	public List<Users> queryStuByClassId(String classId){
		return usersMapper.queryStuByClassId(classId);
	}
	
	public int insertCourse(Course course){
		return cm.insert(course);
	}
	public Grade selIdByGrage(Grade g){
		return gradeMapper.selIdByGrade(g);
	}
	
	public List<Users> queryGradeAndUsersByUserId(int userId){
		return usersMapper.queryGradeAndUsersByUserId(userId);
	}
	
	public List<Users> queryStuMessageDetail(String classId){
		System.out.println("ServiceÖÐµÄ"+classId);
		return usersMapper.queryStuMessageDetail(classId);
	}
	
	public void updateGradeForGrade0(Grade g){
		gradeMapper.updateGradeForGrade0(g);
	}
	public void updateGradeForGrade1(Grade g){
		gradeMapper.updateGradeForGrade1(g);
	}
	public void updateGradeForGrade2(Grade g){
		gradeMapper.updateGradeForGrade2(g);
	}
	public void updateGradeForGrade3(Grade g){
		gradeMapper.updateGradeForGrade3(g);
	}
	 public String min(){
		 return gradeMapper. min();
	 }
	 public String yesOrNo(){
		 return gradeMapper.yesOrNo();
	 }
	 public int updateState(String endTime){
		 return gradeMapper.updateState(endTime);
	 }
	 public List<Grade> selectGradeByTwo(Grade g){
		return  gradeMapper.selectGradeByTwo(g); 
	 }
	 public List<Grade> selectGradeByTwo2(Grade g){
		 return  gradeMapper.selectGradeByTwo2(g); 
	 }
	 public List<Grade> selectSize0(Grade g){
		 return  gradeMapper.selectSize0(g); 
	 }
	 public int selGradeAndUsersByCount(String classId){
		 return gradeMapper.selGradeAndUsersByCount(classId);
	 }
}
