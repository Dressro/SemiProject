package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.HospitalDto;
import com.project.fp.dto.PagingDto;

public interface HospitalDao {
	
	public int count();
	public List<HospitalDto> selectList(PagingDto Pdto);
	public List<HospitalDto> selectSearchList(HospitalDto dto);
	public int insert(HospitalDto dto);
}
