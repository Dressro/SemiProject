package com.project.fp.dto;

import java.util.Date;

public class Board_ReplyDto {
	
	private int reply_no;  // 댓글 번호
	private String reply_content;	// 댓글 내용
	private Date reply_regdate;	// 댓글 날짜
	
	private int reply_groupno;	// 댓글 그룹번호
	private int reply_groupseq;	// 댓글 그룹순서
	private int reply_tab;	// 댓글 공백
	private String reply_delflag;	// 댓글 삭제 여부
	
	private int board_no;	// 게시글 번호
	private String reply_nicname;	// 작성자 닉네임
	

	public Board_ReplyDto() {

	}
	
	
	public Board_ReplyDto(int reply_no, String reply_content, Date reply_regdate, int reply_groupno, int reply_groupseq,
			int reply_tab, String reply_delflag, int board_no, String reply_nicname) {
		super();
		this.reply_no = reply_no;
		this.reply_content = reply_content;
		this.reply_regdate = reply_regdate;
		this.reply_groupno = reply_groupno;
		this.reply_groupseq = reply_groupseq;
		this.reply_tab = reply_tab;
		this.reply_delflag = reply_delflag;
		this.board_no = board_no;
		this.reply_nicname = reply_nicname;
	}



	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	public int getReply_groupno() {
		return reply_groupno;
	}
	public void setReply_groupno(int reply_groupno) {
		this.reply_groupno = reply_groupno;
	}
	public int getReply_groupseq() {
		return reply_groupseq;
	}
	public void setReply_groupseq(int reply_groupseq) {
		this.reply_groupseq = reply_groupseq;
	}
	public int getReply_tab() {
		return reply_tab;
	}
	public void setReply_tab(int reply_tab) {
		this.reply_tab = reply_tab;
	}
	public String getReply_delflag() {
		return reply_delflag;
	}
	public void setReply_delflag(String reply_delflag) {
		this.reply_delflag = reply_delflag;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getReply_nicname() {
		return reply_nicname;
	}
	public void setReply_nicname(String reply_nicname) {
		this.reply_nicname = reply_nicname;
	}
	
	

}
