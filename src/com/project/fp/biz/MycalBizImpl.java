package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.MycalDao;
import com.project.fp.dao.MycalDaoImpl;
import com.project.fp.dto.MycalDto;

public class MycalBizImpl implements MycalBiz {
	
	private MycalDao dao = new MycalDaoImpl();

	@Override
	public List<MycalDto> selectViewList(MycalDto dto) {
		return dao.selectViewList(dto);
	}

	@Override
	public List<MycalDto> selectList(MycalDto dto) {
		return dao.selectList(dto);
	}

	@Override
	public MycalDto selectOne(int cal_no) {
		return dao.selectOne(cal_no);
	}

	@Override
	public int selectCount(MycalDto dto) {
		return dao.selectCount(dto);
	}

	@Override
	public int insertCal(MycalDto dto) {
		return dao.insertCal(dto);
	}

	@Override
	public int insertCheck(MycalDto dto) {
		return dao.insertCheck(dto);
	}

	@Override
	public int insertNextCheck(MycalDto dto) {
		return dao.insertNextCheck(dto);
	}

	@Override
	public int updateCal(MycalDto dto) {
		return dao.updateCal(dto);
	}

	@Override
	public int deleteCal(int cal_no) {
		return dao.deleteCal(cal_no);
	}

}
