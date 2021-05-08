package com.project.fp.dto;

public class RecommendDto {

	private int member_no;
	private String member_id;
	private int recommend_first;
	private int recommend_second;
	private int recommend_third;
	private int recommend_fourth;
	private int recommend_fifth;
	public RecommendDto() {
	}
	public RecommendDto(int member_no, String member_id, int recommend_first, int recommend_second, int recommend_third,
			int recommend_fourth, int recommend_fifth) {
		this.member_no = member_no;
		this.member_id = member_id;
		this.recommend_first = recommend_first;
		this.recommend_second = recommend_second;
		this.recommend_third = recommend_third;
		this.recommend_fourth = recommend_fourth;
		this.recommend_fifth = recommend_fifth;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRecommend_first() {
		return recommend_first;
	}
	public void setRecommend_first(int recommend_first) {
		this.recommend_first = recommend_first;
	}
	public int getRecommend_second() {
		return recommend_second;
	}
	public void setRecommend_second(int recommend_second) {
		this.recommend_second = recommend_second;
	}
	public int getRecommend_third() {
		return recommend_third;
	}
	public void setRecommend_third(int recommend_third) {
		this.recommend_third = recommend_third;
	}
	public int getRecommend_fourth() {
		return recommend_fourth;
	}
	public void setRecommend_fourth(int recommend_fourth) {
		this.recommend_fourth = recommend_fourth;
	}
	public int getRecommend_fifth() {
		return recommend_fifth;
	}
	public void setRecommend_fifth(int recommend_fifth) {
		this.recommend_fifth = recommend_fifth;
	}
	@Override
	public String toString() {
		return "RecommendDto [member_no=" + member_no + ", member_id=" + member_id + ", recommend_first="
				+ recommend_first + ", recommend_second=" + recommend_second + ", recommend_third=" + recommend_third
				+ ", recommend_fourth=" + recommend_fourth + ", recommend_fifth=" + recommend_fifth + "]";
	}
	
	
}
