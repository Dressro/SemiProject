package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.File_TableDto;

public interface File_TableBiz {
	
	public List<File_TableDto> selectList();
	public File_TableDto selectOne(int file_num);
	public File_TableDto board_selectOne(int board_no);
	public int board_insert(File_TableDto dto);
	public int animal_insert(File_TableDto dto);
	public int ch_insert(File_TableDto dto);
	public int prod_insert(File_TableDto dto);
	public int update(File_TableDto dto);
	public int delete(int file_num);
	public int board_delete(int board_no);
	public int multiDelete(String[] board_nos);

}
