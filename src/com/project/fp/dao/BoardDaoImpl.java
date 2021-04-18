package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.BoardDto;

public class BoardDaoImpl implements BoardDao {

	@Override
	public List<BoardDto> free_selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> notice_selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> qna_selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDto free_selectOne(int board_free_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDto notice_selectOne(int board_notice_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDto qna_selectOne(int board_qna_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int free_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int notice_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qna_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int free_answerInsert(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qna_answerInsert(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int free_answerUpdate(int board_free_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qna_answerUpdate(int board_qna_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int readcountupdate(int board_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int free_delete(int board_free_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int board_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
