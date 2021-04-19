package com.project.fp.dto;

public class MemberDto {

	private String member_loginroute;
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_nicname;
	private String member_email;
	private String member_phone;
	private String member_addr;
	private String member_grade;
	private String member_join;
	private String member_animal;
	private int member_point;
	private String member_dr_info;
	private String member_notify;
	public MemberDto() {
	}
	public MemberDto(String member_loginroute, String member_id, String member_password, String member_name, String member_nicname,
			String member_email, String member_phone, String member_addr, String member_grade, String member_join,
			String member_animal, int member_point, String member_dr_info, String member_notify) {
		this.member_loginroute = member_loginroute;
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_nicname = member_nicname;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_addr = member_addr;
		this.member_grade = member_grade;
		this.member_join = member_join;
		this.member_animal = member_animal;
		this.member_point = member_point;
		this.member_dr_info = member_dr_info;
		this.member_notify = member_notify;
	}
	public String getMember_loginroute() {
		return member_loginroute;
	}
	public void setMember_loginroute(String member_loginroute) {
		this.member_loginroute = member_loginroute;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_nicname() {
		return member_nicname;
	}
	public void setMember_nicname(String member_nicname) {
		this.member_nicname = member_nicname;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_join() {
		return member_join;
	}
	public void setMember_join(String member_join) {
		this.member_join = member_join;
	}
	public String getMember_animal() {
		return member_animal;
	}
	public void setMember_animal(String member_animal) {
		this.member_animal = member_animal;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public String getMember_dr_info() {
		return member_dr_info;
	}
	public void setMember_dr_info(String member_dr_info) {
		this.member_dr_info = member_dr_info;
	}
	public String getMember_notify() {
		return member_notify;
	}
	public void setMember_notify(String member_notify) {
		this.member_notify = member_notify;
	}
	
}
