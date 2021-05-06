package com.project.fp.alarm;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Cal_alarm {
	
	public static boolean day_compare(String m_date) {
		
		Date date = null;
		Calendar comparecal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = sdf.parse(m_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		comparecal.setTime(date);
		comparecal.add(Calendar.DATE, -1);
		// System.out.println(sdf.format(comparecal.getTime()));
		
		Date nowDate = new Date();
		String nowDatestr = sdf.format(nowDate);
		try {
			nowDate = sdf.parse(nowDatestr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		date = comparecal.getTime();
		
		if(nowDate.equals(date)) {
			if(atNoon()) {
				return true;
			}
		}
		
		return false;
	}
	
	public static boolean atNoon() {
		
		Date nowDay = new Date();
		
		SimpleDateFormat sdfAtnoon = new SimpleDateFormat("yyyy-MM-dd 12:00");
		SimpleDateFormat sdfnow = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		String noonDaystr = sdfAtnoon.format(nowDay);
		String nowDaystr = sdfnow.format(nowDay);
		
		try {
			Date noonDay = sdfAtnoon.parse(noonDaystr);
			Date nowDay2 = sdfnow.parse(nowDaystr);
			
			if(nowDay2.getTime() > noonDay.getTime()) {
				return true;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
}
