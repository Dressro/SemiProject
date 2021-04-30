package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.Order_TableDao;
import com.project.fp.dao.Order_TableDaoImpl;
import com.project.fp.dto.Order_TableDto;

public class Order_TableBizImpl implements Order_TableBiz {
	
	private Order_TableDao dao = new Order_TableDaoImpl();

	@Override
	public List<Order_TableDto> selectList() {

		return dao.selectList();
	}
	
	@Override
	public List<Order_TableDto> groupList() {
		// TODO Auto-generated method stub
		return dao.groupList();
	}
	
	@Override
	public Order_TableDto selectOne(int order_num) {

		return dao.selectOne(order_num);
	}

	@Override
	public int insert(Order_TableDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(Order_TableDto dto) {

		return dao.update(dto);
	}
	
	@Override
	public int update_group(Order_TableDto dto) {
		// TODO Auto-generated method stub
		return dao.update_group(dto);
	}
	
	@Override
	public int delete(int order_num) {

		return dao.delete(order_num);
	}

	

	

}
