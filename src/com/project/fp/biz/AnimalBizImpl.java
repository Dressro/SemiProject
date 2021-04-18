package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.AnimalDao;
import com.project.fp.dao.AnimalDaoImpl;
import com.project.fp.dto.AnimalDto;

public class AnimalBizImpl implements AnimalBiz {
	
	private AnimalDao dao = new AnimalDaoImpl();

	@Override
	public List<AnimalDto> selectList() {

		return dao.selectList();
	}

	@Override
	public AnimalDto selectOne(int animal_no) {

		return dao.selectOne(animal_no);
	}

	@Override
	public int insert(AnimalDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(AnimalDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int animal_no) {

		return dao.delete(animal_no);
	}

}
