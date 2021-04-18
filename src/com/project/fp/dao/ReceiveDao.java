package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.ReceiveDto;

public interface ReceiveDao {
	
	public List<ReceiveDto> selectList();
	public ReceiveDto selectOne(int order_num);
	public int insert(ReceiveDto dto);
	public int update(ReceiveDto dto);
	public int delete(int order_num);

}
