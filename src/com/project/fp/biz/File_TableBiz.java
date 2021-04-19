package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.File_TableDto;

public interface File_TableBiz {
	
	public List<File_TableDto> selectList();
	public File_TableDto selectOne(int file_num);
	public int insert(File_TableDto dto);
	public int update(File_TableDto dto);
	public int delete(int file_num);

}
