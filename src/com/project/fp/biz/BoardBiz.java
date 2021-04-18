package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.BoardDto;

public interface BoardBiz {
	
	public List<BoardDto> selectList();
	public BoardDto selectOne(int board_free_no);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int board_free_no);

}
