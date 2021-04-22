package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.BoardDto;

public interface BoardDao {

	public List<BoardDto> board_selectList(BoardDto dto);
	public List<BoardDto> free_selectList();
	public List<BoardDto> notice_selectList();
	public List<BoardDto> qna_selectList();
	public List<BoardDto> dec_selectList();
	public BoardDto board_selectOne(int board_no);
	public int free_insert(BoardDto dto);
	public int notice_insert(BoardDto dto);
	public int qna_insert(BoardDto dto);
	public int dec_insert(BoardDto dto);
	public int free_update(BoardDto dto);
	public int notice_update(BoardDto dto);
	public int qna_update(BoardDto dto);
	public int dec_update(BoardDto dto);
	public int free_answerInsert(BoardDto dto);
	public int qna_answerInsert(BoardDto dto);
	public int free_answerUpdate(int board_free_no);
	public int qna_answerUpdate(int board_qna_no);
	public int readcountupdate(int board_no);
	public int free_delete(int board_free_no);
	public int delete(int board_no);
}
