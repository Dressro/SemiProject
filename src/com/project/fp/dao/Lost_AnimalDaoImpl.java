package com.project.fp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.Lost_AnimalDto;

public class Lost_AnimalDaoImpl extends SqlMapConfig implements Lost_AnimalDao {
	
	private String namespace = "com.project.fp.lost_animal.";

	@Override
	public List<Lost_AnimalDto> selectList() {
		List<Lost_AnimalDto> list = new ArrayList<Lost_AnimalDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Lost_AnimalDto selectOne(int board_no) {
		Lost_AnimalDto dto = null;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace+"selectOne", board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(Lost_AnimalDto dto) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(Lost_AnimalDto dto) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"update",dto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int board_no) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace+"delete",board_no);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int multiDelete(String[] board_nos) {
int count = 0;
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("board_nos", board_nos);
		
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"multiDelete",map);
			if(count == board_nos.length) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return count;

	}

}
