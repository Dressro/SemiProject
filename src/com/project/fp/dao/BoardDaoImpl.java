package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.BoardDto;

public class BoardDaoImpl extends SqlMapConfig implements BoardDao {
	
	private String namespace = "com.project.fp.board.";

	@Override
	public List<BoardDto> selectList() {
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public BoardDto selectOne(int board_free_no) {
		
		BoardDto dto = null;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace+"selectOne",board_free_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(BoardDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"insert",dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(BoardDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"update",dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int board_free_no) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace+"delete", board_free_no);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
