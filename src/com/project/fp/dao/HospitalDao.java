package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.HospitalDto;

public interface HospitalDao {

	public List<HospitalDto> selectList();
	public int insert(HospitalDto dto);
}
