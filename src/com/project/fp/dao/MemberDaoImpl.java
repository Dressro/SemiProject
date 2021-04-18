package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.MemberDto;

public class MemberDaoImpl extends SqlMapConfig implements MemberDao {

	String namespace = "com.project.fp.member.";

	@Override
	public List<MemberDto> selectList() {
		// TODO Auto-generated method stub
		List<MemberDto> list = new ArrayList<MemberDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "selectList");
		}
		return list;
	}

	@Override
	public MemberDto selectOne(String id) {
		// TODO Auto-generated method stub
		MemberDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "selectOne", id);
		}
		return dto;
	}

	@Override
	public int insert(MemberDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "insert", dto);
			if (res > 0) {
				session.commit();
			}
		}
		return res;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace + "delete", id);
			if (res > 0) {
				session.commit();
			}
		}
		return res;
	}

	@Override
	public int update(MemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
