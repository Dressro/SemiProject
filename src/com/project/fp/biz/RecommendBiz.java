package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.RecommendDto;

public interface RecommendBiz {
	
	public int insert(RecommendDto dto);
	public RecommendDto selectOne(RecommendDto dto);
	public int update(RecommendDto dto);
}
