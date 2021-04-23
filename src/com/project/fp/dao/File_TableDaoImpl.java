package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.File_TableDto;

public class File_TableDaoImpl extends SqlMapConfig implements File_TableDao {

	private String namespace = "com.project.fp.File_Table.";

	@Override
	public List<File_TableDto> selectList() {

		List<File_TableDto> list = new ArrayList<File_TableDto>();

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public File_TableDto selectOne(int file_num) {

		File_TableDto dto = null;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "selectOne", file_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public File_TableDto board_selectOne(int board_no) {
		File_TableDto dto = null;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "board_selectOne", board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public int board_insert(File_TableDto dto) {

		int res = 0;
		System.out.println(dto.getAnimal_no());
		System.out.println(dto.getCh_num());
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "board_insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int animal_insert(File_TableDto dto) {

		int res = 0;
		System.out.println(dto.getAnimal_no());
		System.out.println(dto.getCh_num());
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "animal_insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int ch_insert(File_TableDto dto) {

		int res = 0;
		System.out.println(dto.getAnimal_no());
		System.out.println(dto.getCh_num());
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "ch_insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(File_TableDto dto) {
		return 0;
	}

	@Override
	public int delete(int file_num) {

		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace + "delete", file_num);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	

}
