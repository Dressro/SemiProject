package com.project.fp.dto;

import java.util.Date;

public class Chat_ContentDto {

	
	private int ch_num;
	private String member_nickname;
	private String ch_content;
	private Date ch_content_date;
	
	public Chat_ContentDto() {
	}

	public Chat_ContentDto(int ch_num, String member_nickname, String ch_content, Date ch_content_date) {
		this.ch_num = ch_num;
		this.member_nickname = member_nickname;
		this.ch_content = ch_content;
		this.ch_content_date = ch_content_date;
	}

	public int getCh_num() {
		return ch_num;
	}

	public void setCh_num(int ch_num) {
		this.ch_num = ch_num;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getCh_content() {
		return ch_content;
	}

	public void setCh_content(String ch_content) {
		this.ch_content = ch_content;
	}

	public Date getCh_content_date() {
		return ch_content_date;
	}

	public void setCh_content_date(Date ch_content_date) {
		this.ch_content_date = ch_content_date;
	}
	
	
	
	
	
	
	
}
