package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.File_TableDao;
import com.project.fp.dao.File_TableDaoImpl;
import com.project.fp.dto.File_TableDto;

public class File_TableBizImpl implements File_TableBiz {
	
	private File_TableDao dao = new File_TableDaoImpl();

	@Override
	public List<File_TableDto> selectList() {

		return dao.selectList();
	}

	@Override
	public File_TableDto selectOne(int file_num) {

		return dao.selectOne(file_num);
	}

	@Override
	public int insert(File_TableDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(File_TableDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int file_num) {

		return dao.delete(file_num);
	}

}
