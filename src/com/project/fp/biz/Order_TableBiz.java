package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.Order_TableDto;

public interface Order_TableBiz {
	
	public List<Order_TableDto> selectList();
	public List<Order_TableDto> selectbasketList(String member_id);
	public List<Order_TableDto> selectpayList(String member_id);
	public List<Order_TableDto> groupList();
	public Order_TableDto selectOne(int order_num);
	public int insert(Order_TableDto dto);
	public int basket_insert(Order_TableDto dto);
	public int update(Order_TableDto dto);
	public int update_group(Order_TableDto dto);
	public int delete(int order_num);

}
