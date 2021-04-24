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
	public File_TableDto board_selectOne(int board_no) {
		return dao.board_selectOne(board_no);
	}
	
	@Override
	public int board_insert(File_TableDto dto) {
		int file_size_kb = Integer.parseInt(dto.getFile_size())/1024;
		int file_size_mb = (Integer.parseInt(dto.getFile_size())/1024)/1024;
		if(file_size_mb > 0) {
			dto.setFile_size(file_size_mb+"MB");
		}else if(file_size_kb > 0){
			dto.setFile_size(file_size_kb+"KB");
		}else {
			dto.setFile_size(dto.getFile_size()+"Byte");
		}
		return dao.board_insert(dto);
	}

	@Override
	public int animal_insert(File_TableDto dto) {
		return dao.animal_insert(dto);
	}

	@Override
	public int ch_insert(File_TableDto dto) {

		return dao.ch_insert(dto);
	}

	@Override
	public int update(File_TableDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int file_num) {

		return dao.delete(file_num);
	}

	@Override
	public int board_delete(int board_no) {
		
		return dao.board_delete(board_no);
	}

	

}
