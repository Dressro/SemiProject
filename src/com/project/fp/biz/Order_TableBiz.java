package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.Order_TableDto;

public interface Order_TableBiz {
	
	public List<Order_TableDto> selectList();
	public Order_TableDto selectOne(int order_num);
	public int insert(Order_TableDto dto);
	public int update(Order_TableDto dto);
	public int delete(int order_num);

}
