package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.RecommendDao;
import com.project.fp.dao.RecommendDaoImpl;
import com.project.fp.dto.RecommendDto;

public class RecommendBizImpl implements RecommendBiz {
	
	private RecommendDao dao = new RecommendDaoImpl();

	@Override
	public int insertRec(RecommendDto dto) {
		// TODO Auto-generated method stub
		return dao.insertRec(dto);
	}

	

}
