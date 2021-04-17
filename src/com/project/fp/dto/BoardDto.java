package com.project.fp.dto;

import java.util.Date;

public class BoardDto {

	private int board_no;
	private int board_free_no;
	private int board_notice_no;
	private int board_qna_no;
	private int board_dec_no;
	private String board_title;
	private String board_content;
	private Date board_regdate;
	private int board_readcount;
	private int board_groupno;
	private int board_groupseq;
	private int board_titletab;
	private String board_delflag;
	private String board_category;
	private String member_id;

	public BoardDto() {

	}

	public BoardDto(int board_no, int board_free_no, int board_notice_no, int board_qna_no, int board_dec_no,
			String board_title, String board_content, Date board_regdate, int board_readcount, int board_groupno,
			int board_groupseq, int board_titletab, String board_delflag, String board_category, String member_id) {

		this.board_no = board_no;
		this.board_free_no = board_free_no;
		this.board_notice_no = board_notice_no;
		this.board_qna_no = board_qna_no;
		this.board_dec_no = board_dec_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_regdate = board_regdate;
		this.board_readcount = board_readcount;
		this.board_groupno = board_groupno;
		this.board_groupseq = board_groupseq;
		this.board_titletab = board_titletab;
		this.board_delflag = board_delflag;
		this.board_category = board_category;
		this.member_id = member_id;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoard_free_no() {
		return board_free_no;
	}

	public void setBoard_free_no(int board_free_no) {
		this.board_free_no = board_free_no;
	}

	public int getBoard_notice_no() {
		return board_notice_no;
	}

	public void setBoard_notice_no(int board_notice_no) {
		this.board_notice_no = board_notice_no;
	}

	public int getBoard_qna_no() {
		return board_qna_no;
	}

	public void setBoard_qna_no(int board_qna_no) {
		this.board_qna_no = board_qna_no;
	}

	public int getBoard_dec_no() {
		return board_dec_no;
	}

	public void setBoard_dec_no(int board_dec_no) {
		this.board_dec_no = board_dec_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public int getBoard_groupno() {
		return board_groupno;
	}

	public void setBoard_groupno(int board_groupno) {
		this.board_groupno = board_groupno;
	}

	public int getBoard_groupseq() {
		return board_groupseq;
	}

	public void setBoard_groupseq(int board_groupseq) {
		this.board_groupseq = board_groupseq;
	}

	public int getBoard_titletab() {
		return board_titletab;
	}

	public void setBoard_titletab(int board_titletab) {
		this.board_titletab = board_titletab;
	}

	public String getBoard_delflag() {
		return board_delflag;
	}

	public void setBoard_delflag(String board_delflag) {
		this.board_delflag = board_delflag;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
