package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.HospitalDao;
import com.project.fp.dao.HospitalDaoImpl;
import com.project.fp.dto.HospitalDto;

public class HospitalBizImpl implements HospitalBiz {

	private HospitalDao dao = new HospitalDaoImpl();
	@Override
	public List<HospitalDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public int insert(HospitalDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

}
