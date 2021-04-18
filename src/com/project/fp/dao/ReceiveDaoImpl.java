package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.ReceiveDto;

public class ReceiveDaoImpl extends SqlMapConfig implements ReceiveDao {
	
	private String namespace = "com.project.fp.receive";

	@Override
	public List<ReceiveDto> selectList() {
		
		List<ReceiveDto> list = new ArrayList<ReceiveDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace+"selectList");
		} catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ReceiveDto selectOne(int order_num) {
		
		ReceiveDto dto = null;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace+"selectOne", order_num);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(ReceiveDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"insert",dto);
			if (res > 0) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(ReceiveDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"update",dto);
			if (res > 0) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int order_num) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace+"delete",order_num);
			if (res > 0) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
