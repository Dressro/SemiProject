package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.AnimalDto;

public interface AnimalDao {
	
	public List<AnimalDto> selectList();
	public AnimalDto selectOne(int animal_no);
	public int insert(AnimalDto dto);
	public int update(AnimalDto dto);
	public int delete(int animal_no);

}
