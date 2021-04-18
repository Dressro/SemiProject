package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.Chat_ContentDto;

public interface Chat_ContentDao {
	
	public List<Chat_ContentDto> selectList();
	public Chat_ContentDto selectOne(int ch_num);
	public int insert(Chat_ContentDto dto);
	public int update(Chat_ContentDto dto);
	public int delete(int ch_num);

}
