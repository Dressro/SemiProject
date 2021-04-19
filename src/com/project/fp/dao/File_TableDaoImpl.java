package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.File_TableDto;

public class File_TableDaoImpl extends SqlMapConfig implements File_TableDao {
	
	private String namespace = "com.project.fp.file_table";

	@Override
	public List<File_TableDto> selectList() {
		
		List<File_TableDto> list = new ArrayList<File_TableDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace+"selectList");
		} catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public File_TableDto selectOne(int file_num) {
		
		File_TableDto dto = null;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace+"selectOne", file_num);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(File_TableDto dto) {
		
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
	public int update(File_TableDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"update", dto);
			if (res > 0) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int file_num) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace+"delete",file_num);
			if (res > 0) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
