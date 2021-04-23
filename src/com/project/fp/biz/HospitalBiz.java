package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.HospitalDto;

public interface HospitalBiz {

	public List<HospitalDto> selectList();
	public List<HospitalDto> selectSearchList(HospitalDto dto);
	public int insert(HospitalDto dto);
}
