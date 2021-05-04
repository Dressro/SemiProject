package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.Chat_ContentDao;
import com.project.fp.dao.Chat_ContentDaoImpl;
import com.project.fp.dto.Chat_ContentDto;

public class Chat_ContentBizImpl implements Chat_ContentBiz {
	
	Chat_ContentDao dao = new Chat_ContentDaoImpl();

	@Override
	public List<Chat_ContentDto> selectList() {

		return dao.selectList();
	}

	@Override
	public List<Chat_ContentDto> selectOne(int ch_num) {

		return dao.selectOne(ch_num);
	}

	@Override
	public int insert(Chat_ContentDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(Chat_ContentDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int ch_num) {

		return dao.delete(ch_num);
	}

}
