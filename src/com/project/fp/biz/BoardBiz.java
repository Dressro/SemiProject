package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.BoardDto;

public interface BoardBiz {

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
	public int readcountupdate(int board_no);
	public int free_delete(int board_free_no);
	public int delete(int board_no);
	public int free_answerProc(BoardDto dto);
	public int qna_answerProc(BoardDto dto);
}
