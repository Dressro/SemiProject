package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.ChatDao;
import com.project.fp.dao.ChatDaoImpl;
import com.project.fp.dto.ChatDto;

public class ChatBizImpl implements ChatBiz {
	
	ChatDao dao = new ChatDaoImpl();

	@Override
	public List<ChatDto> selectList() {

		return dao.selectList();
	}

	@Override
	public ChatDto selectOne(int ch_num) {

		return dao.selectOne(ch_num);
	}

	@Override
	public int insert(ChatDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(ChatDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int chat_num) {

		return dao.delete(chat_num);
	}

}
