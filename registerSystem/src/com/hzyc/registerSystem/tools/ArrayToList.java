package com.hzyc.registerSystem.tools;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import com.hzyc.registerSystem.po.RealSchedule;

public class ArrayToList {
	public List<RealSchedule> transform(StringBuffer[] arr){
		List<RealSchedule> rsList = new ArrayList<RealSchedule>();
		for (int a = 0; a < arr.length-1; a++) {
			int temp = 0;
			String weekDate = "";
			// 实例化日历
			Calendar cal = Calendar.getInstance();
			// 设置当前日期
			cal.set(2017, 10, 13);
			// 日期的输出格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			cal.get(Calendar.DAY_OF_WEEK);
			// 获取当月的最后一天
			cal.set(Calendar.DATE, 1);// 把日期设置为当月第一天
			cal.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
			String finalData = sdf.format(cal.getTime());
			// 重新设置时间
			cal.set(2017, 10, 13);
			// 获取日期是第几周星期几，星期一:2,星期日：1
			if (arr[a].substring(0, 3).equals("星期一")) {
				temp = 2;
				weekDate = arr[a].substring(4);
			}
			if (arr[a].substring(0, 3).equals("星期二")) {
				temp = 3;
				weekDate = arr[a].substring(4);
			}
			if (arr[a].substring(0, 3).equals("星期三")) {
				temp = 4;
				weekDate = arr[a].substring(4);
			}
			if (arr[a].substring(0, 3).equals("星期四")) {
				temp = 5;
				weekDate = arr[a].substring(4);
			}
			if (arr[a].substring(0, 3).equals("星期五")) {
				temp = 6;
				weekDate = arr[a].substring(4);
			}
			if (arr[a].substring(0, 3).equals("星期六")) {
				temp = 7;
				weekDate = arr[a].substring(4);
			}
			if (arr[a].substring(0, 3).equals("星期日")) {
				temp = 1;
				weekDate = arr[a].substring(4);
			}

			switch (temp) {
			case 1:
				for (int x = 0; x < 31; x++) {
					cal.add(Calendar.DATE, 1);// DATE=日
					if ((cal.get(Calendar.DAY_OF_WEEK)) == 1) {
						RealSchedule rs = new RealSchedule();
						rs.setTime(weekDate);
						rs.setDate(sdf.format(cal.getTime()));
						rsList.add(rs);
					}
					if (sdf.format(cal.getTime()).equals(finalData))
						break;
				}
				break;
			case 2:
				for (int x = 0; x < 31; x++) {
					cal.add(Calendar.DATE, 1);// DATE=日
					if ((cal.get(Calendar.DAY_OF_WEEK)) == 2) {
						RealSchedule rs = new RealSchedule();
						rs.setTime(weekDate);
						rs.setDate(sdf.format(cal.getTime()));
						rsList.add(rs);
					}
					if (sdf.format(cal.getTime()).equals(finalData))
						break;
				}
				break;
			case 3:
				for (int x = 0; x < 31; x++) {
					cal.add(Calendar.DATE, 1);// DATE=日
					if ((cal.get(Calendar.DAY_OF_WEEK)) == 3) {
						RealSchedule rs = new RealSchedule();
						rs.setTime(weekDate);
						rs.setDate(sdf.format(cal.getTime()));
						rsList.add(rs);
					}
					if (sdf.format(cal.getTime()).equals(finalData))
						break;
				}
				break;
			case 4:
				for (int x = 0; x < 31; x++) {
					cal.add(Calendar.DATE, 1);// DATE=日
					if ((cal.get(Calendar.DAY_OF_WEEK)) == 4) {
						RealSchedule rs = new RealSchedule();
						rs.setTime(weekDate);
						rs.setDate(sdf.format(cal.getTime()));
						rsList.add(rs);
					}
					if (sdf.format(cal.getTime()).equals(finalData))
						break;
				}
				break;
			case 5:
				for (int x = 0; x < 31; x++) {
					cal.add(Calendar.DATE, 1);// DATE=日
					if ((cal.get(Calendar.DAY_OF_WEEK)) == 5) {
						RealSchedule rs = new RealSchedule();
						rs.setTime(weekDate);
						rs.setDate(sdf.format(cal.getTime()));
						rsList.add(rs);
					}
					if (sdf.format(cal.getTime()).equals(finalData))
						break;
				}
				break;
			case 6:
				for (int x = 0; x < 31; x++) {
					cal.add(Calendar.DATE, 1);// DATE=日
					if ((cal.get(Calendar.DAY_OF_WEEK)) == 6) {
						RealSchedule rs = new RealSchedule();
						rs.setTime(weekDate);
						rs.setDate(sdf.format(cal.getTime()));
						rsList.add(rs);
					}
					if (sdf.format(cal.getTime()).equals(finalData))
						break;
				}
				break;
			case 7:
				for (int x = 0; x < 31; x++) {
					cal.add(Calendar.DATE, 1);// DATE=日
					if ((cal.get(Calendar.DAY_OF_WEEK)) == 7) {
						RealSchedule rs = new RealSchedule();
						rs.setTime(weekDate);
						rs.setDate(sdf.format(cal.getTime()));
						rsList.add(rs);
					}
					if (sdf.format(cal.getTime()).equals(finalData))
						break;
				}
				break;
			}

		}
		return rsList;
	}
}
