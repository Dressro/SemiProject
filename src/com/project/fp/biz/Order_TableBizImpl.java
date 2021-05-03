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
	public List<Order_TableDto> mypageList(String member_id) {
		// TODO Auto-generated method stub
		return dao.mypageList(member_id);
	}
	
	@Override
	public List<Order_TableDto> basketList(String member_id) {
		// TODO Auto-generated method stub
		return dao.basketList(member_id);
	}
	
	@Override
	public List<Order_TableDto> payList(Order_TableDto dto) {
		// TODO Auto-generated method stub
		return dao.payList(dto);
	}
	
	@Override
	public List<Order_TableDto> groupList() {
		// TODO Auto-generated method stub
		return dao.groupList();
	}
	
	@Override
	public Order_TableDto group_del_select(int order_num) {
		// TODO Auto-generated method stub
		return dao.group_del_select(order_num);
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
	public int delete(int order_group) {

		return dao.delete(order_group);
	}

	@Override
	public int multiDelete(int[] order_groups) {
		// TODO Auto-generated method stub
		return dao.multiDelete(order_groups);
	}

	
	public List<Order_TableDto> selectbasketList(String member_id) {

		return dao.selectbasketList(member_id);
	}

	@Override
	public List<Order_TableDto> selectpayList(String member_id) {

		return dao.selectpayList(member_id);
	}

	@Override
	public int basket_insert(Order_TableDto dto) {

		return dao.basket_insert(dto);
	}
	@Override
	public int mulDelete(int[] order_nums) {
		// TODO Auto-generated method stub
		return dao.mulDelete(order_nums);
	}
	
	

	

	

	

}
