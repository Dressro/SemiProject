package com.project.fp.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.project.fp.dto.MycalDto;


public class Util {
	
	private String todates;
	
	public String getTodates() {
		return todates;
	}
	
	public void setTodates(String cal_mdate) {
		// yyyy-MM-dd hh:mm:00
		String d = cal_mdate.substring(0, 4) + "-"
				 + cal_mdate.substring(4, 6) + "-"
				 + cal_mdate.substring(6, 8) + " "
				 + cal_mdate.substring(8, 10) + ":"
				 + cal_mdate.substring(10) + ":00";
		
		// 날짜를 원하는 형식으로 포맷/파싱
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
		// String을 타임스탬프로 리턴, 형식(yyyy-mm-dd hh:mm:ss)
		Timestamp tm = Timestamp.valueOf(d);
		todates = sdf.format(tm);
		
	}
	
	public static String fontColor(int date, int dayOfWeek) {
		String color = "";
		
		if ((dayOfWeek-1+date)%7 == 0) {
			color = "blue";
		} else if ((dayOfWeek-1+date)%7 == 1) {
			color = "red";
		} else {
			color = "black";
		}
		
		return color;
	}
	
	public static String isTwo(String msg) {
		
		return (msg.length() < 2)? "0"+msg : msg;
	}
	
	public static String getCalView(int i, List<MycalDto> list) {
		String d = isTwo(i+"");
		String res = "";
		
		for (MycalDto dto : list) {
			if (dto.getCal_mdate().substring(6, 8).equals(d)) {
				res += "<p>"
					+ ((dto.getCal_title().length() > 6)? dto.getCal_title().substring(0, 6) + "..." : dto.getCal_title())
					+ "</p>";
			}
		}
		
		return res;
	}

}
