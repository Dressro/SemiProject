package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.ReceiveDao;
import com.project.fp.dao.ReceiveDaoImpl;
import com.project.fp.dto.ReceiveDto;

public class ReceiveBizImpl implements ReceiveBiz {
	
	ReceiveDao dao = new ReceiveDaoImpl();

	@Override
	public List<ReceiveDto> selectList() {

		return dao.selectList();
	}

	@Override
	public ReceiveDto selectOne(int order_num) {

		return dao.selectOne(order_num);
	}

	@Override
	public int insert(ReceiveDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(ReceiveDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int order_num) {

		return dao.delete(order_num);
	}

}
