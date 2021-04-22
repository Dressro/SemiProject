package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.HospitalDto;

public class HospitalDaoImpl extends SqlMapConfig implements HospitalDao {

	private String namespace = "com.project.fp.hospital.";
	@Override
	public List<HospitalDto> selectList() {
		// TODO Auto-generated method stub
		List<HospitalDto> list = new ArrayList<HospitalDto>();
		try(SqlSession session = getSqlSessionFactory().openSession(false)){
			list = session.selectList(namespace+"hospital_selectList");
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
