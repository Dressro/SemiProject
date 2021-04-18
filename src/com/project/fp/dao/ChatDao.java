package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.ChatDto;

public interface ChatDao {
	
	public List<ChatDto> selectList();
	public ChatDto selectOne(int ch_num);
	public int insert(ChatDto dto);
	public int update(ChatDto dto);
	public int delete(int chat_num);

}
