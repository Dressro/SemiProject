package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.BoardDao;
import com.project.fp.dao.BoardDaoImpl;
import com.project.fp.dto.BoardDto;

public class BoardBizImpl implements BoardBiz {
	
	private BoardDao dao = new BoardDaoImpl();

	@Override
	public List<BoardDto> selectList() {

		return dao.selectList();
	}

	@Override
	public BoardDto selectOne(int board_free_no) {

		return dao.selectOne(board_free_no);
	}

	@Override
	public int insert(BoardDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(BoardDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int board_free_no) {

		return dao.delete(board_free_no);
	}

}
