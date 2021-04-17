package com.project.fp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import com.project.fp.dto.MemberDto;

public class MemberDaoImpl implements MemberDao {

	private SqlSessionFactory sqlSessionFactory;
	@Override
	public List<MemberDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto selectOne(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(MemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
