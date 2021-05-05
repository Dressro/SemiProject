package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.MycalDto;

public interface MycalDao {
	
	public List<MycalDto> selectViewList(MycalDto dto);
	public List<MycalDto> selectList(MycalDto dto);
	public MycalDto selectOne(int cal_no);
	public int selectCount(MycalDto dto);
	public int insertCal(MycalDto dto);
	public int insertCheck(MycalDto dto);
	public int insertNextCheck(MycalDto dto);
	public int updateCal(MycalDto dto);
	public int deleteCal(int cal_no);

}
