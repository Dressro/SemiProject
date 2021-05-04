package com.project.fp.dto;

import java.util.Date;

public class MycalDto {
	
	private int cal_no;
	private String cal_title;
	private String cal_content;
	private String cal_mdate;
	private String next_mdate;
	private Date cal_regdate;
	private String member_id;
	
	public MycalDto() {
	}

	public MycalDto(int cal_no, String cal_title, String cal_content, String cal_mdate, String next_mdate,
			Date cal_regdate, String member_id) {
		super();
		this.cal_no = cal_no;
		this.cal_title = cal_title;
		this.cal_content = cal_content;
		this.cal_mdate = cal_mdate;
		this.next_mdate = next_mdate;
		this.cal_regdate = cal_regdate;
		this.member_id = member_id;
	}
	
	public MycalDto(String cal_mdate, String member_id) {
		this.cal_mdate = cal_mdate;
		this.member_id = member_id;
	}
	
	public int getCal_no() {
		return cal_no;
	}

	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}

	public String getCal_title() {
		return cal_title;
	}

	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}

	public String getCal_content() {
		return cal_content;
	}

	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}

	public String getCal_mdate() {
		return cal_mdate;
	}

	public void setCal_mdate(String cal_mdate) {
		this.cal_mdate = cal_mdate;
	}

	public String getNext_mdate() {
		return next_mdate;
	}

	public void setNext_mdate(String next_mdate) {
		this.next_mdate = next_mdate;
	}

	public Date getCal_regdate() {
		return cal_regdate;
	}

	public void setCal_regdate(Date cal_regdate) {
		this.cal_regdate = cal_regdate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
