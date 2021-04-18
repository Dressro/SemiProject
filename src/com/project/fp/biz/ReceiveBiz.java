package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.ReceiveDto;

public interface ReceiveBiz {
	
	public List<ReceiveDto> selectList();
	public ReceiveDto selectOne(int order_num);
	public int insert(ReceiveDto dto);
	public int update(ReceiveDto dto);
	public int delete(int order_num);


}
