package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.HospitalDto;
import com.project.fp.dto.PagingDto;

public class HospitalDaoImpl extends SqlMapConfig implements HospitalDao {

	private String namespace = "com.project.fp.hospital.";

	@Override
	public int count() {
		// TODO Auto-generated method stub
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)){
			res = session.selectOne(namespace+"hospital_allCount");
		}
		return res;
	}
	
	@Override
	public List<HospitalDto> selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		List<HospitalDto> list = new ArrayList<HospitalDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "hospital_selectList",Pdto);
		}
		return list;
	}

	@Override
	public List<HospitalDto> selectSearchList(HospitalDto dto) {
		// TODO Auto-generated method stub
		List<HospitalDto> list = new ArrayList<HospitalDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "hospital_search_selectList",dto);
		}
		return list;
	}

	@Override
	public int insert(HospitalDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace + "hospital_insert", dto);
			if (res > 0) {
				session.commit();
			}
		}
		return 0;
	}


}
