package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.ChatDto;

public interface ChatBiz {
	
	public List<ChatDto> selectList(ChatDto dto);
	public ChatDto selectOne(int ch_num);
	public int insert(ChatDto dto);
	public int update(ChatDto dto);
	public int delete(int chat_num);

}
