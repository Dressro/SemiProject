package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.Lost_AnimalDto;

public interface Lost_AnimalBiz {

	public List<Lost_AnimalDto> selectList();
	public Lost_AnimalDto selectOne(int board_no);
	public int insert(Lost_AnimalDto dto);
	public int update(Lost_AnimalDto dto);
	public int delete(int board_no);
	public int multiDelete(String[] board_nos);
}
