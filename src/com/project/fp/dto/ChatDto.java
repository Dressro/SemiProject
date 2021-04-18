package com.project.fp.dto;

import java.sql.Date;

public class ChatDto {

	private int ch_num;
	private String ch_name;
	private Date ch_date;
	private String member_id;
	public ChatDto() {
	}
	public ChatDto(int ch_num, String ch_name, Date ch_date, String member_id) {
		this.ch_num = ch_num;
		this.ch_name = ch_name;
		this.ch_date = ch_date;
		this.member_id = member_id;
	}
	public int getCh_num() {
		return ch_num;
	}
	public void setCh_num(int ch_num) {
		this.ch_num = ch_num;
	}
	public String getCh_name() {
		return ch_name;
	}
	public void setCh_name(String ch_name) {
		this.ch_name = ch_name;
	}
	public Date getCh_date() {
		return ch_date;
	}
	public void setCh_date(Date ch_date) {
		this.ch_date = ch_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
