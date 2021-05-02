package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.Lost_AnimalDao;
import com.project.fp.dao.Lost_AnimalDaoImpl;
import com.project.fp.dto.Lost_AnimalDto;

public class Lost_AnimalBizImpl implements Lost_AnimalBiz {
	
	private Lost_AnimalDao dao = new Lost_AnimalDaoImpl();

	@Override
	public List<Lost_AnimalDto> selectList() {

		return dao.selectList();
	}

	@Override
	public Lost_AnimalDto selectOne(int board_no) {

		return dao.selectOne(board_no);
	}

	@Override
	public int insert(Lost_AnimalDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(Lost_AnimalDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int board_no) {

		return dao.delete(board_no);
	}

}
