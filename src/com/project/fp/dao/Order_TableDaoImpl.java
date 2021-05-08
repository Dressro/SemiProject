package com.project.fp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.Order_TableDto;

public class Order_TableDaoImpl extends SqlMapConfig implements Order_TableDao {

	private String namespace = "com.project.fp.order_table.";

	@Override
	public List<Order_TableDto> selectList() {

		List<Order_TableDto> list = new ArrayList<Order_TableDto>();

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "selectList");
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Order_TableDto> mypageList(String member_id) {

		List<Order_TableDto> list = new ArrayList<Order_TableDto>();

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "mypageList", member_id);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Order_TableDto> basketList(String member_id) {

		List<Order_TableDto> list = new ArrayList<Order_TableDto>();

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "basketList", member_id);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Order_TableDto> payList(Order_TableDto dto) {

		List<Order_TableDto> list = new ArrayList<Order_TableDto>();

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "payList", dto);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Order_TableDto> groupList() {

		List<Order_TableDto> list = new ArrayList<Order_TableDto>();

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "groupList");
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Order_TableDto group_del_select(int order_num) {

		Order_TableDto dto = null;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "group_del_select", order_num);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Order_TableDto selectOne(int order_num) {

		Order_TableDto dto = null;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "selectOne", order_num);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(Order_TableDto dto) {

		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "insert", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(Order_TableDto dto) {

		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace + "update", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update_group(Order_TableDto dto) {

		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace + "update_group", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int order_group) {

		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace + "delete", order_group);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<Order_TableDto> selectbasketList(String member_id) {

		List<Order_TableDto> list = new ArrayList<Order_TableDto>();

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "selectList", member_id);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Order_TableDto> selectpayList(String member_id) {

		List<Order_TableDto> list = new ArrayList<Order_TableDto>();

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "selectList", member_id);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int basket_insert(Order_TableDto dto) {

		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "basket_insert", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int mulDelete(int[] order_nums) {
		int count = 0;
		
		Map<String, int[]> map = new HashMap<String, int[]>();
		map.put("order_nums", order_nums);
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"mulDelete",map);
			if(count == order_nums.length) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return count;
	}
	
	public int multiDelete(int[] order_groups) {
		int count = 0;

		Map<String, int[]> map = new HashMap<String, int[]>();
		map.put("order_groups", order_groups);
		
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"multiDelete",map);
			if(count == order_groups.length) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}


	@Override
	public int direct_pay_insert(Order_TableDto dto) {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "direct_pay_insert", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update_pay(int order_num) {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace + "update_pay", order_num);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update_group_pay(Order_TableDto dto) {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace + "update_group_pay", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int selectMaxGroup() {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace + "selectMaxGroup");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
