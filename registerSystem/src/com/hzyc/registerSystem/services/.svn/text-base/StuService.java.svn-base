package com.hzyc.registerSystem.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.registerSystem.mapper.RealScheduleMapper;
import com.hzyc.registerSystem.mapper.SigningMapper;
import com.hzyc.registerSystem.mapper.UsersMapper;
import com.hzyc.registerSystem.po.RealSchedule;
import com.hzyc.registerSystem.po.SelectSigning;
import com.hzyc.registerSystem.po.Signing;
import com.hzyc.registerSystem.po.Users;

@Service
public class StuService {
	@Autowired
	UsersMapper  usersMapper;
	@Autowired
	SigningMapper signingMapper;
	@Autowired
	RealScheduleMapper realSchduleMapper;
	
	//添加user表
		public boolean insert(Users users){
			boolean sign=false;
			try {
			
			usersMapper.insert(users);	
			sign=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;	
		}

		
	//查询user信息通过code	
	public Users	selectByCode(String code){
		return 	usersMapper.selectByCode(code);
		
			
		}
	
	//更新user表
	public void updateByPrimaryKeySelective(Users users){
	usersMapper.updateByPrimaryKeySelective(users);	
	}
	//删除
	public void deleteById(String id){
		
		usersMapper.deleteById(id);	
	}
	//添加签到表
	public boolean insertSigning(Signing signing){
		boolean sign=false;
		try {
		
	signingMapper.insertSigning(signing);	
		sign=true;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return sign;	
	}
	
	//查询上课时间
	public String selectTimeByDate(RealSchedule realSchedule){
		return realSchduleMapper.selectTimeByDate(realSchedule);
		
	}
	//查询身份证号
	public String selectIdNumber(String idNmuber){
		return usersMapper.selectIdNumber(idNmuber);	
	}
	//查询时间段签到信息
public List<Signing> selectState(SelectSigning selectSigning){
	return	signingMapper.selectState(selectSigning);	
	}

//根据班号查ID

public String selectGradeId(String classId){
	return signingMapper.selectGradeId(classId);	
}

//查询状态判断是否已经签到
public String selectStateById(Signing signing){
	return signingMapper.selectStateById(signing);
	
}
//全查签到表日期
public List<String> selectSignDateById(String userId){
	return signingMapper.selectSignDateById(userId);
}
}
