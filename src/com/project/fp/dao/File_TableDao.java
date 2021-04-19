package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.File_TableDto;

public interface File_TableDao {
	
	public List<File_TableDto> selectList();
	public File_TableDto selectOne(int file_num);
	public int insert(File_TableDto dto);
	public int update(File_TableDto dto);
	public int delete(int file_num);

}
