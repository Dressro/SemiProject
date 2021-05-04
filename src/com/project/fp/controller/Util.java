package com.project.fp.controller;

import java.util.List;

import com.project.fp.dto.MycalDto;


public class Util {
	
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
			if (dto.getCal_mdate().substring(8, 10).equals(d)) {
				res += "<p>"
					+ ((dto.getCal_title().length() > 8)? dto.getCal_title().substring(0, 8) + "..." : dto.getCal_title())
					+ "</p>";
			}
		}
		
		return res;
	}

}
