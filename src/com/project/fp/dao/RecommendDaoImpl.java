package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.RecommendDto;

public class RecommendDaoImpl extends SqlMapConfig implements RecommendDao {
	
	String namespace = "com.project.fp.recommend.";

	@Override
	public int insertRec(RecommendDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"insertRec",dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}


}
