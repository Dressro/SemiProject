package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.HospitalDto;
import com.project.fp.dto.PagingDto;

public interface HospitalBiz {

	public int count();
	public List<HospitalDto> selectList();
	public List<HospitalDto> selectList(PagingDto Pdto);
	public List<HospitalDto> selectSearchList(HospitalDto dto);
	public int insert(HospitalDto dto);
}
