package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.ProductDto;
import com.project.fp.dto.RecommendDto;

public interface RecommendDao {
	
	public int insert(RecommendDto dto);
	public RecommendDto selectOne(RecommendDto dto);
	public int update(RecommendDto dto);
}
