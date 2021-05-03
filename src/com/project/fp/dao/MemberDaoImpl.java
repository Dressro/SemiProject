package com.project.fp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<MemberDto> selectDoctorList() {
		// TODO Auto-generated method stub
		List<MemberDto> list = new ArrayList<MemberDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "selectDoctorList");
		}
		return list;
	}

	@Override
	public MemberDto selectSerch(MemberDto dto) {
		// TODO Auto-generated method stub
		MemberDto m_dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			m_dto = session.selectOne(namespace + "selectSerch", dto);
		}
		return m_dto;
	}

	@Override
	public MemberDto selectIdSerch(MemberDto dto) {
		// TODO Auto-generated method stub
		MemberDto m_dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			m_dto = session.selectOne(namespace + "selectIdSerch", dto);
		}
		return m_dto;
	}

	@Override
	public MemberDto selectOne(MemberDto dto) {
		// TODO Auto-generated method stub
		MemberDto m_dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			m_dto = session.selectOne(namespace + "selectOne", dto);
		}
		return m_dto;
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
	public int delete(String member_id) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace + "delete", member_id);
			if (res > 0) {
				session.commit();
			}
		}
		return res;
	}

	@Override
	public int update(MemberDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace + "update", dto);
			if (res > 0) {
				session.commit();
			}
		}
		return res;
	}

	@Override
	public MemberDto selectDetail(String member_id) {
		MemberDto m_dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			m_dto = session.selectOne(namespace + "selectDetail", member_id);
		}
		return m_dto;
	}

	@Override
	public int grade_update(MemberDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "grade_update", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int mypageupdate(MemberDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace + "mypageupdate", dto);
			if (res > 0) {
				session.commit();
			}
		}
		return res;
	}

	@Override
	public int mypagemod(MemberDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace + "mypagemod", dto);
			if (res > 0) {
				session.commit();
			}
		}
		return res;
	}

	@Override
	public int myanimalupdate(MemberDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace + "myanimal_update", dto);
			if (res > 0) {
				session.commit();
			}
		}
		return res;
	}

}
