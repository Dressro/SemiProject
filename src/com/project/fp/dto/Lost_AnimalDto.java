package com.project.fp.dto;

public class Lost_AnimalDto {

	private int lost_no;
	private double lost_lat;
	private double lost_lng;
	private int board_no;

	public Lost_AnimalDto() {
	}

	public Lost_AnimalDto(int lost_no, double lost_lat, double lost_lng, int board_no) {
		super();
		this.lost_no = lost_no;
		this.lost_lat = lost_lat;
		this.lost_lng = lost_lng;
		this.board_no = board_no;
	}

	public int getLost_no() {
		return lost_no;
	}

	public void setLost_no(int lost_no) {
		this.lost_no = lost_no;
	}

	public double getLost_lat() {
		return lost_lat;
	}

	public void setLost_lat(double lost_lat) {
		this.lost_lat = lost_lat;
	}

	public double getLost_lng() {
		return lost_lng;
	}

	public void setLost_lng(double lost_lng) {
		this.lost_lng = lost_lng;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	@Override
	public String toString() {
		return "Lost_AnimalDto [lost_no=" + lost_no + ", lost_lat=" + lost_lat + ", lost_lng=" + lost_lng
				+ ", board_no=" + board_no + "]";
	}

}
