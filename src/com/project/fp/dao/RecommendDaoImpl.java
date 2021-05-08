package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.ProductDto;
import com.project.fp.dto.RecommendDto;

public class RecommendDaoImpl extends SqlMapConfig implements RecommendDao {
	
	String namespace = "com.project.fp.recommend.";

	@Override
	public int insert(RecommendDto dto) {
		
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
	public RecommendDto selectOne(RecommendDto dto) {

		RecommendDto r_dto = null;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			r_dto = session.selectOne(namespace + "selectOne", dto);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return r_dto;
	}

	@Override
	public int update(RecommendDto dto) {
		int res = 0;

		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"update", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}


}
