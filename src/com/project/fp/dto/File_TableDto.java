package com.project.fp.dto;

import java.util.Date;

public class File_TableDto {

	private int file_num;
	private String file_path;
	private String file_ori_name;
	private String file_new_name;
	private String file_type;
	private Date file_date;
	private String file_size;
	private String member_id;
	private int board_no;
	private int ch_num;
	private int animal_no;

	public File_TableDto() {

	}

	public File_TableDto(int file_num, String file_path, String file_ori_name, String file_new_name, String file_type,
			Date file_date, String file_size, String member_id, int board_no, int ch_num, int animal_no) {

		this.file_num = file_num;
		this.file_path = file_path;
		this.file_ori_name = file_ori_name;
		this.file_new_name = file_new_name;
		this.file_type = file_type;
		this.file_date = file_date;
		this.file_size = file_size;
		this.member_id = member_id;
		this.board_no = board_no;
		this.ch_num = ch_num;
		this.animal_no = animal_no;
	}

	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_ori_name() {
		return file_ori_name;
	}

	public void setFile_ori_name(String file_ori_name) {
		this.file_ori_name = file_ori_name;
	}

	public String getFile_new_name() {
		return file_new_name;
	}

	public void setFile_new_name(String file_new_name) {
		this.file_new_name = file_new_name;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public Date getFile_date() {
		return file_date;
	}

	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getCh_num() {
		return ch_num;
	}

	public void setCh_num(int ch_num) {
		this.ch_num = ch_num;
	}

	public int getAnimal_no() {
		return animal_no;
	}

	public void setAnimal_no(int animal_no) {
		this.animal_no = animal_no;
	}

}
