package com.hzyc.registerSystem.services;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.xml.crypto.Data;

import com.hzyc.registerSystem.po.Grade;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.po.Signing;
import com.hzyc.registerSystem.po.Users;

/**
 * @author BIN
 * @date 2017-11-8 下午07:35:42
 */
public interface StatsService {

	//项目组成员的账号和姓名 返回固定形式
	List<List<String>> statsHistogram();
	
	//项目组成员的账号和姓名
	List<Users> statsPT();
	
	//项目组签到记录周一 到今天--BIN
	List<Signing> selSining(Date d);
	
	//项目组签到记录 上周一到周一（不包括）--BIN
	List<Signing> selSiningNo(Date d);
	
	//项目组应该上班时间 大于等于这周一，小于等于今天
	List<RealSchedule> selPTWT(Date d);

	//上一周，d:当前周周一
	List<RealSchedule> left(Date d);
	
	 //查询一个班 name:班名 
    List<Grade> judgment(String name);
    
	//项目组上班时间 大于等于上周一+7 小于等一上周一+14
    List<RealSchedule> right(Date d);
    
    //签到记录 （本周一+7）下周一到周日（本周一+13）
	List<Signing> selSiningYes(Date d);
	
	//项目组所有签到记录
	List<Signing> selAll();
	
	//从left到right的签到记录
	List<Signing> selSigningTime(String left,String right);
	
	//从left到right的应该上班记录
	List<RealSchedule> selPTT(String left,String right);
	
	//查询一个老师账号的相关信息
    List<Grade> statsTWK(String username);
    
    //查询全部班级的相关信息
    List<Grade> statsATWK();
    
    //查询一个期的所有学生 返回固定格式
	List<Map<String,String>> selStudent(String option1);
	
	//哪期的账号和姓名 返回固定形式
	List<List<String>> statsGradeHistogram(String option1);
	
	//哪期的账号和姓名 返回固定形式
	List<Users> selS(String option1);
	
	//哪期签到记录周一 到今天--BIN
	List<Signing> selGradeSining(Date d,String option1);
	
	//哪期签到记录 上周一到周一（不包括）--BIN
	List<Signing> selGradeSiningNo(Date d,String option1);
	
	//获取周一时间
	String[] getMonday(Date d);
	
	//获取上周一时间
	String[] getLastMonday(Date d);
	
	//获取下周一
	String[] getNextMonday(Date d);
	
	//哪期应该上班时间 大于等于这周一，小于等于今天
	List<RealSchedule> selGradeWT(Date d,String option1);
	
	//上一周，d:当前周周一
	List<RealSchedule> gradeLeft(Date d,String option1);
	
	//哪期上班时间 大于等于上周一+7 小于等一上周一+14
    List<RealSchedule> gradeRight(Date d,String option1);
    
    //哪期所有签到记录
	List<Signing> selGradeAll(String option1);
	
    //哪期签到记录 （本周一+7）下周一到周日（本周一+13）
	List<Signing> selGradeSiningYes(Date d,String option1);
	
	//哪个学生从哪天到哪天的记录
	List<Signing> selGradeStudent(Date d,String option3);
	
	//哪期从多少号到多少号签到记录
	List<Signing> statsGradeSigning(String option1,String left,String right);
	
	//哪期应该上班时间 大于等于left，小于等于right
	List<RealSchedule> statsGrade(String option1,String left,String right);
}
