package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.HospitalDao;
import com.project.fp.dao.HospitalDaoImpl;
import com.project.fp.dto.HospitalDto;
import com.project.fp.dto.PagingDto;

public class HospitalBizImpl implements HospitalBiz {

	private HospitalDao dao = new HospitalDaoImpl();
	
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return dao.count();
	}
	
	@Override
	public List<HospitalDto> selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.selectList(Pdto);
	}
	
	@Override
	public List<HospitalDto> selectSearchList(HospitalDto dto) {
		// TODO Auto-generated method stub
		return dao.selectSearchList(dto);
	}


	@Override
	public int insert(HospitalDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public List<HospitalDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	

}
